import { defineStore } from "pinia";

export const useCartStore = defineStore("cart", {
  state: () => ({
    products: {},
  }),
  getters: {
    totalPrice() {
      let total = 0;
      for (const key in this.products) {
        total += this.products[key].price * this.products[key].quantity;
      }
      return total;
    },
  },
  actions: {
    add(payload) {
      //console.log(payload);
      if (this.products[payload.id]) {
        this.products[payload.id].quantity += payload.quantity;
      } else {
        this.products[payload.id] = payload;
      }
    },
    remove(id) {
      delete this.products[id];
    },
  },
});
