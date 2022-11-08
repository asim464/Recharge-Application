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
              <h5>M-TAG Recharge</h5>
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
                    ><label>Recharge Vehicle or Fleet</label></a
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
                  <div class="row">
                    <div class="d-flex flex-wrap pb-4">
                      <div class="col-sm-4">
                        <div
                          class="card "
                          style="margin: 10px; margin-top: -10px"
                        >
                          <div class="media p-20">
                            <div class="radio radio-primary me-3">
                              <input
                                id="radio14"
                                type="radio"
                                class="card-input-element"
                                name="rdrecharge"
                                @change="onChange()"
                                value="1"
                                checked
                              />
                              <label for="radio14"></label>
                            </div>
                            <div class="media-body card-input">
                              <h6 class="mt-0 mega-title-badge">
                                Vehicle Recharge<span
                                  class="badge badge-primary pull-right digits"
                                >
                                </span>
                              </h6>
                              <p>Individual Vehicles Recharge</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <div
                          class="card"
                          style="margin: 10px; margin-top: -10px"
                        >
                          <div class="media p-20">
                            <div class="radio radio-secondary  me-3">
                              <input
                                id="radio13"
                                class="card-input-element"
                                type="radio"
                                name="rdrecharge"
                                @change="onChange()"
                                value="0"
                              />
                              <label for="radio13"></label>
                            </div>
                            <div class=" card-input media-body">
                              <h6 class="mt-0 mega-title-badge">
                                Fleet Recharge<span
                                  class="
                                    badge badge-secondary
                                    pull-right
                                    digits
                                  "
                                >
                                </span>
                              </h6>
                              <p>Companies Fleet Recharge</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <form @submit.prevent="OnSearch">
                      <!-- Vehicles Row -->
                      <div class="row" id="ddlVehicle">
                        <div class="col-md-2">
                          <label>MTAG Id:</label>
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
                        <div class="col-md-2" id="btnn">
                          <button class="btn btn-primary" type="submit">
                            Search
                          </button>
                        </div>
                      </div>
                    </form>

                    <form @submit.prevent="OnRecharge" id="ddlUserinfo" hidden>
                      <div class="row"  >
                        <div class="col-md-2" id="name">
                          <label>Name:</label>
                        </div>
                        <div class="col-md-2">
                          <input
                            id="name"
                            class="form-control"
                            v-model="vehicle_owner_name"
                            disabled
                          />
                        </div>
                        <div class="col-md-2">
                          <label>Vehicle Number:</label>
                        </div>
                        <div class="col-md-2">
                          <input
                            class="form-control"
                            v-model="vehicle_registration_no"
                            disabled
                          />
                        </div>
                      </div>

                      <div class="row" id="ddlbalance" >
                        <div class="col-md-2">
                          <label>Mobile Number:</label>
                        </div>
                        <div class="col-md-2">
                          <input
                            id="Registration"
                            class="form-control"
                            v-model="owner_mobile_no"
                            disabled
                          />
                        </div>
                        <div class="col-md-2">
                          <label>Current Balance:</label>
                        </div>
                        <div class="col-md-2">
                          <input
                            id="Registration"
                            class="form-control"
                            v-model="current_balance"
                            disabled
                          />
                        </div>
                      </div>

                      <div class="row" id="ddlpayment" >
                        <div class="col-md-2">
                          <label>Payment Method:</label>
                        </div>
                        <div class="col-md-2">
                          <select class="form-control ddlPaymentMethod" v-model="payment_method">
                            <option value="">--Select Payment--</option>
                            <option value="1">Cash</option>
                            <option value="2">Credit Card</option>
                            <option value="3">POS</option>
                            >
                          </select>
                        </div>
                        <div class="col-md-2">
                          <label>Amount:</label>
                        </div>
                        <div class="col-md-2">
                          <input
                            type="number"
                            class="form-control amount"
                            v-model="payment_amount"
                          />
                        </div>
                      </div>
                      <div class="col-md-12" id="Submit" >
                        <button
                          class="btn btn-primary"
                        >
                          Recharge
                        </button>
                      </div>
                    </form>
                  </div>

                  <!-- Vehicles Row -->

                  <!-- Fleet Row -->
                  <form @submit.prevent="OnRecharge" id="ddlFleet" hidden>
                    <div class="row"  >
                      <div class="col-md-3" id="ddlcompany">
                        <label>Select Company:</label>
                      </div>
                      <div class="col-md-3">
                        <select
                          @change="onCompany($event)"
                          class="form-control "
                        >
                          <option value="">--Select Company--</option>
                          <option
                            v-for="value in companiesdata"
                            :key="value.company_id"
                            :value="value.company_id"
                          >
                            {{ value.company_name }}
                          </option>
                        </select>
                      </div>

                      <div class="col-md-3">
                        <label>Select Fleet:</label>
                      </div>
                      <div class="col-md-3">
                        <select class="form-control js-example-basic-single">
                          <option value="ddlVehicle">--Select Fleet--</option>
                          <option
                            v-for="value in fleets"
                            :key="value.fleet_id"
                            :value="value.fleet_id"
                          >
                            {{ value.fleet_name }}
                          </option>
                        </select>
                      </div>

                      <div class="col-md-3" >
                        <label>Payment Method:</label>
                      </div>
                      <div class="col-md-3">
                        <select  class="form-control ddlPaymentMethod js-example-basic-single" v-model="payment_method">
                          <option value="">--Select Payment--</option>
                          <option value="1">Cash</option>
                          <option value="2">Credit Card</option>
                          <option value="3">POS</option>
                          >
                        </select>
                      </div>
                      <div class="col-md-3">
                        <label>Amount:</label>
                      </div>
                      <div class="col-md-3">
                        <input
                          type="number"
                          class="form-control amount"
                          v-model="payment_amount"
                        />
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <button
                            class="btn btn-primary"
                            type="submit"
                          >
                            Recharge
                          </button>
                        </div>
                      </div>
                    </div>
                  </form>
                  <!-- Fleet Row -->
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
  name: "RechargeApp",
  data() {
    return {
      rechargeType: "",
      det: Boolean,
      companiesdata: [],
      fleets: [],
      vehicles: [],
      vehicle_data: [],
      vehicle_registration_no: "",
      vehicle_owner_name: "",
      owner_mobile_no: "",
      recharge_type: "",
      payment_amount: "",
      payment_status: "Done",
      payment_method: "",
      vehicle_id: "",
      mtagid: "",
      vehiclesdata: [],
      fleet_id: "",
      company_id: "",
      current_balance:"",
      created_by: localStorage.user_id,
      updated_by: localStorage.user_id,
    };
  },

  async created() {
    const comp_res = await axios.get(apiLink.api + "companies");
    this.companiesdata = comp_res.data.companiesdata;

    this.recharge_type = "vehicle"
  },
  methods: {
    async assignVehicles() {
      const formdata = [
        {
          vehicle_id: this.vehicles_ids,
          fleet_id: this.fleet_id,
          company_id: this.company_id,
          created_by: this.created_by,
        },
      ];

     
      
      const response = await axios.post(
        apiLink.api + "fleet_relation",
        formdata
      );
      if (response.data.response == "Success!") {
        console.log(response.data.response);
        window.location.reload();
        this.$toast.open({
          message: "Record Inserted Successfully",
          type: "Success",
          position: "top",
          dismissible: "true",
        });
      }
    },
    async getVehicles() {
      const fleet_id = $("#ddlfleets").val();
      const formdata = [
        {
          fleet_id: fleet_id,
        },
      ];
      const response = await axios.put(
        apiLink.api + "fleet_relation",
        formdata
      );
      this.vehiclesdata = response.data.fleetdata;
    },
    async onCompany(e) {
      const company_id = e.target.value;
      const response = await axios.get(
        apiLink.api + "fleet_management/" + company_id
      );
      this.fleets = response.data.fleetdata;
    },
    async OnSearch() {
      const formdata = [
        {
          vehicle_id: this.mtagid,
        },
      ];

      const response = await axios.post(
        apiLink.api + "vehicle_search",
        formdata
      );
      if (response.status == 201) {
        this.vehicle_data = response.data.vehicle_data[0];
        this.vehicle_registration_no =
          response.data.vehicle_data[0].vehicle_registration_no;
        this.vehicle_owner_name =
          response.data.vehicle_data[0].vehicle_owner_name;
        this.owner_mobile_no = response.data.vehicle_data[0].owner_mobile_no;
        this.current_balance = response.data.vehicle_data[0].close_balance;
        console.log(this.vehicle_data);
        $("#ddlpayment").attr("hidden", false);
        $("#ddlUserinfo").attr("hidden", false);
        $("#Submit").attr("hidden", false);
        $("#ddlbalance").attr("hidden", false);
        $("#btnn").hide();
      } else {
        this.$toast.open({
          message: "No Vehicle Found",
          type: "error",
          position: "top",
          dismissible: "true",
        });
      }
    },
    onMtag() {
      $("#ddlpayment").attr("hidden", true);
      $("#ddlUserinfo").attr("hidden", true);
      $("#Submit").attr("hidden", true);
      $("#ddlbalance").attr("hidden", true);
      $("#btnn").show();
    },
    async OnRecharge() {
      const formdata = 
        {
          vehicle_id: this.mtagid,
          recharge_type: this.recharge_type,
          payment_amount: this.payment_amount,
          payment_status: this.payment_status,
          payment_method: this.payment_method,
          created_by: this.created_by,
        }
      
      const response = await axios.post(
        apiLink.api + "recharge_balance",
        formdata
      );
      if (response.status == 201) {        
        
       
        this.$toast.open({
          message: "Vehicle Recharged ",
          type: "success",
          position: "top",
          dismissible: "true",
        });
      }

    },
    onChange() {
      const value = $('input[name="rdrecharge"]:checked').val();
      console.log(value);
      if (value == 1) {
        this.recharge_type = "vehicle";
        $("#ddlVehicle").attr("hidden", false);
        $("#ddlFleet").attr("hidden", true);
        $(".ddlPaymentMethod").val("");
        $(".amount").val("");
        this.payment_amount = "";
        this.payment_method = "";

        // $("#search").text("Search");
      } else {
        this.recharge_type = "fleet";
        $("#ddlVehicle").attr("hidden", true);
        $("#ddlUserinfo").attr("hidden", true);
        $("#ddlFleet").attr("hidden", false);
        $(".ddlPaymentMethod").val("");
        $(".amount").val("");
        this.payment_amount = "";
        this.payment_method = "";
      }
    },
  },
};
</script>

<style>
#ddlcompany,
#ddlVehicle,
#ddlpayment,
#ddlmethod,
#ddlnumber {
  padding-bottom: 25px;
}
#ddlpayment,
#ddlbalance {
  padding-top: 25px;
}
</style>