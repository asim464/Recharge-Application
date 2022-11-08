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
              <h5>User Management</h5>
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
                    ><label>Users Listing</label></a
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
                    ><label id="lbl-add-company">Add User</label></a
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
                          <th width="5%">ID</th>
                          <th width="15%">User Name</th>
                          <th width="20%">Email</th>
                          <th width="20%">Mobile Number</th>
                          <th width="15%">Role</th>
                          <th width="10%">Status</th>
                          <th width="15%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="item in userdata" :key="item.user_id">
                          <td>{{ item.user_id }}</td>
                          <td>{{ item.username }}</td>
                          <td>{{ item.email }}</td>
                          <td>{{ item.mobile_number }}</td>
                          <td>{{ item.role_name }}</td>
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
                              v-on:click="updateuser(item.user_id)"
                              ><span class="fa fa-edit"></span
                            ></a>
                            &nbsp;
                            <a
                              class="btn btn-danger btn-sm"
                              v-on:click="deleteuser(item.user_id)"
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
                        <label>User Name</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="text"
                          class="form-control"
                          id="username"
                          v-model="username"
                          placeholder="Username"
                          required
                        />
                      </div>
                      <div class="col-md-2">
                        <label>Email</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="email"
                          class="form-control"
                          id="official_number"
                          placeholder="Email"
                          v-model="email"
                          required
                        />
                      </div>
                    </div>
                    <div class="row pb-2">
                      <div class="col-md-2">
                        <label>Mobile No</label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="number"
                          class="form-control"
                          id="registrant_number"
                          placeholder="Mobile Number"
                          v-model="mobile_number"
                          required
                        />
                      </div>
                      <div class="col-md-2">
                        <label>Role</label>
                      </div>
                      <div class="col-md-4">
                        <select
                          class="form-control"
                          v-model="role_id"
                          @change="onChangeRoles(this.role_id)"
                          required
                        >
                          <option value="" disabled selected>--Select--</option>
                          <option
                            v-for="value in rolesdata"
                            :key="value.role_id"
                            :value="value.role_id"
                          >{{value.role_name}}</option>
                        </select>                       
                      </div>
                    </div>
                    <div class="row pb-2">
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
                          <option value="">--Select--</option>
                          <option value="0">Active</option>
                          <option value="1">Deactive</option>
                        </select>
                      </div>

                      <!-- Companies Dropdown -->
                      <div class="col-md-2 ddl_company" hidden>
                        <label>Company</label>
                      </div>
                      <div class="col-md-4 ddl_company" hidden>
                        <select
                        class="form-control "
                        name="select"
                          v-model="company_id"
                          required
                        >
                          <option value="">--Select--</option>
                          <option
                            v-for="value in companiesdata"
                            :key="value.company_id"
                            :value="value.company_id"
                          >{{value.company_name}}</option>
                        </select>                       
                      </div>
                      <!-- Companies Dropdown -->

                      <!-- Centers Dropdown -->
                      <div class="col-md-2 ddl_centers" hidden>
                        <label>Centers</label>
                      </div>
                      <div class="col-md-4 ddl_centers" hidden>
                        <select
                          v-model="reg_center_id"
                        >
                          <option value="">--Select--</option>
                          <option
                            v-for="value in reg_centers"
                            :key="value.reg_center_id"
                            :value="value.reg_center_id"
                          >{{value.center_name}}</option>
                        </select>                       
                      </div>
                      <!-- Centers Dropdown -->

                    </div>

                    <div class="row">
                      <div class="offset-md-4 col-md-4">
                        <input                          
                          class="form-control"
                          id="user_id"
                          v-model="user_id"
                          hidden
                        />
                        <button
                          class="btn btn-primary"
                          id="update_company"
                          type="submit"
                        >
                          Add User
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
  name: "UserManagement",
  data() {
    return {
      userdata: [],
      rolesdata: [],
      companiesdata: [],
      reg_centers: [],
      user_id: "",
      username: "",
      password:"1234",
      mobile_number: "",
      reg_center_id: "",
      email:"",
      role_id: "",      
      company_id: "",
      status: "",
      created_by:"1",
      updated_by:"1",
    };
  },
  async created() {
    const response = await axios.get(apiLink.api + "user");
    this.userdata = response.data.userdata;
    
    const res = await axios.get(apiLink.api + "user_roles");
    this.rolesdata = res.data.roledata;

    const comp_res = await axios.get(apiLink.api + "companies");
    this.companiesdata = comp_res.data.companiesdata;

    const centers_res = await axios.get(apiLink.api + "reg_centers");
    this.reg_centers = centers_res.data.reg_centers;
  },

  methods: {
    async insertCompany() {
      const formdata = [
        {
          user_id: this.user_id,
          username: this.username,
          mobile_number: this.mobile_number,
          reg_center_id: this.reg_center_id,
          password: this.password,
          email: this.email,
          role_id:this.role_id,
          company_id: this.company_id,
          status: this.status,
          created_by:localStorage.getItem("user_id"),
          updated_by:localStorage.getItem("user_id"),
        },
      ];
      if (formdata[0].user_id) {
        const response = await axios.put(apiLink.api + "user", formdata);
        if (response.data.response == "Success!") {
          console.log(response.data.response);
          this.$toast.open({
          message: 'User Updated Successfully!!!',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
        }
      } else {
        const response = await axios.post(apiLink.api + "user", formdata);
        if (response.data.response == "Success!") {
          console.log(response.data.response);
          this.$toast.open({
          message: 'User Added Successfully!!!',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
        }
      }
    },

    async deleteuser(id) {
      const formdata = [
        {
          user_id: id,
        },
      ];
      const response = await axios.patch(apiLink.api + "user", formdata);
      if (response.data.response == "Success!") {
        this.$toast.open({
          message: 'User Deleted !!!',
          type: 'error',
          position : 'top',
          dismissible: 'true',
      })
      }
    },

    updateuser(id) {
      var valObj = this.userdata.filter(function (elem) {
        if (elem.user_id == id) return elem;
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
      $("#lbl-add-company").text("Update User");
      $("#update_company").text("Update User");
      $("#company_listing").removeClass("active show");
      $("#username").attr("disabled", true);
      this.user_id = valObj[0].user_id;
      this.username = valObj[0].username;
      this.email = valObj[0].email;
      this.mobile_number = valObj[0].mobile_number;
      this.registrant_designation = valObj[0].registrant_designation;
      this.registrant_mobile = valObj[0].registrant_mobile;
      this.role_id = valObj[0].role_id;
      this.company_id = valObj[0].company_id;
      this.reg_center_id = valObj[0].reg_center_id;
      this.status = valObj[0].status;

      if (valObj[0].role_id == 2 || valObj[0].role_id == 3){
        $(".ddl_company").attr("hidden", false);
        $(".ddl_centers").attr("hidden", true);
      }
      else{
        if (valObj[0].role_id == 5){
          $(".ddl_company").attr("hidden", true);
          $(".ddl_centers").attr("hidden", false);
        }
        else{
          $(".ddl_company").attr("hidden", true);
          $(".ddl_centers").attr("hidden", true);
        }
      }
    },
    onChangeRoles(role_id)
    {
      if (role_id == 2 || role_id == 3){
        $(".ddl_company").attr("hidden", false);
        $(".ddl_centers").attr("hidden", true);
      }
      else{
        if (role_id == 5){
          $(".ddl_company").attr("hidden", true);
          $(".ddl_centers").attr("hidden", false);
        }
        else{
          $(".ddl_company").attr("hidden", true);
          $(".ddl_centers").attr("hidden", true);
        }
      }
    }
  },
};
</script>

<style>
</style>