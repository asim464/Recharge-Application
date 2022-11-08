<template>
  <b-card-code title="Add Company">
    <b-tabs content-class="mt-1">
      <!-- This tabs content will always be mounted -->
      <b-tab title="Company Listing">
        <div class="alert-body">
          <good-table-advance-search />
        </div>
      </b-tab>

      <!-- This tabs content will not be mounted until the tab is shown -->
      <!-- and will be un-mounted when hidden -->
      <b-tab title="Add Company" lazy class="p-2">
        <div class="alert-body">
          <form class="form form-horizontal">
            <div class="row">
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Company Name</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="company_name"
                      v-model="company.company_name"
                      class="form-control"
                      name="fname"
                      placeholder="Company Name"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Official Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="official_number"
                      class="form-control"
                      v-model="company.official_number"
                      name="official_number"
                      placeholder="Official Number"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Registrant Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="registrant_number"
                      v-model="company.registrant_number"
                      class="form-control"
                      name="registrant_number"
                      placeholder="Registrant Number"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Registrant Designation</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="registrant_designation"
                      v-model="company.registrant_designation"
                      class="form-control"
                      name="registrant_designation"
                      placeholder="Registrant Designation"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Registrant Mobile Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="registrant_mobile"
                      v-model="company.registrant_mobile"
                      class="form-control"
                      name="registrant_mobile"
                      placeholder="Registrant Mobile Number"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Province</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="City"
                      class="form-control"
                      name="contact"
                      placeholder="Select Province"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>City</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="Province"
                      class="form-control"
                      name="Province"
                      placeholder="City"
                    />
                  </div>
                </div>
              </div>
             
              <div class="col-sm-9 offset-sm-3">
                <button @click="onCreateUser" type="submit" rippleEffect class="btn btn-primary mr-1">Submit</button>
                <!-- <button type="reset" rippleEffect class="btn btn-outline-secondary">Reset</button> -->
              </div>
            </div>
          </form>
        </div>
      </b-tab>

    <b-tab title="Update Company" lazy class="p-2">
        <div class="alert-body">
          <form class="form form-horizontal">
            <div class="row">
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Company Name</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="company_name"
                      v-model="updateCompany.company_name"
                      class="form-control"
                      name="fname"
                      placeholder="Company Name"
                    />
                  </div>
                </div>
              </div>
               <!-- <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Company ID</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="company_id"
                      class="form-control"
                      v-model="updateCompany.company_id"
                      name="Company_id"
                      placeholder="Company ID"
                    />
                  </div>
                </div>
              </div> -->
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Official Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="official_number"
                      class="form-control"
                      v-model="updateCompany.official_number"
                      name="official_number"
                      placeholder="Official Number"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Registrant Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="registrant_number"
                      v-model="updateCompany.registrant_number"
                      class="form-control"
                      name="registrant_number"
                      placeholder="Registrant Number"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Registrant Designation</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="registrant_designation"
                      v-model="updateCompany.registrant_designation"
                      class="form-control"
                      name="registrant_designation"
                      placeholder="Registrant Designation"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Registrant Mobile Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="registrant_mobile"
                      v-model="updateCompany.registrant_mobile"
                      class="form-control"
                      name="registrant_mobile"
                      placeholder="Registrant Mobile Number"
                    />
                  </div>
                </div>
              </div>
              <!-- <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Status</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="registrant_mobile"
                      v-model="updateCompany.status"
                      class="form-control"
                      name="registrant_mobile"
                      placeholder="0"
                    />
                  </div>
                </div> -->
              <!-- </div> -->
              <!-- <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>City</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="City"
                      class="form-control"
                      name="contact"
                      placeholder="City"
                    />
                  </div>
                </div>
              </div> -->
              <!-- <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Province</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="Province"
                      class="form-control"
                      name="Province"
                      placeholder="Province"
                    />
                  </div>
                </div>
              </div> -->
             
              <div class="col-sm-9 offset-sm-3">
                <button @click="onUpdateUser" type="submit" rippleEffect class="btn btn-primary mr-1">Update</button>
                <!-- <button type="reset" rippleEffect class="btn btn-outline-secondary">Reset</button> -->
              </div>
            </div>
          </form>
        </div>
      </b-tab>


    </b-tabs>
  </b-card-code>
</template>

<script>
import BCardCode from "@core/components/b-card-code";
import GoodTableAdvanceSearch from "./CompanyTable.vue";
import { BTabs, BTab, BAlert } from "bootstrap-vue";
import { codeLazy } from "./code";
import { methods } from 'vue-echarts';

export default {
  components: {
    BCardCode,
    BTabs,
    BTab,
    BAlert,
    GoodTableAdvanceSearch
  },
  data() {
    return {
      codeLazy,
      updateCompany: 
        {
        company_id: "1",
        company_name: "",
        official_number: "",
        registrant_number: "",
        registrant_designation: "",
        registrant_mobile:"",
        status:"0"

      },
    
      company: {
        company_id: "1",
        company_name: "",
        official_number: "",
        registrant_number: "",
        registrant_designation: "",
        registrant_mobile:"",
        status:""
      },
    }
    },
    methods:{
     onCreateUser() {
      console.log("company data" + this.company);
      fetch("http://10.0.107.221:5000/companies", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(this.company),
      }).then(
        (response) => {
          console.log(response);
          console.log(response.body);
          response.json().then((data) => {
            console.log(data);
            this.onReset();
            this.fetchUsers();
            this.createAlert("success", "Company Added Successully");
          });
        },
        (err) => {
          console.log(err);
        }
      );
    },
    },
   onUpdateUser() {
      console.log("update company" + this.updateCompany);
      fetch("http://10.0.107.221:5000/companies", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(this.updateCompany),
      }).then(
        (response) => {
          response.json().then((data) => {
            console.log(data);
            this.onReset();
            this.fetchUsers();
            this.createAlert("success", "User Updated Successully");
          });
        },
        (err) => {
          console.log(err);
        }
      );
    },
  }
 

</script>
<style lang="scss" >
@import "@core/scss/vue/libs/vue-good-table.scss";
</style>
