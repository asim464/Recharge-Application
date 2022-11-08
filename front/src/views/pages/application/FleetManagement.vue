<template>
  <b-card-code title="Fleet Management">
    <b-tabs content-class="mt-1">
      <!-- This tabs content will always be mounted -->
      <b-tab title="Fleet Listing">
        <div class="alert-body">
          <good-table-advance-search />
        </div>
      </b-tab>

      <!-- This tabs content will not be mounted until the tab is shown -->
      <!-- and will be un-mounted when hidden -->
      <b-tab title="Add Fleet" lazy >
        <div class="alert-body">
          <form class="form form-vertical">
            <div class="row">
              <div class="col-2">
                <label for="first-name-vertical">Fleet Name</label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  
                  <input
                    type="text"
                    id="first-name-vertical"
                    class="form-control"
                    v-model="fleet.fleet_name"
                    name="fname"
                    placeholder="Fleet Name"
                  />
                </div>
              </div>
              <!-- <div class="col-2">
                <label for="email-id-vertical">Company ID </label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  <input
                    type="number"
                    id="email-id-vertical"
                    v-model="fleet.company_id"
                    class="form-control"
                    name="email-id"
                    placeholder="Enter Company ID"
                  />
                </div>
              </div> -->
              <div class="col-2">
                  <label for="contact-info-vertical">Fleet Type</label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  <input
                    type="text"
                    id="contact-info-vertical"
                    class="form-control"
                    v-model="fleet.fleet_type"
                    name="contact"
                    placeholder="Fleet Type"
                  />
                </div>
              </div>
              <div class="col-2">
                <label for="password-vertical">Number of vehicles</label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  <input
                    type="number"
                    id="password-vertical"
                    v-model="fleet.number_of_vehicles"
                    class="form-control"
                    name="contact"
                    placeholder="Number of Vehicles"
                  />
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="customCheck3" />
                    <!-- <label class="custom-control-label" for="customCheck3">Remember me</label> -->
                  </div>
                </div>
              </div>
              <div class="col-12">
                <button @click="onCreateUser" type="submit" rippleEffect class="btn btn-primary mr-1">Submit</button>
                <!-- <button type="reset" rippleEffect class="btn btn-outline-secondary">Reset</button> -->
              </div>
            </div>
          </form>
        </div>
      </b-tab>
      

      <b-tab title="Update Fleet" lazy >
        <div class="alert-body">
          <form class="form form-vertical">
            <div class="row">
              <div class="col-2">
                <label for="first-name-vertical">Fleet Name</label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  
                  <input
                    type="text"
                    id="first-name-vertical"
                    class="form-control"
                    v-model="updateFleet.fleet_name"
                    name="fname"
                    placeholder="Fleet Name"
                  />
                </div>
              </div>
              
              <div class="col-2">
                  <label for="contact-info-vertical">Fleet Type</label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  <input
                    type="text"
                    id="contact-info-vertical"
                    class="form-control"
                    v-model="updateFleet.fleet_type"
                    name="contact"
                    placeholder="Fleet Type"
                  />
                </div>
              </div>
              <div class="col-2">
                <label for="password-vertical">Number of vehicles</label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  <input
                    type="number"
                    id="password-vertical"
                    v-model="updateFleet.number_of_vehicles"
                    class="form-control"
                    name="contact"
                    placeholder="Number of Vehicles"
                  />
                </div>
              </div>
              <div class="col-2">
                <label for="email-id-vertical">Fleet ID </label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  <input
                    type="number"
                    id="email-id-vertical"
                    v-model="updateFleet.fleet_id"
                    class="form-control"
                    name="email-id"
                    placeholder="Enter Fleet ID"
                  />
                </div>
              </div>
              <!-- <div class="col-2">
                <label for="email-id-vertical">Company ID </label>
              </div> -->
              <!-- <div class="col-4">
                <div class="form-group">
                  <input
                    type="number"
                    id="email-id-vertical"
                    v-model="updateFleet.company_id"
                    class="form-control"
                    name="email-id"
                    placeholder="Enter Company ID"
                  />
                </div>
              </div> -->
              <!-- <div class="col-2">
                <label for="email-id-vertical">Updated By </label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  <input
                    type="number"
                    id="email-id-vertical"
                    v-model="updateFleet.updated_by"
                    class="form-control"
                    name="email-id"
                    placeholder="1"
                  />
                </div>
              </div> -->
              <!-- <div class="col-2">
                <label for="email-id-vertical"> Status </label>
              </div>
              <div class="col-4">
                <div class="form-group">
                  <input
                    type="number"
                    id="email-id-vertical"
                    v-model="updateFleet.status"
                    class="form-control"
                    name="email-id"
                    placeholder="1"
                  />
                </div>
              </div> -->
              <div class="col-12">
                <div class="form-group">
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="customCheck3" />
                    <!-- <label class="custom-control-label" for="customCheck3">Remember me</label> -->
                  </div>
                </div>
              </div>
              <div class="col-12">
                <button @click="onUpdateUser" type="submit" rippleEffect class="btn btn-primary mr-1">Update Fleet</button>
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
import GoodTableAdvanceSearch from "./FleetsTable.vue";
import { BTabs, BTab, BAlert } from "bootstrap-vue";
import { codeLazy } from "./code";

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
      updateFleet:{
        fleet_id: "",
        fleet_name: "",
        company_id: "1",
        number_of_vehicles: "",
        fleet_type: "",
        status:"1",
        updated_by:"1"

      },
      fleet: {
        fleet_name: "",
        company_id: "",
        number_of_vehicles: "",
        fleet_type: "",
        created_by:"",
        status:""
      },
    };
  },
  methods:{
     onCreateUser() {
      //  this.fleet.status=1;
      console.log("fleet data" + this.fleet);
      fetch("http://10.0.107.221:5000/fleet_management", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(this.fleet),
      }).then(
        (response) => {
          console.log(response);
          console.log(response.body);
          response.json().then((data) => {
            console.log(data);
            this.onReset();
            this.fetchUsers();
            this.createAlert("success", "Fleet Added Successully");
          });
        },
        (err) => {
          console.log(err);
        }
      );
    },
    onUpdateUser() {
      console.log("update company" + this.updateFleet);
      fetch("http://10.0.107.221:5000/fleet_management", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(this.updateFleet),
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
}

</script>
<style lang="scss" >
@import "@core/scss/vue/libs/vue-good-table.scss";
</style>
