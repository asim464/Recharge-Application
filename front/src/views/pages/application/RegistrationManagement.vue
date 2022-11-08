<template>
  <b-card-code title="MTAG Registration">
    <b-tabs content-class="mt-1">
      
      <b-tab title="Vehicle Registration Info" lazy class="p-2">
        <div class="alert-body">
          <form class="form form-horizontal">
              <div class="col" >
                  
                <div  id="video" style="height:360px; width: 635px; float:right;">
                    <div>
                        <!-- <img src="../assets/video1.png" alt="Video Image" style="width: 40px; height: 40px;"> -->
                        <h4 style="font-weight: bold;  color: #0E0E50"  >LIVE VIDEO</h4>
                    </div>
                    
                        <div id="videoImage" style="height:360px; width: 635px;">
                            <iframe sandbox="allow-forms allow-scripts allow-pointer-lock allow-same-origin allow-top-navigation allow-presentation" class="embed-responsive-item" width="100%" height="100%" allowfullscreen="allowfullscreen" 
                                :src="this.liveVideo">
                            </iframe>
                        </div>
                         <div class="media">
                            <!-- <img src="../assets/images/dashboard/anpr1.png" alt="ANPR Image" style="width: 40px; height: 40px;" class="mt-1"> -->
                            <h5 style="font-weight: bold; font-size: 20px; color: #0E0E50" class="titleOnCard pt-1 pl-1">ANPR Image</h5>
                        </div>
                        <div id="ANPRImagesDiv" class="d-flex flex-column flex-sm-row justify-content-around align-items-center mb-2">
                            <div>
                                <div class="media">
                                    <feather type="image" stroke-width="2" class="text-danger pt-2 mr-1"></feather>
                                    <h5 class="pt-2">Vehicle Image</h5>
                                </div>
                                <div class="media-body rounded" data-toggle="modal" data-target="#imageZoomModal">
                                    <center>
                                        <img id="vehicleImage" alt="vehicle image" class="veh_thumbnail hoverImage" @click="zoomImage('vehicle')" :src="carImage" />
                                    </center>
                                </div>
                            </div>
                            <div>
                                <div class="media">
                                    <feather type="hash" stroke-width="2" class="text-danger pt-2 mr-1"></feather>
                                    <h5 class="pt-2"><span id="anprDivNumberPlateLabel">Vehicle </span>Number Plate</h5>
                                </div>
                                <div class="media-body rounded" data-toggle="modal" data-target="#imageZoomModal">
                                    <center>
                                        <img id="vehicleNumberPlate"  alt="number plate image" class="veh_thumbnail hoverImage" @click="zoomImage('numberPlate')" :src="this.plateImage"/>
                                    </center>
                                </div>
                            </div>
                        </div>
                        <center class="mt-4 pt-2" style="font-size: 1.2em;">
                            <div class="py-2 w-100 text-center font-weight-bold" style="background-color: #f4f4f4; border-radius: 7px; border: 2px solid #eeeeee;">
                                <span>Detected Vehicle Number Plate: </span>
                                <span class="text-danger" id="vehNumber">{{vehNumber}}</span>
                            </div>
                        </center>
                    </div> 
                </div>
            
            <div class="col">
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Vehicle Owner's CNIC </label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="first-name"
                      class="form-control"
                      v-model="registration.vehicle_owner_cnic"
                      name="fname"
                      placeholder="_____- _______- _"
                    />
                  </div>
                </div>
              </div>

               <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>M tag Token </label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="first-name"
                      class="form-control"
                      v-model="registration.m_tag_token"
                      name="fname"
                      placeholder="M tag Token"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Vehicle Made</label>
                  </div>
                  <div class="col-sm-9">
                    <v-select
                      v-model="vehicleMadeIdSelected"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      label="made_name"
                      :options="vehicleMadeIdOptions"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Vehicle Registration Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.vehicle_registration_no"                      
                      placeholder="Vehicle Registration Number"
                    />
                  </div>
                </div>
              </div>

              <div class="col-sm-6 ">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label> Vehicle Owner's Name</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.vehicle_owner_name"                      
                      placeholder="Vechile Owner's Name"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Owner's Mobile Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.owner_mobile_no"
                      name="contact"
                      placeholder="Enter Owner's Phone Number"
                    />
                  </div>
                </div>
              </div>

                 <!-- <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Created by</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.created_by"
                      name="contact"
                      placeholder=""
                    />
                  </div>
                </div>
              </div> -->
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Vehicle Registration Year</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="number"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.vehicle_modal"
                      name="contact"
                      placeholder="Vehicle Registration Year"
                    />
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Chasis Number</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.vehicle_chasis_no"
                      name="contact"
                      placeholder="Vehicle Chasis Number"
                    />
                  </div>
                </div>
              </div>

               <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Vehicle Color</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.vehicle_color"
                      name="contact"
                      placeholder="Enter Vehicle's Color "
                    />
                  </div>
                </div>
              </div>
              
              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Vehicle Class</label>
                  </div>
                  <div class="col-sm-9">
                    <v-select
                      v-model="vehicleClassIdSelected"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      label="vehicle_class"
                      :options="vehicleClassIdOptions"
                    />
                  </div>
                </div>
              </div>



               <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Vehicle Type</label>
                  </div>
                  <div class="col-sm-9">
                    <v-select
                      v-model="vehicleTypeIdSelected"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      label="type_name"
                      :options="vehicleTypeIdOptions"
                    />
                  </div>
                </div>
              </div>
                <!-- <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Registration Center ID</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.reg_center_id"
                      name="contact"
                      placeholder="Enter Registration Center ID "
                    />
                  </div>
                </div>
              </div> -->

              <div class="col-6">
                <div class="form-group row">
                  <div class="col-sm-3 col-form-label">
                    <label>Driver's Licencse</label>
                  </div>
                  <div class="col-sm-9">
                    <input
                      type="text"
                      id="contact-info"
                      class="form-control"
                      v-model="registration.drivers_license"
                      name="contact"
                      placeholder="Driver License Number"
                    />
                  </div>
                </div>
              </div>

              <div class="col-sm-9 offset-sm-3">
                <button type="submit" rippleEffect class="btn btn-primary mr-1">Submit</button>
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
// import GoodTableAdvanceSearch from "./CompanyTable.vue";
import { BTabs, BTab, BAlert,BRow, BCol, BFormGroup  } from "bootstrap-vue";
import { codeLazy } from "./code";
import vSelect from 'vue-select'
import VueSelect from '@/views/forms/form-element/vue-select/VueSelect.vue';

export default {
  components: {
    BCardCode,
    BTabs,
    BTab,
    BAlert,
    // GoodTableAdvanceSearch
    BRow,
    BCol,
    BFormGroup,
    vSelect,
    VueSelect,
  },
    data() {
    return {
      codeLazy,
      edit: false,
      carImage: '',
      plateImage:'',
      vehNumber:'',
      registration:{ 
        "vehicle_registration_no" : '',
        "vehicle_made_id":"1",
        "vehicle_modal":'',
        "vehicle_color":"",
        "vehicle_type_id":"1",
        "owner_mobile_no":"",
        "vehicle_owner_name":" ",
        "vehicle_owner_cnic":"",
        "reg_center_id":"1",
        "is_company":"0",
        "company_id":"0",
        "owner_mobile_sec" :"0",
        "vehicle_owner_address":"",
        "remarks":"something",
        "vehicle_engine_no":"",
        "province_id":"1",
        "city_id":"1",
        "drivers_license":"",
        "m_tag_token":"",
        "vehicle_chasis_no":"",
        "vehicle_class_id":"1",    
        "expiry_date":"2023-04-12",
        "tag_type_id":"1",
        "created_by":"1"    
      },
      liveVideo:"http://10.0.107.221:5000/video",
      vehicleMadeIdSelected: {},
      vehicleMadeIdOptions: [],
      vehicleTypeIdSelected: {},
      vehicleTypeIdOptions: [],
      vehicleClassIdSelected: {},
      vehicleClassIdOptions: [],
    }
  },
  created(){

    fetch("http://10.0.107.221:5000/made_type_class",{
          method:"GET",
      }).then(
        (response) => {
          response.json().then((data) => {
            console.log(data);
          this.vehicleMadeIdOptions = data['vehicle_made'];
          this.vehicleClassIdOptions = data['vehicle_class'];
          this.vehicleTypeIdOptions = data['vehicle_type'];
          });      
        },
        (err) => {
          console.log(err);
        }
      );

    console.log("registration data" + this.registration);
      fetch("http://10.0.107.221:5000/register_vehicle", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(this.registration),
      }).then(
        (response) => {
          console.log(response);
          console.log(response.body);
          response.json().then((data) => {
            console.log(data);
            this.onReset();
            this.fetchUsers();
            this.createAlert("Success", "Registration Done Successully");
          });
        },
        (err) => {
          console.log(err);
        }
      );  
    
  },
};
</script>
<style lang="scss" >
@import "@core/scss/vue/libs/vue-good-table.scss";
</style>
