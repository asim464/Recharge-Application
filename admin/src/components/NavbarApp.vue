<template>
    <header class="main-nav">
      <nav>
        <div class="main-navbar mt-3">
          <div id="mainnav">
            <ul class="nav-menu custom-scrollbar" > 
              <li class="back-btn">
                <div class="mobile-back text-end">
                  <span>Back</span
                  ><i class="fa fa-angle-right ps-2" aria-hidden="true"></i>
                </div>
              </li>
              <li class="mb-1 mt-2"  v-for="menu in menus" :key="menu.menu_id">
                <div v-for="perm  in permissions" :key="perm.menu_rel_id">
                <a
                class="nav-link"
                :href="menu.menu_url"
                v-if="menu.menu_id == perm.menu_id"
                >
                <vue-feather :type="menu.menu_icon"></vue-feather>
                <span>{{ menu.menu_name }}</span>
                </a>
                </div>
              </li>

              <!-- <li class="back-btn">
                <div class="mobile-back text-end">
                  <span>Back</span
                  ><i class="fa fa-angle-right ps-2" aria-hidden="true"></i>
                </div>
              </li>
              <li class="dropdown" >
              <a class="nav-link menu-title" href="javascript:void(0)">
                <i data-feather="airplay" ></i><span>Role Management</span>
              </a>
              <ul class="nav-submenu menu-content">
                <li><a href="/add_roles">Add Roles</a></li>
                <li><a href="/menu_manage">Assign Menu</a></li> 
              </ul>
            </li>  -->
              
            </ul>
          </div>
        </div>
      </nav>
    </header>
</template>
<script>
import axios from 'axios'
import apiLink from '/api'

export default {
  name: 'NavbarApp',
  data() {
    return {
      menus: [],
      permissions: [],
      role_id: localStorage.role_id,      

    };
  },
  async created() {
    const response = await axios.get(apiLink.api + "menu");
    this.menus = response.data.menu_data;

    const formdata = [{
      role_id: this.role_id,
      process_id: 2
    }]

    const per_res = await axios.post(apiLink.api + "assgn_menu_to_roles", formdata);
    this.permissions = per_res.data.rm_data;
    
  },
};
</script>



