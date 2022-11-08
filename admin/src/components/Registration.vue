<template>
  <div class="page-body">
    <div class="container-fluid">
      <div class="card">
        <div class="card-header pb-0">
          <h5>Vehicle Registration</h5>
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
                ><label>Registration</label></a
              >
            </li>
          </ul>

          <div class="card-body">
            <div class="row ">
              <div class="col-md-6 ">
                <form @submit.prevent="handlesubmit" >
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> CNIC Number </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        type="number"
                        class="form-control"
                        placeholder="Enter Cnic Number"
                        v-model="vehicle_owner_cnic"
                        required
                      />
                    </div>
                  </div>
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Vehicle Owners Name </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        class="form-control"
                        placeholder="Enter Owners Name"
                        v-model="vehicle_owner_name"
                        required
                      />
                    </div>
                  </div>
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label>Registration Number </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Registration Number"
                        v-model="vehicle_registration_no"
                        required
                      />
                    </div>
                  </div>

                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Mobile Number </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        type="number"
                        class="form-control"
                        placeholder="Mobile Number"
                        v-model="owner_mobile_no"
                        required
                      />
                    </div>
                  </div>

                  <!-- <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Second Mobile Number </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        type="number"
                        class="form-control"
                        placeholder="Second Mobile Number"
                        v-model="owner_mobile_sec"
                        required
                      />
                      
                    </div>
                  </div> -->
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Vehicle Registration Year </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        type="number"
                        class="form-control"
                        placeholder="Vehicle Registration Year "
                        v-model="vehicle_modal"
                        required
                      />
                    </div>
                  </div>
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Chasis Number </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        class="form-control"
                        placeholder="Chasis Number "
                        v-model="vehicle_chasis_no"
                        required
                      />
                    </div>
                  </div>
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label>Vehicle Engine Number </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        class="form-control"
                        placeholder="Vehicle Engine Number "
                        v-model="vehicle_engine_no"
                        required
                      />
                    </div>
                  </div>
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label>Driving License Number </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        type="number"
                        class="form-control"
                        placeholder="Driving License Number "
                        v-model="drivers_license"
                        required
                      />
                    </div>
                  </div>
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label>Vehicle Owners Address </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        class="form-control"
                        placeholder="Owners Address "
                        v-model="vehicle_owner_address"
                        required
                      />
                    </div>
                  </div>

                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Vehicle Color </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        class="form-control"
                        placeholder="Enter Vehicle Color "
                        v-model="vehicle_color"
                        required
                      />
                    </div>
                  </div>
                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Vehicle Model </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        class="form-control"
                        placeholder="Enter Vehicle Model "
                        v-model="vehicle_modal"
                        required
                      />
                    </div>
                  </div>

                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Vehicle Class </label>
                    </div>
                    <div class="col-md-8">
                      <select
                        class="form-control "
                        name="select"
                        v-model="vehicleClassIdSelected"
                        :options="vehicleClassIdOptions"
                        required
                      >
                        <option :value="{}" disabled>--Select Vehicle Class--</option>
                        <option
                          v-for="value in vehicleClassIdOptions"
                          :key="value.class_id"
                          :value="value.class_id"
                        >
                          {{ value.vehicle_class }}
                        </option>
                      </select>
                    </div>
                  </div>

                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Vehicle Made </label>
                    </div>
                    <div class="col-md-8">
                      <select
                        class="form-control "
                        name="select"
                        v-model="vehicleMadeIdSelected"
                        :options="vehicleMadeIdOptions"
                        required
                      >
                      <option :value="{}" disabled>--Select Vehicle Made--</option>
                        <option
                          v-for="value in vehicleMadeIdOptions"
                          :key="value.vehicle_made_id"
                          :value="value.vehicle_made_id"
                        >
                          {{ value.made_name }}
                        </option>
                      </select>
                    </div>
                  </div>

                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label> Vehicle Type </label>
                    </div>
                    <div class="col-md-8">
                      <select
                        class="form-control "
                        name="select"
                        v-model="vehicleTypeIdSelected"
                        required
                      >
                      <option :value="{}" disabled>--Select Vehicle Type--</option>
                        <option
                          v-for="value in vehicleTypeIdOptions"
                          :key="value.vehicle_type_id"
                          :value="value.vehicle_type_id"
                        >
                          {{ value.type_name }}
                        </option>
                      </select>
                    </div>
                  </div>

                  <div class="row pb-2">
                    <div class="col-md-4">
                      <label>Company Exist </label>
                    </div>
                    <div class="col-md-8">
                      <input
                        class="form-check-input"
                        type="checkbox"
                        id="is_company"
                        v-model="is_company"
                        @click="checkbox"
                      />
                    </div>
                  </div>
                  <div class="row pb-2 ssl" hidden>
                    <div class="col-md-4">
                      <label>Select Company </label>
                    </div>
                    <div class="col-md-8">
                      <select class="form-control " >
                        <option value="">--Select Company--</option>
                        <option
                          v-for="value in companiesdata"
                          :key="value.company_id"
                          :value="value.company_id"
                          required
                        >
                          {{ value.company_name }}
                        </option>
                      </select>
                    </div>
                  </div>
                  <div class="row" id="sub">
                    <div class="offset-md-4 col-md-12">
                      <button
                        class="btn btn-primary"
                        id="simple"
                        type="submit"
                      >
                        Submit
                      </button>
                    </div>
                  </div>
                </form>
              </div>
              
              <div class="col-md-6">
                <form >
                <div
                  id="video"
                  class="form-control"
                >
                  <div>
                    <h4 style="font-weight: bold; color: #0e0e50">
                      LIVE VIDEO
                    </h4>
                  </div>

                  <div  id="videoImage" style="height: 360px; width: 635px">
                  
                    <iframe
                      sandbox="allow-forms allow-scripts allow-pointer-lock allow-same-origin allow-top-navigation allow-presentation"
                      class="embed-responsive-item"
                      width="100%"
                      height="100%"
                      allowfullscreen="allowfullscreen"
                      :src="this.liveVideo"
                    >
                    </iframe>
                  </div>
                  <div >
                    <!-- <img src="../assets/images/dashboard/anpr1.png" alt="ANPR Image" style="width: 40px; height: 40px;" class="mt-1"> -->
                    <h5
                      style="font-weight: bold; font-size: 20px; color: #0e0e50"
                      class="titleOnCard pt-1 pl-1"
                    >
                      ANPR Image
                    </h5>
                  </div>
                  <div
                    id="ANPRImagesDiv"
                    class="
                      d-flex
                      flex-column flex-sm-row
                      justify-content-around
                      align-items-center
                      mb-2
                    "
                  >
                    <div>
                      <div class="media">
                        <feather
                          type="image"
                          stroke-width="2"
                          class="text-danger pt-2 mr-1"
                        ></feather>
                        <h5 class="pt-2">Vehicle Image</h5>
                      </div>
                      <div
                        class="media-body rounded"
                        data-toggle="modal"
                        data-target="#imageZoomModal"
                      >
                        <center>
                          <img
                            id="vehicleImage"
                            alt="vehicle image"
                            class="img-thumbnail hoverImage"
                            @click="zoomImage('vehicle')"
                            :src="carImage"
                          />
                        </center>
                      </div>
                    </div>
                    <div>
                      <div class="media">
                        <feather
                          type="hash"
                          stroke-width="2"
                          class="text-danger pt-2 mr-1"
                        ></feather>
                        <h5 class="pt-2">
                          <span id="anprDivNumberPlateLabel">Vehicle </span
                          >Number Plate
                        </h5>
                      </div>
                      <div
                        class="media-body rounded"
                        data-toggle="modal"
                        data-target="#imageZoomModal"
                      >
                        <center>
                          <img
                            id="vehicleNumberPlate"
                            alt="number plate image"
                            class="img-thumbnail hoverImage"
                            @click="zoomImage('numberPlate')"
                            :src="this.plateImage"
                          />
                        </center>
                      </div>
                    </div>
                  </div>
                  <center class="mt-4 pt-2" style="font-size: 1.2em">
                    <div
                      class="py-2 w-100 text-center font-weight-bold"
                      style="
                        background-color: #f4f4f4;
                        border-radius: 7px;
                        border: 2px solid #eeeeee;
                      "
                    >
                      <span>Detected Vehicle Number Plate: </span>
                      <span class="text-danger" id="vehNumber">{{
                        vehNumber
                      }}</span>
                    </div>
                  </center>
                </div>
                </form>
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
import $ from "jquery";
import axios from "axios";
export default {
  name: "RegistrationApp",
  data() {
    return {
      liveVideo: apiLink.api + "video",
      vehicleMadeIdSelected: {},
      vehicleMadeIdOptions: [],
      vehicleTypeIdSelected: {},
      vehicleTypeIdOptions: [],
      vehicleClassIdSelected: {},
      vehicleClassIdOptions: [],
      companies: [],
      carImage: null,
      plateImage: null,

      registration: {
        vehicle_registration_no: "",
        vehicle_made_id: "",
        vehicle_modal: "",
        vehicle_color: "",
        vehicle_type_id: "",
        owner_mobile_no: "",
        vehicle_owner_name: " ",
        vehicle_owner_cnic: "",
        reg_center_id: "1",
        is_company: false,
        company_id: "0",
        owner_mobile_sec: "031565",
        vehicle_owner_address: "",
        remarks: "something",
        vehicle_engine_no: "",
        province_id: "1",
        city_id: "1",
        drivers_license: "",
        m_tag_token: "ddsakd454",
        vehicle_chasis_no: "",
        vehicle_class_id: "",
        expiry_date: "2023-04-12",
        tag_type_id: "1",
        created_by: "1",
      },
    };
  },
  async created() {
    console.log(this.liveVideo);

    setInterval(() => {
      this.getANPRnumber();
    }, 1000);
    setInterval(() => {
      this.getCarImages();
    }, 1000);

    const comp_res = await axios.get(apiLink.api + "companies");
    this.companiesdata = comp_res.data.companiesdata;
    await axios
      .get(apiLink.api + "made_type_class")
      .then((res) => {
        this.vehicleMadeIdOptions = res.data["vehicle_made"];
        this.vehicleClassIdOptions = res.data["vehicle_class"];
        this.vehicleTypeIdOptions = res.data["vehicle_type"];
      })
      .catch((err) => {
        console.log(err);
      });
  },
  methods: {
    zoomImage(str) {
      document.getElementById("zoomImageModal").style.display = "block";
      if (str === "vehicle") {
        document.getElementById("zoomedImage").src =
          document.getElementById("vehicleImage").src;
      } else if (str === "numberPlate") {
        document.getElementById("zoomedImage").src =
          document.getElementById("vehicleNumberPlate").src;
      }
    },
    checkbox() {
      console.log(this.is_company);
      this.is_company = !this.is_company;
      if (this.is_company) {
        $(".ssl").attr("hidden", false);
      } else {
        $(".ssl").attr("hidden", true);
      }
    },
    async handlesubmit() {
      const registration_data = {
        vehicle_registration_no: this.vehicle_registration_no,
        vehicle_made_id: this.vehicleMadeIdSelected,
        vehicle_modal: this.vehicle_modal,
        vehicle_color: this.vehicle_color,
        vehicle_type_id: this.vehicleTypeIdSelected,
        owner_mobile_no: this.owner_mobile_no,
        owner_mobile_sec: this.owner_mobile_sec,
        vehicle_owner_name: this.vehicle_owner_name,
        vehicle_owner_cnic: this.vehicle_owner_cnic,
        reg_center_id: this.registration.reg_center_id,
        is_company: this.registration.is_company,
        company_id: this.company_id,
        vehicle_owner_address: this.vehicle_owner_address,
        remarks: this.registration.remarks,
        vehicle_engine_no: this.vehicle_engine_no,
        province_id: this.registration.province_id,
        city_id: this.registration.city_id,
        drivers_license: this.drivers_license,
        m_tag_token: this.registration.m_tag_token,
        vehicle_chasis_no: this.vehicle_chasis_no,
        vehicle_class_id: this.vehicleClassIdSelected,
        expiry_date: this.registration.expiry_date,
        tag_type_id: this.registration.tag_type_id,
        created_by: this.registration.created_by,
      };
      const vehicles = await axios.post(
        apiLink.api + "register_vehicle",
        registration_data
      );
      this.vehicles = vehicles.data.vehicles;
      // window.location.reload();
      // alert("Vehicle Registered !!!")
          this.$toast.open({
          message: 'Vehicle Registered Successfully',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
    },

    async getANPRnumber() {
      await axios
        .get(apiLink.api + "/listen_anpr", this.config)
        .then(async (response) => {
          var responseData = response.data;
          if (response.status == 200) {
            console.log(responseData.data);
            this.vehNumber = responseData.data;
            this.vehicle_registration_no = this.vehNumber;
          } else {
            console.log("Record Not Found", response);
          }
        })
        .catch((error) => {
          console.log("Error in Searching for Record", error);
        });
    },
    async getCarImages() {
      await axios
        .get(apiLink.api + "/get_images", this.config)
        .then(async (response) => {
          var responseData = response.data;
          if (response.status == 200) {
            this.carImage = "data:image/jpeg;base64, " + responseData["key"];
            this.plateImage =
              "data:image/jpeg;base64, " + responseData["plate"];
          } else {
            console.log("Images Not Found", response);
          }
        })
        .catch((error) => {
          console.log("Error in Searching for Record", error);
        });
    },
  },
};
</script>

<style>
#vehicleImage,
#vehicleNumberPlate {
  width: 250px;
  height: 200px;
  border: 1px solid black;
  border-radius: 5px;
}
#sub{
  padding-top: 35px ;
}
</style>
