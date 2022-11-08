<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-xl-5">
        <img
          class="bg-img-cover bg-center"
          src="../assets/images/login.png"
          alt="looginpage"
        />
      </div>
      <div class="col-xl-7 p-0">
        <div class="login-card">
          <form
            class="theme-form login-form needs-validation"
            novalidate=""
            @submit.prevent="submit"
          >
            <h4>Login</h4>
            <h6>Registration and Recharge!</h6>
            <h6>Log in to Continue</h6>
            <div class="form-group">
              <label>Username</label>
              <div class="input-group">
                <span class="input-group-text"><i class="icon-email"></i></span>
                <input
                  class="form-control"
                  v-model="username"
                  type="text"
                  required=""
                  placeholder="Enter Username"
                />
                <div class="invalid-tooltip">Please insert username</div>
              </div>
            </div>
            <div class="form-group">
              <label>Password</label>
              <div class="input-group">
                <span class="input-group-text"><i class="icon-lock"></i></span>
                <input
                  class="form-control"
                  v-model="password"
                  type="password"
                  name="login[password]"
                  required=""
                  placeholder="*********"
                />
                <div class="invalid-tooltip">Please enter password.</div>
                <div class="show-hide"><span class="show"> </span></div>
              </div>
            </div>
            <!-- <div class="form-group">
                <div class="checkbox">
                  <input id="checkbox1" type="checkbox">
                  <label class="text-muted" for="checkbox1">Remember password</label>
                </div><a class="link" href="forget-password.html">Forgot password?</a>
              </div> -->  
            <div class="form-group">
              <button class="btn btn-primary btn-block" type="submit">
                Sign in
              </button>
            </div>
            <div class="login-social-title">
              <h5>Don't forget to Logout when leaving</h5>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import apiLink from "/api";

export default {
  name: "LoginApp",
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    async submit() {
      const formdata = [
        {
          username: this.username,
          password: this.password,
        },
      ];
      const response = await axios.post(apiLink.api + "login", formdata);
      console.log(response.data.user_data);
      if (response.data.user_data) {
        localStorage.setItem("user_id", response.data.user_data.user_id);
        localStorage.setItem("company_id", response.data.user_data.company_id);
        localStorage.setItem("role_id", response.data.user_data.role_id);
        // localStorage.setItem('created_by',response.data.user_data.
        localStorage.setItem("token", response.data.token);
        
        this.$router.push("/dashboard");
        
      } else {
        this.$toast.open({
          message: "Username or Password is Incorrect!",
          type: "error",
          position: "top",
          dismissible: "true",
        });
        
      }
    },
  },
};
</script>
