<template>
  <div class="login-page">
    <div class="login-card">
      <div class="text-center">
        <img src="/img/lock.png" class="login-card__icon" />
        <h2>User Login</h2>
      </div>
      <form action="#" @submit.prevent="handleSubmit">
        <label class="block mt-3">Email</label>
        <input
          type="email"
          placeholder="Enter your email"
          v-model="formData.email"
          required
          ref="email"
        />

        <label class="block mt-3">Password</label>
        <input
          type="password"
          placeholder="Enter password"
          v-model="formData.password"
          required
          ref="password"
        />

        <button type="submit" class="w-100 mt-3">Login</button>

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
export default {
  components: {},
  data: () => ({
    formData: {
      email: "",
      password: "",
    },
    movedToRight: false,
    showing: false,
  }),
  methods: {
    handleSubmit() {
      if (!this.formData.email) {
        this.$eventBus.emit("toast", {
          type: "Error",
          message: "Email can not be empty",
        });
        this.$refs.email.focus();
        return;
      }
      if (!this.formData.password.length < 6) {
        //alert("Paasword must be at least 6 characters long");
        this.$eventBus.emit("toast", {
          type: "Error",
          message: "Paasword must be at least 6 characters long",
        });
        this.$refs.password.focus();
        return;
      }
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

.login-card input[type="email"],
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
.showhide-enter-from {
  /* opacity: 0;
  transform: scale(0.5); */
}

.showhide-enter-to {
  /* opacity: 1;
  transform: scale(1); */
}

.showhide-leave-active {
  animation: showhide 1s ease-in reverse;
  /* transition: all 0.5s; */
}
.showhide-leave-from {
  /* opacity: 1;
  transform: scale(1); */
}

.showhide-leave-to {
  /* opacity: 0;
  transform: scale(0.5); */
}
</style>
