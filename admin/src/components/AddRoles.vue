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
              <h5>Role Management</h5>
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
                    ><label>Roles Listing</label></a
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
                    ><label id="lbl-add-company">Add Roles</label></a
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
                          <th>Role Name</th>
                          <th>Role Type</th>
                          <th>Status</th>
                          <th style="width: 12%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="item in rolesdata" :key="item.role_id">
                          <td>{{ item.role_id }}</td>
                          <td>{{ item.role_name }}</td>
                          <td>{{ item.role_type }}</td>

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
                            <!-- <a class="btn btn-success btn-sm" v-bind:href="'/update?company='+item.company_id" data-bs-original-title="" title=""><span class="fa fa-edit"></span></a> &nbsp; -->
                            <a
                              class="btn btn-primary btn-sm"
                              v-on:click="updatecompany(item.role_id)"
                              ><span class="fa fa-edit"></span
                            ></a>
                            &nbsp;
                            <a
                              class="btn btn-danger btn-sm"
                              v-on:click="deletecompany(item.role_id)"
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
                  <form @submit.prevent="rolesname">
                    <div class="row pb-2">
                      <div class="col-md-2">
                        <label> Role Name: </label>
                      </div>
                      <div class="col-md-4">
                        <input
                          type="text"
                          class="form-control"
                          placeholder="Role Name"
                          v-model="role_name"
                          required
                        />
                        <input
                          class="form-control"
                          id="role_id"
                          v-model="role_id"
                          style="display: none"
                        />
                      </div>

                      <div class="col-md-2">
                        <label>Role Type: </label>
                      </div>
                      <div class="col-md-4">
                        <select
                          class="form-control form-control-primary btn-square"
                          name="select"
                          v-model="role_type"
                          required
                        >
                          <option value="">--Select Type--</option>
                          <option
                            v-for="value in rolesdata"
                            :key="value.role_id"
                            :value="value.role_type"
                            required
                          >
                            {{ value.role_type }}
                          </option>
                        </select>
                      </div>
                    </div>

                    <div class="row pb-2">
                      <div class="col-md-2">
                        <label>Status: </label>
                      </div>
                      <div class="col-md-4">
                        <select
                          class="form-control form-control-primary btn-square"
                          name="select"
                          v-model="status"
                          required
                        >
                        <option value="" disabled>--Select Status--</option>
                          <option value="0">Active</option>
                          <option value="1">Deactive</option>
                        </select>
                      </div>
                    </div>

                    <div class="col">
                      <div class="offset-md-4 col-md-4">
                        <button
                          class="btn btn-primary"
                          id="update_company"
                          type="submit"
                        >
                          Add Role
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
// import notifiction from '/public/assets/js/custom'
export default {
  name: "AddRoles",
  data() {
    return {
      companies: [],
      rolesdata: [],
      company_name: "",
      role_name: "",
      role_type: "",
      status: "",
      role_id:"",
    };
  },
  async created() {
    const response = await axios.get(apiLink.api + "companies");
    this.companies = response.data.companiesdata;

    const res = await axios.get(apiLink.api + "user_roles");
    this.rolesdata = res.data.roledata;
  },
  methods: {
    async rolesname() {
      const formdata = [
        {
          role_name: this.role_name,
          role_type: this.role_type,
          status: this.status,
          role_id:this.role_id,
        },
      ];
      if (formdata[0].role_id) {
        console.log("updated");
        // alert("in updated")
        console.log("form data  ", formdata);
        const response = await axios.put(apiLink.api + "user_roles", formdata);
        if (response.data.response == "Success!") {
          console.log(response.data.response);
          
          // alert("Role Updated Successfully");
          this.$toast.open({
          message: 'User Updated Successfully!!!',
          type: 'success',
          position : 'bottom-right',
          dismissible: 'true',
          // all of other options may go here
      })
      // window.location.reload();
          // this.open('Passwords do not match!')
        }
      } else {
        const resp = await axios.post(apiLink.api + "user_roles", formdata);
        if (resp.status == 201) {
          // window.location.reload();
          // alert("Role Added Successfully");
          this.$toast.open({
          message: 'Role Added Successfully!!!',
          type: 'success',
          position : 'bottom-right',
          dismissible: 'true',
      })
        }
      }
    },
    async deletecompany(id) {
      const formdata = [
        {
          role_id: id,
        },
      ];
      const response = await axios.patch(apiLink.api + "user_roles", formdata);
      if (response.data.response == "Success!") {
        console.log(response.data.response);
        this.$toast.open({
          message: 'Role Deleted Successfully!!!',
          type: 'error',
          position : 'bottom-right',
          dismissible: 'true',
      })
        // window.location.reload();
        // alert("Role Deleted Successfully");
        
      }
    },

    updatecompany(id) {
      var valObj = this.rolesdata.filter(function (elem) {
        if (elem.role_id == id) return elem;
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
      $("#lbl-add-company").text("Update Role");
      $("#update_company").text("Update");
      $("#company_listing").removeClass("active show");
      this.role_name = valObj[0].role_name;
      this.role_type = valObj[0].role_type;
      this.role_id=valObj[0].role_id;
      this.status = valObj[0].status;
    },
  },
};
</script>

<style>
</style>