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
              <h5>Complaint Portal</h5>
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
                    ><label>Complaints Listing</label></a
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
                    ><label id="lbl-add-company">Register Complaints</label></a
                  >
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    id="profile-add-tab"
                    data-bs-toggle="tab"
                    href="#resolution-company"
                    role="tab"
                    aria-controls="top-profile"
                    aria-selected="false"
                    ><i class="icofont icofont-checked"></i
                    ><label id="lbl-add-company"
                      >Complaints Resolution</label
                    ></a
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
                          <!-- <th>ID</th> -->
                          <th>NAME</th>
                          <th>CNIC</th>
                          <th>MTag ID</th>
                          <!-- <th>User Type</th> -->
                          <th>Vehicle Number</th>
                          <th>Mobile Number</th>
                          <th>Status</th>
                          <!-- <th style="width: 12%">Action</th> -->
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="item in userdata" :key="item.user_id">
                          <!-- <td>{{ item.user_id }}</td> -->
                          <td>{{ item.username }}</td>
                          <td>{{ item.email }}</td>
                          <td>{{ item.role_id }}</td>
                          <td>{{ item.mobile_number }}</td>
                          <td>{{ item.role_id }}</td>
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
                          <!-- <td>
                            <a
                              class="btn btn-primary btn-sm"
                              v-on:click="updateuser(item.user_id)"
                              ><span class="fa fa-edit"></span
                            ></a>
                            &nbsp;
                            <a
                              class="btn btn-danger btn-sm"
                              v-on:click="deleteuser(item.user_id)"
                              ><span class="fa fa-trash"></span
                            ></a>
                          </td> -->
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div
                  class="tab-pane fade"
                  id="resolution-company"
                  role="tabpanel"
                  aria-labelledby="profile-add-tab"
                >
                  <div class="table-responsive invoice-table" id="table">
                    <table class="table table-bordered table-striped">
                      <tbody>
                        <tr>
                          <td class="item">
                            <h6 class="p-2 mb-0">Complaints</h6>
                          </td>
                          <td class="Hours">
                            <h6 class="p-2 mb-0">Status</h6>
                          </td>
                          <td class="Rate">
                            <h6 class="p-2 mb-0">Action</h6>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <label>Lorem Ipsum</label>
                            <p class="m-0">
                              Lorem Ipsum is simply dummy text of the printing
                              and typesetting industry.
                            </p>
                          </td>
                          <td>
                            <p class="itemtext digits">Resolved</p>
                          </td>
                          <td>
                            <p class="itemtext digits">Edit</p>
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
                
                  <form class="card" @submit.prevent="OnSearch" >
                    <div class="card-body" >
                    <div class="row" >
                     <div class="col-md-2" >
                          <label class="form-label">MTAG Id:</label>
                        </div>
                        <div class="col-md-2">
                          <input
                            class="form-control"
                            type="number"
                            @focus="onMtag()"
                            placeholder="MTAG ID"
                            v-model="mtagid"
                            required
                          />
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <div class="col-md-2" id="search"  >
                          <button
                            class="btn btn-primary"
                            type="submit"
                          >
                            Search
                          </button>
                        </div>
                      </div>

                      <div class="row" id="details" hidden>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label class="form-label">CNIC</label>
                            <input
                              class="form-control"
                              type="text"
                              placeholder="CNIC"
                              v-model="vehicle_owner_cnic"
                              disabled
                            />
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input
                              class="form-control"
                              type="text"
                              placeholder="Name"
                              v-model="vehicle_owner_name"
                              disabled
                            />
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label class="form-label">Mobile Number </label>
                            <input
                              class="form-control"
                              type="number"
                              placeholder="Mobile Number"
                              v-model="owner_mobile_no"
                              disabled
                            />
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label class="form-label">Vehicle Number </label>
                            <input
                              class="form-control"
                              type="text"
                              placeholder="Vehicle Number"
                              v-model="vehicle_registration_no"
                              disabled
                            />
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mb-3">
                            <label class="form-label">Complaint Type </label>
                            <select
                              class="form-control"
                              type="number"
                              placeholder="Mobile Number"
                              >
                              <option value="">--Complaint Type--</option>
                              <option value="">Vehicle Information  </option>
                              <option value="">Vehicle Owner Information</option>
                              <option value="">Lost and Found MTag</option>
                              <option value="">Balance Resolution</option>
                              <option value="">MTag Transfer</option>
                              </select>
                          </div>
                        </div>

                        <div class="col-md-12">
                          <div>
                            <label class="form-label">Enter Complaint</label>
                            <textarea
                              class="form-control"
                              rows="5"
                              placeholder="Please Describle Your Complaint InDetail"
                            ></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-footer text-center" id="button" hidden>
                      <button class="btn btn-primary" type="submit">
                        Submit
                      </button>
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
  name: "ComplaintApp",
  data() {
    return {
      det: Boolean,
      companiesdata: [],
      fleets: [],
      vehicles: [],
      vehicle_data:[],
      vehicle_registration_no:"",
      vehicle_owner_name:"",
      vehicle_owner_cnic:"",
      owner_mobile_no:"",
      mtagid:"",
      vehiclesdata: [],
      vehicles_ids: [],
      fleet_id: "",
      company_id: "",
      created_by: localStorage.user_id,
      updated_by: localStorage.user_id,
    };
  },
  async created() {
    // const response = await axios.get(apiLink.api + "user");
    // this.userdata = response.data.userdata;

    // const res = await axios.get(apiLink.api + "user_roles");
    // this.rolesdata = res.data.roledata;

    // const comp_res = await axios.get(apiLink.api + "companies");
    // this.companiesdata = comp_res.data.companiesdata;

    // const centers_res = await axios.get(apiLink.api + "reg_centers");
    // this.reg_centers = centers_res.data.reg_centers;
  },

  methods: {
    async OnSearch() {
      const formdata =[{
        vehicle_id: this.mtagid
      }];
      console.log(formdata);
      const response = await axios.post(apiLink.api + "vehicle_search",formdata);
      if (response.status == 201){
      this.vehicle_data = response.data.vehicle_data[0];
      this.vehicle_registration_no = response.data.vehicle_data[0].vehicle_registration_no;
      this.vehicle_owner_name = response.data.vehicle_data[0].vehicle_owner_name;
      this.owner_mobile_no = response.data.vehicle_data[0].owner_mobile_no;
      this.vehicle_owner_cnic = response.data.vehicle_data[0].vehicle_owner_cnic;
      $("#details").attr("hidden", false);
      $("#button").attr("hidden", false);
      $("#search").attr("hidden", true);
      
      
      }
      else{
        this.$toast.open({
          message: 'No Vehicle Found',
          type: 'error',
          position : 'top',
          dismissible: 'true',
      })
      }
       
    },
    onMtag() {
      $("#details").attr("hidden", true);
      $("#search").attr("hidden", false);
      $("#button").attr("hidden", true);
    },
    
  
  },
};
</script>

<style>
#details {
  padding-top: 50px;
}

</style>