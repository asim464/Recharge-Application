<template>
    <div class="page-wrapper" id="pageWrapper">
    <HeaderApp  v-if="!$route.meta.hideNavbar" :drawer="drawer" />
    <div class="page-body-wrapper vertical-menu">
      <NavbarApp  v-if="!$route.meta.hideNavbar" :drawer="drawer" />    
      <router-view />
      <FooterApp  v-if="!$route.meta.hideNavbar" :drawer="drawer" />
    </div>
  </div>
</template>

<script>
import HeaderApp from './HeaderApp.vue'
import FooterApp from './FooterApp.vue'
import NavbarApp from './NavbarApp.vue'
// import BodyApp from './BodyApp.vue'



export default {
  name: 'BackendApp',
  components: {
    HeaderApp,
    FooterApp,
    NavbarApp
    // BodyApp
  }
}
</script>

<style>

</style>
