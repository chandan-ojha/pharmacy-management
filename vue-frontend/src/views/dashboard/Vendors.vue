<template>
  <div class="d-flex jc-between ai-center">
    <h2>All Vendors</h2>
    <TheButton @click="addModal = true">Add New</TheButton>
  </div>
  <table class="mt-4">
    <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="i in 9" :key="i">
        <td>Pencilium</td>
        <td>Pencilium Des</td>
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
    <h2>Enter Vendor Details</h2>
  </TheModal>
</template>

<script>
import TheButton from "../../components/TheButton.vue";
import TheModal from "../../components/TheModal.vue";
export default {
  data: () => ({
    addModal: false,
  }),
  components: {
    TheButton,
    TheModal,
  },
};
</script>
