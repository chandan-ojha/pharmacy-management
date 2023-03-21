<template>
  <login></login>
  <TransitionGroup name="slide-left" tag="div" class="toasts">
    <TheToast
      v-for="(toast, i) in toasts"
      :key="i"
      :toastType="toast.type"
      :message="toast.message"
    ></TheToast>
  </TransitionGroup>
</template>

<script>
import Login from "./components/Login.vue";
import TheToast from "./components/TheToast.vue";
export default {
  data: () => ({
    toasts: [
      /* {
        type: "Success",
        message: "Done Successfully!",
      },
      {
        type: "Error",
        message: "Something went wrong!",
      }, */
    ],
  }),
  components: {
    Login,
    TheToast,
  },
  mounted() {
    this.$eventBus.on("toast", (data) => {
      this.toasts.push(data);
      this.removeOneToast();
    });
  },
  methods: {
    removeOneToast() {
      setTimeout(() => {
        this.toasts.shift();
      }, 2222);
    },
  },
};
</script>

<style>
.slide-left-enter-active,
.slide-left-leave-active {
  transition: all 0.25s ease;
}
.slide-left-enter-from,
.slide-left-leave-to {
  opacity: 0;
  transform: translateX(100px);
}
</style>
