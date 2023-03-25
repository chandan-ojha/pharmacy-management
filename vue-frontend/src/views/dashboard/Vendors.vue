<template>
  <div class="d-flex jc-between ai-center">
    <h2>All Vendors</h2>
    <TheButton @click="addModal = true">Add New</TheButton>
  </div>
  <div class="text-center" v-if="gettingVendors">Loading....</div>
  <table class="mt-4" v-else>
    <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="vendor in vendors" :key="vendor.name">
        <td>{{ vendor.name }}</td>
        <td>{{ vendor.description }}</td>
        <td>
          <img src="/img/edit.png" alt="" class="action-icon" />
          <img
            src="/img/trash.png"
            alt=""
            class="action-icon action-icon--delete ml-3"
          />
        </td>
      </tr>
    </tbody>
  </table>
  <TheModal v-model="addModal" heading="Add new vendor">
    <form @submit.prevent="addNew">
      <label class="block">Vendor Name</label>
      <input
        type="text"
        placeholder="Enter vendor name"
        class="mt-1 w-100"
        required
        v-model="newVendor.name"
      />
      <label class="block mt-3">Description</label>
      <input
        type="text"
        placeholder="Write short description"
        class="mt-1 w-100"
        required
        v-model="newVendor.description"
      />
      <TheButton :loading="adding" class="w-100 mt-4"> Add </TheButton>
    </form>
  </TheModal>
</template>

<script>
import axios from "axios";
import TheButton from "../../components/TheButton.vue";
import TheModal from "../../components/TheModal.vue";
export default {
  data: () => ({
    addModal: false,
    newVendor: {
      name: "",
      description: "",
    },
    adding: false,
    vendors: [],
    gettingVendors: false,
  }),
  components: {
    TheButton,
    TheModal,
  },
  methods: {
    resetForm() {
      this.newVendor = { name: "", description: "" };
    },
    getAllvendors() {
      this.gettingVendors = true;
      axios
        .get("http://127.0.0.1:8000/api/get-vendor-list", {
          headers: {
            authorization: localStorage.getItem("accessToken"),
          },
        })
        .then((res) => {
          console.log(res.data);
          this.vendors = res.data.vendor_list;
        })
        .catch((err) => {
          let errorMessage = "Something went wrong";
          if (err.response) {
            errorMessage = err.response.data.message;
          }
          this.$eventBus.emit("toast", {
            type: "Error",
            message: errorMessage,
          });
        })
        .finally(() => {
          this.gettingVendors = false;
        });
    },
    addNew() {
      //console.log(localStorage.getItem("accessToken"));
      this.adding = true;
      axios
        .post("http://127.0.0.1:8000/api/create-vendor", this.newVendor, {
          headers: {
            authorization: localStorage.getItem("accessToken"),
          },
        })
        .then((res) => {
          this.$eventBus.emit("toast", {
            type: "Success",
            message: res.data.message,
          });
          this.addModal = false;
          this.resetForm();
        })
        .catch((err) => {
          let errorMessage = "Something went wrong";
          if (err.response) {
            errorMessage = err.response.data.message;
          }
          this.$eventBus.emit("toast", {
            type: "Error",
            message: errorMessage,
          });
        })
        .finally(() => {
          this.adding = false;
        });
    },
  },
};
</script>
