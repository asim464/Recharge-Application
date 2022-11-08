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
              <h5>Fleet Management</h5>
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
                    ><label>Fleets Listing</label></a
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
                    ><label id="lbl-add-company">Add Fleet</label></a
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
                          <!-- <th>Company ID</th> -->
                          <th>ID</th>
                          <th>Fleet Name</th>
                          <th>No of Vehicles</th>
                          <th>Fleet Type</th>
                          <th>Status</th>
                          <!-- <th>Created at</th> -->
                          <th style="width: 12%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="item in fleets" :key="item.fleet_id">
                          <!-- <td>{{ item.company_id }}</td> -->
                          <td>{{ item.fleet_id }}</td>
                          <td>{{ item.fleet_name }}</td>
                          <td>{{ item.number_of_vehicles }}</td>
                          <td>{{ item.fleet_type }}</td>
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
                              v-on:click="updatefleet(item.fleet_id)"
                              ><span class="fa fa-edit"></span></a
                            >&nbsp;
                            <a
                              class="btn btn-danger btn-sm"
                              v-on:click="deletefleet(item.fleet_id)"
                              data-bs-original-title=""
                              title=""
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
                        <label>Fleet Name</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          class="form-control"
                          id="fleet_name"
                          v-model="fleet_name"
                          placeholder="Fleet Name"
                          required
                        />
                      </div>
                      <div class="col-md-2">
                        <label>Number of Vehicles</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="number"
                          class="form-control"
                          id="number_of_vehicles"
                          v-model="number_of_vehicles"
                          placeholder="Number Of Vehicles"
                          required
                        />
                      </div>
                    </div>
                    <div class="row pb-2">
                      <div class="col-md-2">
                        <label>Fleet Type</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          class="form-control"
                          id="fleet_type"
                          v-model="fleet_type" 
                          placeholder="Fleet Type"
                          required
                        />
                        <input
                          class="form-control"
                          id="fleet_id"
                          v-model="fleet_id"
                          style="display: none"
                        />
                        <input
                          class="form-control"
                          id="fleet_id"
                          v-model="company_id"
                          style="display: none"
                        />
                        <input
                          class="form-control"
                          id="fleet_id"
                          v-model="created_by"
                          style="display: none"
                        />
                         <input
                          class="form-control"
                          id="fleet_id"
                          v-model="updated_by"
                          style="display: none"
                        />
                      </div>

                      <div class="col-md-2">
                        <label>Status</label>
                      </div>
                      <div class="col-md-4">
                        <select
                          v-model="status"
                          id="status"
                          class="form-control"
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
                          id="update"
                          type="submit"
                        >
                          Add Fleet
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
  name: "AddFleet",
  data() {
    return {
      fleets: [],
      fleet_name: "",
      number_of_vehicles: "",
      fleet_type: "",
      fleet_id: "",
      company_id: localStorage.company_id,
      status: "",
      updated_by:"",
      created_by:""
    };
  },
  async created() {
    const response = await axios.get(apiLink.api + "fleet_management/" + this.company_id);
    this.fleets = response.data.fleetdata;
  },
  methods: {
    async insertCompany() {
      const formdata = [
        {
          fleet_name: this.fleet_name,
          number_of_vehicles: this.number_of_vehicles,
          fleet_type: this.fleet_type,
          company_id: this.company_id,
          fleet_id: this.fleet_id,
          status: this.status,
          updated_by: this.updated_by,
          created_by:localStorage.getItem("created_by"),
        },
      ];
      console.log(formdata[0].fleet_id);
      if (formdata[0].fleet_id) {
        console.log("updated");
        console.log("form data  ", formdata);
        const response = await axios.put(
          apiLink.api + "fleet_management",
          formdata
        );
        if (response.data.response == "Success!") {
          console.log(response.data.response);
          this.$toast.open({
          message: 'Fleet Updated Successfully',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
        }
      } else {
        console.log("inserted");
        const response = await axios.post(
          apiLink.api + "fleet_management",
          formdata
        );
        if (response.data.response == "Success!") {
          console.log(response.data.response);
          this.$toast.open({
          message: 'Fleet Added Successfully',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
        }
      }
    },

    async deletefleet(id) {
      const formdata = [
        {
          fleet_id: id,
        },
      ];
      const response = await axios.patch(
        apiLink.api + "fleet_management",
        formdata
      );
      if (response.data.response == "Success!") {
        console.log(response.data.response);
        
         this.$toast.open({
          message: 'Fleet Deleted ',
          type: 'error',
          position : 'top',
          dismissible: 'true',
      })
      }
    },

    updatefleet(id) {
      var valObj = this.fleets.filter(function (elem) {
        if (elem.fleet_id == id) return elem;
      });
      $("#profile-add-tab").addClass("active");
      $("#profile-add-tab").attr("aria-selected", "true").prop("selected", true);
      $("#top-listing-tab").removeClass("active");
      $("#top-listing-tab").attr("aria-selected", "false").prop("selected", false);
      $("#add-company").addClass("active show");
      $("#lbl-add-company").text("Update Fleet");
      $("#update").text("Update Fleet");
      $("#company_listing").removeClass("active show");
      this.fleet_name = valObj[0].fleet_name;
      this.number_of_vehicles = valObj[0].number_of_vehicles;
      this.fleet_type = valObj[0].fleet_type;
      this.status = valObj[0].status;
      this.fleet_id=valObj[0].fleet_id;
      this.company_id=valObj[0].company_id;
      this.created_by=valObj[0].created_by;
      this.updated_by=valObj[0].updated_by;
      // $("#company_name").val(valObj[0].company_name)

      console.log(valObj);
    },
  },
};
</script>

<style>
</style>