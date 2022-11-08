<template>
  <b-card-code>
    <!-- search input -->
    <div class="custom-search d-flex justify-content-end">
      <b-form-group>
        <div class="d-flex align-items-center">
          <label class="mr-1">{{ $t('message.seachLabel') }}</label>
          <b-form-input
            v-model="searchTerm"
            :placeholder=" $t('message.SearchPlaceholder')"
            type="text"
            class="d-inline-block"
          />
        </div>
      </b-form-group>
    </div>

    <!-- table -->
    <vue-good-table
      :columns="columns"
      :rows="rows"
      :rtl="direction"
      :search-options="{
        enabled: true,
        externalQuery: searchTerm }"
     
      :pagination-options="{
        enabled: true,
        perPage:pageLength
      }"
    >

      <!-- Slot: Table Column -->
      <template
        slot="table-column"
        slot-scope="props"
      >
        <span
          v-if="props.column.label ==='Name'"
          class="text-nowrap"
        >
          {{ $t('message.tableHeader.name') }}
        </span>
        <span
          v-else-if="props.column.label ==='official_number'"
          class="text-nowrap"
        >
          {{ $t('message.tableHeader.official_number') }}
        </span>
        <span
          v-else-if="props.column.label ==='registrant_number'"
          class="text-nowrap"
        >
          {{ $t('message.tableHeader.registrant_number') }}
        </span>
        <span
          v-else-if="props.column.label ==='registrant_designation'"
          class="text-nowrap"
        >
          {{ $t('message.tableHeader.registrant_designation') }}
        </span>
        <!-- <span
          v-else-if="props.column.label ==='Status'"
          class="text-nowrap"
        >
          {{ $t('message.tableHeader.status') }}
        </span> -->
        <span
          v-else-if="props.column.label ==='Action'"
          class="text-nowrap"
        >
          {{ $t('message.tableHeader.action') }}
        </span>
        <span v-else>
          {{ props.column.label }}
        </span>
      </template>

      <!-- Slot: Table Row -->
      <template
        slot="table-row"
        slot-scope="props"
      >

        <!-- Column: Name -->
        <span
          v-if="props.column.field === 'company_name'"
          class="text-nowrap"
        >
          <!-- <b-avatar
            :src="props.row.avatar"
            class="mx-1"
          /> -->
          <span>{{ props.row.company_name }}</span>
        </span>

        <!-- Column: Status -->
        <!-- <span v-else-if="props.column.field === 'status'">
          <b-badge :variant="statusVariant(props.row.status)">
            {{ props.row.status }}
          </b-badge>
        </span> -->

        <!-- Column: Action -->
        <span v-else-if="props.column.field === 'action'">
          <span>
            <b-dropdown
              variant="link"
              toggle-class="text-decoration-none"
              no-caret
            >
              <template v-slot:button-content>
                <feather-icon
                  icon="MoreVerticalIcon"
                  size="16"
                  class="text-body align-middle mr-25"
                />
              </template>
              <b-dropdown-item>
                <feather-icon
                  icon="Edit2Icon"
                  class="mr-50"
                />
                <span>Edit</span>
              </b-dropdown-item>
              <b-dropdown-item>
                <feather-icon
                  icon="TrashIcon"
                  class="mr-50"
                />
                <span>Delete</span>
              </b-dropdown-item>
            </b-dropdown>
          </span>
        </span>

        <!-- Column: Common -->
        <span v-else>
          {{ props.formattedRow[props.column.field] }}
        </span>
      </template>

      <!-- pagination -->
      <template
        slot="pagination-bottom"
        slot-scope="props"
      >
        <div class="d-flex justify-content-between flex-wrap">
          <div class="d-flex align-items-center mb-0 mt-1">
            <span class="text-nowrap">
              {{ $t('message.pagelength') }}
            </span>
            <b-form-select
              v-model="pageLength"
              :options="['3','5','10']"
              class="mx-1"
              @input="(value)=>props.perPageChanged({currentPerPage:value})"
            />
            <span class="text-nowrap">  {{ $t('message.of') }} {{ props.total }} {{ $t('message.pageText2') }} </span>
          </div>
          <div>
            <b-pagination
              :value="1"
              :total-rows="props.total"
              :per-page="pageLength"
              first-number
              last-number
              align="right"
              prev-class="prev-item"
              next-class="next-item"
              class="mt-1 mb-0"
              @input="(value)=>props.pageChanged({currentPage:value})"
            >
              <template #prev-text>
                <feather-icon
                  icon="ChevronLeftIcon"
                  size="18"
                />
              </template>
              <template #next-text>
                <feather-icon
                  icon="ChevronRightIcon"
                  size="18"
                />
              </template>
            </b-pagination>
          </div>
        </div>
      </template>
    </vue-good-table>
  </b-card-code>
</template>

<script>
import BCardCode from '@core/components/b-card-code/BCardCode.vue'
import {
  BAvatar, BBadge, BPagination, BFormGroup, BFormInput, BFormSelect, BAlert, BDropdown, BDropdownItem,
} from 'bootstrap-vue'
import { VueGoodTable } from 'vue-good-table'
import store from '@/store/index'
import { codeI18n } from './code'

export default {
  components: {
    BCardCode,
    VueGoodTable,
    BAvatar,
    BBadge,
    BPagination,
    BFormGroup,
    BFormInput,
    BFormSelect,
    BAlert,
    BDropdown,
    BDropdownItem,
  },
 
  data() {
    return {
      pageLength: 5,
      codeI18n,
      dir: false,
      columns: [
        {
          label: 'Company Name',
          field: 'company_name',
        },
        {
          label: 'Company Phone Number',
          field: 'official_number',
        },
        {
          label: 'Registrant No',
          field: 'registrant_number',
        },
        {
          label: 'Registrant Designation',
          field: 'registrant_designation',
        },
        {
          label: 'Registrant Mobile No',
          field: 'registrant_mobile',
        },
        // {
        //   label: 'Status',
        //   field: 'status',
        // },
        {
          label: 'Action',
          field: 'action',
        },
      ],
      rows: [],
      searchTerm: '',

    }
  },
  
  computed: {
    
    direction() {
      if (store.state.appConfig.isRTL) {
        // eslint-disable-next-line vue/no-side-effects-in-computed-properties
        this.dir = true
        return this.dir
      }
      // eslint-disable-next-line vue/no-side-effects-in-computed-properties
      this.dir = false
      return this.dir
    },
  },
  created() {
    fetch("http://10.0.107.221:5000/companies",{
          method:"GET",
      }).then(
        (response) => {
          response.json().then((data) => {
          console.log(data.companiesdata); 
          this.rows = data.companiesdata
          });      
        },
        (err) => {
          console.log(err);
        }
      );
    
  },
}
</script>
