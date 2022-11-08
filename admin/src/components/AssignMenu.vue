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
      <div class="row card p-3">
        <div class="card">
          <div class="card-header pb-0">
            <h5>Menu Assign</h5>
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
                  ><label>Assign Menu</label></a
                >
              </li>
            </ul>
            <div class="table-responsive" style="overflow: hidden">
              <form @submit.prevent="assignmenus">
              <table class="table table-bordered-radius" id="example-style-1">                        
                <tr>
                  <td><th>Components</th></td>
                  <td
                    v-for="item in roles"
                    :key="item.role_id"
                  >
                    <th scope="col"> {{ item.role_name }} </th>
                  </td>
                </tr>
                
                <tbody>
                  
                <tr v-for="m in menu" :key="m.menu_id">
                  <td  id="components" scope="col" >{{ m.menu_name }}</td>
                  <td  id="checkbox"  v-for="item in roles" :key="item.role_id">
                   
                    <input type="checkbox" :value="`${m.menu_id}:${item.role_id}`" v-model="rid_mid" />      
                  </td>
                </tr>
                </tbody>
              </table>
              <button type="submit" class="btn btn-primary m-3">Submit</button>
              </form>
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
// import $ from 'jquery'
export default {
  name: "ManageMenu",
  data() {
    return {
      roles: [],
      menu: [],
      rid_mid: [],
      
      created_by: localStorage.user_id,
    };
  },
  async created() {
    const res_roles = await axios.get(apiLink.api + "user_roles");
    this.roles = res_roles.data.roledata;

    const res_menu = await axios.get(apiLink.api + "menu");
    this.menu = res_menu.data.menu_data;

    const res_role_menu = await axios.get(apiLink.api + "assgn_menu_to_roles");
    this.rid_mid = res_role_menu.data.rm_data;    
    
    
  },
  methods:{
    async assignmenus(){
      const formdata = [{
        rid_mid: this.rid_mid, 
        process_id: 1
      }]
      const assigmenu = await axios.post(apiLink.api + "assgn_menu_to_roles", formdata)
      if (assigmenu.status == 201) {
          // window.location.reload();
          // alert("Menu Assign Successfully");
          this.$toast.open({
          message: 'Menu Assigned Successfully!!!',
          type: 'success',
          position : 'top',
          dismissible: 'true',
      })
      }
    }
  }
};
</script>

<style>
#components{
  padding-left: 25px;
}
#checkbox{
  padding-left: 65px

}
/* .text-center {
  text-align: center;
  background-color: #f3f3f3;
  border: 0.2px solid rgb(158, 158, 158);
} */
</style>