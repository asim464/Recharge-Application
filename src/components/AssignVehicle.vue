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
              <h5>Assign Vehicles</h5>
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
                    ><label>Assign Vehicles to Fleet</label></a
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
                    ><label id="lbl-add-company">Assigned Vehicles List</label></a
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
                  <form @submit.prevent="assignVehicles">
                    <div class="row">
                      <div class="col-md-6">
                        <select
                            class="form-control form-control-primary btn-square"
                            multiple=""
                            v-model="vehicles_ids"
                            style="height: 120%"
                          >
                            <option
                              v-for="value in vehicles"
                              :key="value.vehicle_id"
                              :value="value.vehicle_id"
                            >{{value.vehicle_registration_no}}</option>
                        </select>               
                      </div>
                      <div class="col-md-6">
                        <select class="form-select" v-model="fleet_id">
                          <option value="">--Select--</option>
                          <option 
                            v-for="value in fleets"
                            :key="value.fleet_id"
                            :value="value.fleet_id"
                          >{{ value.fleet_name }}</option>
                        </select><br>
                        <div class="row">
                          <div class="col-md-4">
                            <button class="btn btn-primary" type="submit">Submit</button>
                          </div>

                        </div>
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
                  <div class="row">
                    <div class="col-md-6">
                      <select @change="getVehicles" id="ddlfleets" class="form-select" v-model="fleet_id">
                        <option value="">--Select--</option>
                        <option 
                          v-for="value in fleets"
                          :key="value.fleet_id"
                          :value="value.fleet_id"
                        >{{ value.fleet_name }}</option>
                      </select>
                    </div>
                  </div>
                  <br>
                  <div class="table-responsive">
                    <table class="display" id="example-style-1">
                      <thead>
                        <tr> 
                          <th>Serial</th>                         
                          <th>Vehicle Number</th>
                          <th>Vehicle Type</th>                          
                          <th>Vehicle Modal</th>
                          <th style="width: 12%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="item in vehiclesdata" :key="item.rel_id">
                          <td>{{ item.rel_id }}</td>
                          <td>{{ item.vehicle_registration_no }}</td>   
                          <td>{{ item.vehicle_type_id }}</td> 
                          <td>{{ item.vehicle_modal }}</td>      
                           <td>
                            <a
                              class="btn btn-danger btn-sm"
                              v-on:click="deletefleet(item.rel_id)"
                              ><span class="fa fa-trash"></span
                            ></a>
                          </td>                  
                        </tr>
                      </tbody>
                    </table>
                  </div>
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
  name: "AssignVehicle",
  data() {
    return {      
      fleets: [],
      vehicles: [],
      vehiclesdata: [],
      vehicles_ids: [],
      fleet_id: "",
      rel_id:"",
      company_id: localStorage.company_id,
      created_by: localStorage.user_id, 
      updated_by: localStorage.user_id    
    };
  },
  async created() {
    const formdata = [{
      "company_id" : this.company_id
    }]
    const response = await axios.get(apiLink.api + "fleet_management/" + this.company_id);
    this.fleets = response.data.fleetdata;

    const vehicles = await axios.post(apiLink.api + "registered_vehicles", formdata);
    this.vehicles = vehicles.data.vehicles;
    
  },
  methods: {
    async assignVehicles() {
      const formdata = [{
        vehicle_id: this.vehicles_ids,
        fleet_id: this.fleet_id,
        company_id: this.company_id,
        created_by: this.created_by,
        rel_id:this.rel_id,
      }]
      const response = await axios.post(apiLink.api + "fleet_relation", formdata);
      if (response.data.response == "Success!") {
        console.log(response.data.response);
        // window.location.reload();
        // alert("Record Insert Successfully");
        this.$toast.open({
          message: 'Record Inserted Successfully',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
      }
    },
    async getVehicles(){
      const fleet_id = $("#ddlfleets").val();
      const formdata = [{
        fleet_id : fleet_id
      }]
      const response = await axios.put(apiLink.api + "fleet_relation", formdata);
      this.vehiclesdata = response.data.fleetdata;  
    }, 
    async deletefleet(id)
     {
            const rel_id = id
            const formdata = [{                
                rel_id : rel_id
            }]
            const response = await axios.post(apiLink.api+'delete_relations', formdata);
            if (response.data.response == 'Success!'){
                // window.location.reload();
                // alert(" Deleted Successfully")
                this.$toast.open({
                message: 'Record Deleted ',
                type: 'error',
                position : 'top',
                dismissible: 'true',
      })
            }
        },
  },
};
</script>

<style>
</style>