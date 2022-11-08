<template>
  <div class="page-body">
    <div class="container-fluid">
      <div class="page-header">
        <div class="row">
          <div class="col-sm-12"></div>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header pb-0">
              <h5>Company Management</h5>
            </div>
            <div class="card-body">
              <ul class="nav nav-tabs border-tab" id="top-tab" role="tablist">
                <li class="nav-item">
                  <a
                    class="nav-link active"
                    id="top-listing-tab"
                    data-bs-toggle="tab"
                    href="#company_listing"
                    role="tab"
                    aria-controls="top-home"
                    aria-selected="true"
                    ><i class="icofont icofont-listing-box"></i
                    ><label>Companies Listing</label></a
                  >
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    id="profile-add-tab"
                    data-bs-toggle="tab"
                    href="#add-company"
                    role="tab"
                    aria-controls="top-profile"
                    aria-selected="false"
                    ><i class="icofont icofont-ui-add"></i
                    ><label id="lbl-add-company">Add Company</label></a
                  >
                </li>
              </ul>
              <div class="tab-content" id="top-tabContent">
                <div
                  class="tab-pane fade show active"
                  id="company_listing"
                  role="tabpanel"
                  aria-labelledby="top-listing-tab"
                >
                  <div class="table-responsive">
                    <table class="display" id="example-style-1">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Company Name</th>
                          <th>Official Number</th>
                          <th>Registrant Number</th>
                          <th>Registrant Designation</th>
                          <th>Registrant Mobile</th>
                          <th>Status</th>
                          <th style="width: 12%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="item in companies" :key="item.company_id">
                          <td>{{ item.company_id }}</td>
                          <td>{{ item.company_name }}</td>
                          <td>{{ item.official_number }}</td>
                          <td>{{ item.registrant_number }}</td>
                          <td>{{ item.registrant_designation }}</td>
                          <td>{{ item.registrant_mobile }}</td>
                          <td>
                            <label
                              class="badge badge-primary"
                              v-if="item.status == 0"
                              >Active</label
                            ><label
                              class="badge badge-warning"
                              v-if="item.status == 1"
                              >Deactive</label
                            >
                          </td>
                          <td>
                            
                            <a
                              class="btn btn-primary btn-sm"
                              v-on:click="updatecompany(item.company_id)"
                              ><span class="fa fa-edit"></span
                            ></a>
                            &nbsp;
                            <a
                              class="btn btn-danger btn-sm"
                              v-on:click="deletecompany(item.company_id)"
                              ><span class="fa fa-trash"></span
                            ></a>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div
                  class="tab-pane fade"
                  id="add-company"
                  role="tabpanel"
                  aria-labelledby="profile-add-tab"
                >
                  <form  @submit.prevent="insertCompany">
                    <div class="row pb-2">
                      <div class="col-md-2">
                        <label>Company Name</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="text"
                          class="form-control"
                          id="company_name"
                          placeholder="Company Name"
                          v-model="company_name"
                          required
                        />
                      </div>
                      <div class="col-md-2">
                        <label>Official No</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="number"
                          class="form-control"
                          id="official_number"
                          v-model="official_number"
                          placeholder="Official No "
                          required
                        />
                      </div>
                    </div>
                    <div class="row pb-2">
                      <div class="col-md-2">
                        <label>Registrant No</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="number"
                          class="form-control"
                          id="registrant_number"
                          placeholder="Registrant Number"
                          v-model="registrant_number"
                          required
                        />
                      </div>
                      <div class="col-md-2">
                        <label>Registrant Designation</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          class="form-control"
                          id="registrant_designation"
                          v-model="registrant_designation"
                          placeholder="Registrant Designation"
                          required
                        />
                      </div>
                    </div>
                    <div class="row pb-2">
                      <div class="col-md-2">
                        <label>Registrant Mobile No</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="number"
                          class="form-control"
                          id="registrant_mobile"
                          v-model="registrant_mobile"
                          placeholder="Registrant Mobile No"
                          required
                        />
                        <input
                          class="form-control"
                          id="company_id"
                          v-model="company_id"
                          style="display: none"
                        />
                      </div>
                      <div class="col-md-2">
                        <label>Province</label>
                      </div>
                      <div class="col-md-4">
                        <select
                          class="form-control "
                          required
                          @change="getcities()"
                          v-model="province"
                        >
                          <option value="" disabled selected>--Select Province--</option>
                          <option
                            v-for="value in provinces"
                            :key="value.id"
                            :value="value.id"
                          >{{value.province_name}}</option>
                        </select>                       
                      </div>
                    </div>
                    <div class="row pb-2">
                      
                      <div class="col-md-2">
                        <label>City</label>
                      </div>
                      <div class="col-md-4">
                        <select
                          class="form-control "
                          required
                          v-model="city"
                        >
                          <option value="" disabled selected>--Select City--</option>
                          <option
                            v-for="value in cities"
                            :key="value.id"
                            :value="value.id"
                          >{{value.city_name}}</option>
                        </select>                       
                      </div>
                      <div class="col-md-2">
                        <label>Status</label>
                      </div>
                      <div class="col-md-4">
                        <select
                          v-model="status"
                          id="status"
                          class="form-control "
                          required
                        >
                        <option value="" disabled>--Select Status--</option>
                          <option value="0">Active</option>
                          <option value="1">Deactive</option>
                        </select>
                      </div>
                    </div>

                    <div class="row">
                      <div class="offset-md-4 col-md-4">
                        <button
                          class="btn btn-primary"
                          id="update_company"
                          type="submit"
                        >
                          Add Company
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import apiLink from "/api";
import axios from "axios";
import $ from "jquery";
export default {
  name: "CompanyApp",
  data() {
    return {
      companies: [],
      provinces: [],
      cities: [],
      allcities:[],
      province:'',
      city:'',
      company_name: "",
      official_number: "",
      registrant_number: "",
      registrant_designation: "",
      registrant_mobile: "",
      company_id: "",
      status: "",
    };
  },
  async created() {
    const response = await axios.get(apiLink.api + "companies");
    this.companies = response.data.companiesdata;

    const resp_province = await axios.get(apiLink.api + "provinces");
    this.provinces = resp_province.data.provinces;

    const resp_cities = await axios.get(apiLink.api + "cities");
    this.allcities = resp_cities.data.cities;

  },
  methods: {
    getcities(){
      let temp = []
      let index = 0
      this.city=''
      
      for(let i=0;i<this.allcities.length ; i++){
        if(this.province==this.allcities[i]['province_id']){
          temp[index]=this.allcities[i]
          index += 1
        }
      }
      console.log(temp);
      this.cities=temp

    },
    async insertCompany() {
      const formdata = [
        {
          company_name: this.company_name,
          official_number: this.official_number,
          registrant_number: this.registrant_number,
          registrant_designation: this.registrant_designation,
          registrant_mobile: this.registrant_mobile,
          company_id: this.company_id,
          status: this.status,
        },
      ];
      
      console.log(formdata[0].company_id);
      if (formdata[0].company_id) {console.log("form data  ", formdata);
        const response = await axios.put(apiLink.api + "companies", formdata);
        if (response.data.response == "Success!") {
          this.$toast.open({
          message: 'Company Updated Successfully',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
        }
      } else {
        const response = await axios.post(apiLink.api + "companies", formdata);
        if (response.data.response == "Success!") {
          console.log(response.data.response);
          this.$toast.open({
          message: 'Company Added Successfully',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
        }
      }
    },

    async deletecompany(id) {
      const formdata = [
        {
          company_id: id,
        },
      ];
      const response = await axios.patch(apiLink.api + "companies", formdata);
      if (response.data.response == "Success!") {
        this.$toast.open({
          message: 'Company Deleted ',
          type: 'error',
          position : 'top',
          dismissible: 'true',
      })   
      }
    },

    updatecompany(id) {
      var valObj = this.companies.filter(function (elem) {
        if (elem.company_id == id) return elem;
      });
      $("#profile-add-tab").addClass("active");
      $("#profile-add-tab")
        .attr("aria-selected", "true")
        .prop("selected", true);
      $("#top-listing-tab").removeClass("active");
      $("#top-listing-tab")
        .attr("aria-selected", "false")
        .prop("selected", false);
      $("#add-company").addClass("active show");
      $("#lbl-add-company").text("Update Company");
      $("#update_company").text("Update Company");
      $("#company_listing").removeClass("active show");
      this.company_name = valObj[0].company_name;
      this.official_number = valObj[0].official_number;
      this.registrant_number = valObj[0].registrant_number;
      this.company_id = valObj[0].company_id;
      this.registrant_designation = valObj[0].registrant_designation;
      this.registrant_mobile = valObj[0].registrant_mobile;
      this.status = valObj[0].status;
    },
  },
};
</script>


