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
              <h5>M-TAG Register</h5>
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
                    ><label>M-TAG Registration</label></a
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
                    ><label id="lbl-add-company"
                      >Test Registered M-TAG</label
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
                  <form @submit.prevent="OnSearch">
                    <!-- Vehicles Row -->
                    <div class="row" id="ddlVehicle">
                      <div class="col-md-2">
                        <label>MTAG:</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          class="form-control"
                          type="text"
                          v-model="mtag_token"
                          disabled
                        />
                      </div>
                      <div class="col-md-2" id="btnn">
                        <button class="btn btn-primary" type="submit">
                          Burn Tag
                        </button>
                      </div>
                    </div>
                  </form>
                  <form @submit.prevent="bindTag">
                    <!-- Vehicles Row -->
                    <div class="row" id="ddlVehicle">
                      <div class="col-md-2">
                        <label>Select Vehicle:</label>
                      </div>
                      <div class="col-md-4">
                        <select class="form-control" v-model="vehicle_id">
                          <option value="" selected disabled>
                            --Select Vehicle--
                          </option>
                          <option
                            v-for="value in vehicles"
                            :key="value.vehicle_id"
                            :value="value.vehicle_id"
                          >
                            {{ value.vehicle_registration_no }}
                          </option>

                          >
                        </select>
                      </div>
                      <div class="col-md-4" id="btnn">
                        <button class="btn btn-primary" type="submit">
                          Bind Tag
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
                <div
                  class="tab-pane fade"
                  id="add-company"
                  role="tabpanel"
                  aria-labelledby="profile-add-tab"
                >
                  <form @submit.prevent="testTag">
                    <!-- Vehicles Row -->
                    <div class="row" id="ddlVehicle">
                      <div class="col-md-2">
                        <label>MTAG:</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          class="form-control"
                          type="text"
                          v-model="read_tag"
                          disabled
                        />
                      </div>
                      <div class="col-md-4" id="btnn">
                        <button class="btn btn-primary" type="submit">
                          Test Tag
                        </button>
                      </div>
                    </div>

                    <div class="table-responsive">
                      <table class="table table-hover">
                        <thead>
                          <tr>
                            <th scope="col">MTAG ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">CNIC</th>
                            <th scope="col">Mobile Number</th>
                            <th scope="col">Vehicle Number</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr
                            v-for="item in vehicle_data"
                            :key="item.vehicle_id"
                          >
                            <td>{{ item.vehicle_id }}</td>
                            <td>{{ item.vehicle_owner_name }}</td>
                            <td>{{ item.vehicle_owner_cnic }}</td>
                            <td>{{ item.owner_mobile_no }}</td>
                            <td>{{ item.vehicle_registration_no }}</td>
                          </tr>
                        </tbody>
                      </table>
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
// import $ from "jquery";
export default {
  name: "MtagApp",
  data() {
    return {
      vehicles: [],
      vehicle_data: [],
      vehicle_id: "",
      mtag_token: "",
      read_tag: "",
    };
  },
  async created() {
    const response = await axios.get(apiLink.api + "mtag_vehicle_list");
    this.vehicles = response.data.vehicles;
  },
  methods: {
    vehicleddchange() {
      alert("Something");
    },
    async OnSearch() {
      const response = await axios.post(apiLink.api + "write");

      console.log(response);
      if (response.status == 201) {
        this.mtag_token = response.data.TAG_VALUE;
      }
    },
    async bindTag() {
      const formdata = {
        vehicle_id: this.vehicle_id,
        mtag_token: this.mtag_token,
      };
      console.log(formdata);
      const response = await axios.post(apiLink.api + "mtag_binding", formdata);
      if (response.status== 201) {
        this.$toast.open({
          message: "TAG Bind Successfully",
          type: 'success',
          position: 'top',
          dismissible: 'true',
        })
      }
    },
    async testTag() {
      const response = await axios.get(apiLink.api + "test_mtag");
      this.vehicle_data=response.data.vehicle_data;
      this.read_tag = response.data.vehicle_data[0].mtag_token;
      // console.log(this.read_tag);
      if (response.status==201) {
        this.$toast.open({
          message: "Record found ",
          type: "success",
          position : "top",
          dismissible: "true",
        })
      }
    },
  },
};
</script>
  
  
  