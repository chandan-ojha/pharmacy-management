import { defineStore } from "pinia";

export const useAuthStore = defineStore("auth", {
  state: () => ({
    username: "",
    accessToken: "",
    refreshToken: "",
  }),
  getters: {
    isLoggedIn(state) {
      return state.username && state.accessToken ? true : false;
    },
  },
  actions: {
    login(payload) {
      this.username = payload.user_name;
      this.accessToken = payload.access_token;
      this.refreshToken = payload.refresh_token;
    },
  },
});
