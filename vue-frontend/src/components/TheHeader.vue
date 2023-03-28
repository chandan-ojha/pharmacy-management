<template>
  <div class="the-header">
    <div>
      <input type="text" class="the-header__search" placeholder="Search..." />
    </div>
    <div class="avatar-wrapper">
      <div class="avatar" @click="showAvatar = !showAvatar">C</div>
      <div class="avatar__overflow" v-show="showAvatar">
        <div class="avatar__overflow-title">test@gmail.com</div>
        <router-link to="/dashboard/settings/account">
          <div
            class="avatar__overflow-link mt-2"
            @click="
              showAvatar = false;
              $router.push('/dashboard/settings');
            "
          >
            Settings
          </div>
        </router-link>
        <router-link to="#" @click="logout">
          <div class="avatar__overflow-link mb-2">Logout</div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    showAvatar: false,
  }),
  methods: {
    logout() {
      localStorage.removeItem("accessToken");
      location.href = "/";
    },
  },
};
</script>

<style>
.the-header {
  /* background-color: rgb(117, 20, 129); */
  padding: 9px 22px;
  /* color: rgb(221, 221, 221); */
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex: 1;
}

.the-header__search {
  width: 555px;
}

.the-header a {
  color: rgb(233, 168, 27);
}

.avatar-wrapper {
  position: relative;
}

.avatar {
  width: 33px;
  height: 33px;
  background-color: var(--brand-color);
  border-radius: 33px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  cursor: pointer;
}

.avatar__overflow {
  position: absolute;
  right: -8px;
  top: 50px;
  width: 186px;
  background: #fff;
  box-shadow: 0px 8px 6px 4px rgb(0 0 0 / 20%);
  min-height: 111px;
  z-index: 9999;
  border-radius: 0 0 3px 3px;
}

.avatar__overflow a {
  text-decoration: none;
}

.avatar__overflow-title {
  padding: 3px 9px;
  background-color: #ffecec;
  text-align: center;
}

.avatar__overflow-link {
  width: 100%;
  cursor: pointer;
  padding: 5px 15px;
  font-size: 16px;
  color: #000;
}

.avatar__overflow-link:hover {
  background-color: rgb(241, 241, 241);
}

.search-results {
  background-color: #fff;
  position: absolute;
  left: 0;
  top: 46px;
  min-height: 111px;
  max-height: 366px;
  box-shadow: 0 16px 11px 5px rgb(0 0 0 / 20%);
  width: 555px;
  border-radius: 0 0 5px 5px;
  overflow-y: auto;
}

.search-results table tr:nth-child(odd) {
  background-color: rgb(250, 250, 250);
}

.search-results table tr:nth-child(odd):hover {
  background-color: rgb(215, 248, 208);
}

.search-results table tr {
  cursor: pointer;
}

/* width */
::-webkit-scrollbar {
  width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: rgb(196, 196, 196);
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: rgb(143, 143, 143);
}

table.drug-details th {
  background: none;
}

table.drug-details tr {
  background: none;
}

.p-relative {
  position: relative;
}
</style>
