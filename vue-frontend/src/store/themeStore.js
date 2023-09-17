import { defineStore } from "pinia";

const brandColor = localStorage.getItem("brandColor") || "#491D34";

export const useThemeStore = defineStore("theme", {
  state: () => ({
    brandColor: brandColor,
  }),

  actions: {
    setBrandColor(payload) {
      this.brandColor = payload;
    },
  },
});
