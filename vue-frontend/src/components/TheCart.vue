<template>
  <div class="the-cart">
    <div class="the-cart__heading">Cart Items</div>
    <table>
      <tr>
        <th>Item</th>
        <th>Weight</th>
        <th>Price</th>
        <th>Qty</th>
        <th>Total</th>
        <th>
          <img
            src="/img/trash.png"
            class="action-icon action-icon--delete-small"
            alt=""
          />
        </th>
      </tr>
      <tr v-for="(item, key) in cartItems" :key="key">
        <td>{{ item.name }}</td>
        <td>{{ item.weight }}</td>
        <td>{{ item.price }}</td>
        <td>
          <input class="qty-input" type="number" v-model="item.quantity" />
        </td>
        <td class="text-right">
          {{ item.price * item.quantity }}
        </td>
        <td>
          <img
            src="/img/trash.png"
            class="action-icon action-icon--delete-small"
            alt=""
            @click="removeFromCart(item.id)"
          />
        </td>
      </tr>
      <tr>
        <td colspan="6">
          <div class="text-right">
            <hr />
            <strong>Grand Total : {{ totalPrice }} </strong>
          </div>
        </td>
      </tr>
    </table>
    <TheButton class="w-100 mt-4">Checkout</TheButton>
  </div>
</template>

<script>
import { mapState, mapActions } from "pinia";
import { useCartStore } from "../store/cartStore";
import TheButton from "./TheButton.vue";
export default {
  methods: {
    ...mapActions(useCartStore, {
      removeFromCart: "remove",
    }),
  },
  computed: {
    ...mapState(useCartStore, {
      cartItems: "products",
      totalPrice: "totalPrice",
    }),
  },
  components: {
    TheButton,
  },
};
</script>

<style>
.the-cart {
  flex: 1;
  display: flex;
  flex-direction: column;
  padding: 11px 22px;
}

.the-cart__heading {
  font-size: 25px;
  font-weight: bold;
  border-bottom: 1px solid rgb(173, 173, 173);
}

.qty-input {
  width: 50px;
  padding: 5px 7px !important;
}

.action-icon--delete-small {
  height: 14px !important;
}
</style>
