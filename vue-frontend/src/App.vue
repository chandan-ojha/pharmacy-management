<template>
  <router-view></router-view>
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
import TheToast from "./components/TheToast.vue";
import { eventBus } from "./utils/eventBus";

export default {
  data: () => ({
    toasts: [],
  }),
  components: {
    TheToast,
  },
  mounted() {
    eventBus.on("toast", (data) => {
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
