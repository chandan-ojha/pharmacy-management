<template>
  <div class="dashboard">
    <div class="dashboard__left">
      <TheSidebar></TheSidebar>
    </div>
    <div class="dashboard__right">
      <div class="dashboard__top">
        <TheHeader></TheHeader>
      </div>
      <div class="dashboard__main">
        <RouterView></RouterView>
      </div>
    </div>
    <div
      class="dashboard__cart"
      :class="{ 'dashboard__cart--opened': cartOpened }"
    >
      <div class="the-cart-container">
        <TheCart @close="cartOpened = false"></TheCart>
      </div>

      <div class="cart-arrow" @click="cartOpened = !cartOpened">
        <img src="/img/arrow.png" alt="" />
      </div>
    </div>
  </div>
</template>

<script>
import TheSidebar from "../components/TheSidebar.vue";
import TheHeader from "../components/TheHeader.vue";
import TheCart from "../components/TheCart.vue";
import { setPrivateHeaders } from "../service/axiosInstance";
export default {
  data: () => ({
    cartOpened: false,
  }),
  components: {
    TheSidebar,
    TheHeader,
    TheCart,
  },
  created() {
    const accessToken = localStorage.getItem("accessToken");
    if (!accessToken) {
      location.href = "/";
    }
  },
  mounted() {
    setPrivateHeaders();
  },
};
</script>

<style>
.dashboard {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  display: flex;
}

.dashboard__left {
  width: 244px;
  box-shadow: 0 0 3px 2px rgb(0 0 0 / 5%);
  z-index: 3;
  display: flex;
  background-color: #fff;
}

.dashboard__right {
  flex: 1;
  width: 222px;
  display: flex;
  flex-direction: column;
  z-index: 2;
}

.dashboard__top {
  box-shadow: 0 0 3px 2px rgb(0 0 0 / 5%);
  height: 55px;
  z-index: 2;
  display: flex;
}

.dashboard__main {
  flex: 1;
  padding: 22px 33px;
  background-color: rgb(235, 235, 235);
  overflow-y: auto;
}

.dashboard__cart {
  position: fixed;
  top: 0;
  bottom: 0;
  right: -444px;
  width: 444px;
  box-shadow: 0 0 42px 14px rgb(0 0 0 / 22%);
  z-index: 999999;
  background-color: rgb(255 255 255);
  display: flex;
  transition: all 0.25s;
}

.dashboard__cart--opened {
  right: 0;
}

.the-cart-container {
  position: relative;
  flex: 1;
  display: flex;
}

.cart-arrow {
  width: 44px;
  height: 55px;
  background-color: #fff; /* var(--brand-color);*/
  color: #fff;
  position: absolute;
  top: 44%;
  left: -44px;
  border-radius: 6px 0 0 6px;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
}

.cart-arrow img {
  transition: all 0.25s;
  width: 22px;
  transform: rotate(180deg);
}

.dashboard__cart--opened .cart-arrow img {
  transform: rotate(0deg);
}
</style>
