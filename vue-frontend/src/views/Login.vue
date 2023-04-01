<template>
  <div class="login-page">
    <div class="login-card">
      <h2>{{ projectName }}</h2>
      <div class="text-center">
        <img src="/img/lock.png" class="login-card__icon" />
        <h2>User Login</h2>
      </div>
      <form action="#" @submit.prevent="handleSubmit">
        <label class="block mt-3">Username</label>
        <input
          type="text"
          placeholder="Enter your username"
          v-model="formData.user_name"
          required
          ref="user_name"
        />

        <label class="block mt-3">Password</label>
        <input
          type="password"
          placeholder="Enter password"
          v-model="formData.password"
          required
          ref="password"
        />

        <TheButton :block="true" :loading="loggingIn" class="mt-3">
          Login
        </TheButton>

        <div class="d-flex jc-between mt-3">
          <div>
            <label>
              <input type="checkbox" />
              Remember Me
            </label>
          </div>
          <div>
            <a href="#">Forget Password?</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapState, mapActions } from "pinia";
import { setPrivateHeaders } from "../service/axiosInstance";
import { showErrorMessage, showSuccessMessage } from "../utils/functions";
import { infoStore } from "../data/info";
import { useAuthStore } from "../store/authStore";
import TheButton from "../components/TheButton.vue";

export default {
  components: {},
  data: () => ({
    formData: {
      user_name: "",
      password: "",
    },
    loggingIn: false,
    projectName: infoStore.projectName,
  }),
  computed: {
    ...mapState(useAuthStore, {
      username: "username",
      accessToken: "accessToken",
      refreshToken: "refreshToken",
      isLoggedIn: "isLoggedIn",
    }),
  },
  components: {
    TheButton,
  },
  methods: {
    ...mapActions(useAuthStore, {
      login: "login",
    }),
    handleSubmit() {
      if (!this.formData.user_name) {
        showErrorMessage("Username can not be empty");

        this.$refs.user_name.focus();
        return;
      }
      if (this.formData.password.length < 6) {
        showErrorMessage("Paasword must be at least 6 characters long");

        this.$refs.password.focus();
        return;
      }
      this.loggingIn = true;
      axios
        .post("http://127.0.0.1:8000/api/login", this.formData)
        .then((res) => {
          showSuccessMessage(res);
          this.login(res.data);
          //console.log(res.data);
          localStorage.setItem("accessToken", res.data.access_token);
          setPrivateHeaders();
          this.$router.push("/dashboard");
        })
        .catch((err) => {
          showErrorMessage(err);
        })
        .finally(() => {
          this.loggingIn = false;
        });
    },
  },
};
</script>

<style>
.box {
  width: 55px;
  height: 55px;
  background-color: greenyellow;
  margin-bottom: 22px;
  transition: all 0.5s;
}

.box--right {
  margin-left: 222px;
}

.box1 {
  width: 55px;
  height: 55px;
  background-color: greenyellow;
  margin-bottom: 22px;
  /* animation: showhide 1s ease-in; */
}

.login-page {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(235, 235, 235);
}

.login-card {
  width: 400px;
  /* border: 1px solid gray; */
  min-height: 193px;
  box-shadow: 0px 2px 9px 4px #dfdfdf;
  background-color: #ffffff;
  border-radius: 5px;
  padding: 44px 33px;
}

.login-card input[type="text"],
.login-card input[type="password"] {
  width: 100%;
}

.login-card__icon {
  max-width: 77px;
}

@keyframes showhide {
  0% {
    opacity: 0;
    transform: scale(0.5);
  }

  50% {
    opacity: 0.5;
    transform: scale(1.2);
  }

  100% {
    opacity: 1;
    transform: scale(1);
  }
}
.showhide-enter-active {
  animation: showhide 1s ease-in;
  /* transition: all 0.5s; */
}

.showhide-leave-active {
  animation: showhide 1s ease-in reverse;
  /* transition: all 0.5s; */
}
</style>
