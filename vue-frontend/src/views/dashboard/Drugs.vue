<template>
  <div class="d-flex jc-between ai-center">
    <h2>All Drugs</h2>
    <TheButton @click="addModal = true">Add New</TheButton>
  </div>
  <div class="text-center" v-if="gettingDrugs">Loading....</div>
  <table class="mt-4" v-else>
    <thead>
      <tr>
        <th>Name</th>
        <th>Weight</th>
        <th>Type</th>
        <th>Vendor</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="drug in drugs" :key="drug.name">
        <td>{{ drug.name }}</td>
        <td>{{ drug.weight }}</td>
        <td>{{ drug.type }}</td>
        <td>{{ drug.vendor }}</td>
        <td>{{ drug.price }}</td>
        <td>{{ drug.quantity }}</td>
        <td>
          <img
            src="/img/edit.png"
            alt=""
            class="action-icon"
            @click="
              selectedDrug = drug;
              editModal = true;
            "
          />
          <img
            src="/img/trash.png"
            alt=""
            class="action-icon action-icon--delete ml-3"
            @click="
              selectedDrug = drug;
              deleteModal = true;
            "
          />
        </td>
      </tr>
    </tbody>
  </table>

  <!-- add drug modal -->
  <TheModal v-model="addModal" heading="Add new drug">
    <form @submit.prevent="addNew">
      <label class="block">Select Drug Type</label>
      <div class="mt-2">
        <label>
          <input
            type="radio"
            name="drugType"
            value="Tab"
            v-model="newDrug.type"
          />
          Tab
        </label>
        <label class="ml-2">
          <input
            type="radio"
            name="drugType"
            value="Capsule"
            v-model="newDrug.type"
          />
          Capsule
        </label>
        <label class="ml-2">
          <input
            type="radio"
            name="drugType"
            value="Syrup"
            v-model="newDrug.type"
          />
          Syrup
        </label>
        <label class="ml-2">
          <input
            type="radio"
            name="drugType"
            value="Suppository"
            v-model="newDrug.type"
          />
          Suppository
        </label>
      </div>

      <label class="block mt-3">Drug Name</label>
      <input
        type="text"
        placeholder="Drug name"
        class="mt-1 w-100"
        v-model="newDrug.name"
      />

      <label class="block mt-3">Weight</label>
      <input
        type="text"
        placeholder="Weight in mg"
        class="mt-1 w-100"
        v-model="newDrug.weight"
      />

      <label class="block mt-3">Vendor</label>
      <select v-model="newDrug.vendor">
        <option value="">Select One</option>
        <option
          v-for="vendor in vendors"
          :key="vendor.name"
          :value="vendor.name"
        >
          {{ vendor.name }}
        </option>
      </select>

      <label class="block mt-3">Price</label>
      <input
        type="text"
        placeholder="Pack Price"
        class="mt-1 w-100"
        v-model="newDrug.price"
      />

      <label class="block mt-3">Quantity</label>
      <input
        type="text"
        placeholder="Enter quantity"
        class="mt-1 w-100"
        v-model="newDrug.quantity"
      />
      <TheButton :loading="adding" class="w-100 mt-4"> Add </TheButton>
    </form>
  </TheModal>

  <!-- edit vendor modal -->
  <TheModal v-model="editModal" heading="Edit vendor">
    <form @submit.prevent="editDrug">
      <label class="block">Select Drug Type</label>
      <div class="mt-2">
        <label>
          <input
            type="radio"
            name="drugType"
            value="Tab"
            v-model="selectedDrug.type"
          />
          Tab
        </label>
        <label class="ml-2">
          <input
            type="radio"
            name="drugType"
            value="Tab"
            v-model="selectedDrug.type"
          />
          Capsule
        </label>
        <label class="ml-2">
          <input
            type="radio"
            name="drugType"
            value="Tab"
            v-model="selectedDrug.type"
          />
          Syrup
        </label>
        <label class="ml-2">
          <input
            type="radio"
            name="drugType"
            value="Tab"
            v-model="selectedDrug.type"
          />
          Suppository
        </label>
      </div>

      <label class="block mt-3">Drug Name</label>
      <input
        type="text"
        placeholder="Drug name"
        class="mt-1 w-100"
        v-model="selectedDrug.name"
      />

      <label class="block mt-3">Weight</label>
      <input
        type="text"
        placeholder="Weight in mg"
        class="mt-1 w-100"
        v-model="selectedDrug.weight"
      />

      <label class="block mt-3">Vendor</label>
      <select v-model="selectedDrug.vendor">
        <option value="">Select One</option>
        <option
          v-for="vendor in vendors"
          :key="vendor.name"
          :value="vendor.name"
        >
          {{ vendor.name }}
        </option>
      </select>

      <label class="block mt-3">Price</label>
      <input
        type="text"
        placeholder="Pack Price"
        class="mt-1 w-100"
        required
        v-model="selectedDrug.price"
      />

      <label class="block mt-3">Quantity</label>
      <input
        type="text"
        placeholder="Enter quantity"
        class="mt-1 w-100"
        required
        v-model="selectedDrug.quantity"
      />
      <TheButton :loading="editing" class="w-100 mt-4">
        Save Changes
      </TheButton>
    </form>
  </TheModal>

  <!-- delete vendor modal -->
  <TheModal v-model="deleteModal" heading="Are you sure?">
    <p>
      Do you really want to delete?
      <strong>{{ selectedDrug.name }}</strong>
    </p>
    <TheButton class="mt-4" @click="deleteDrug" :loading="deleting">
      Yes
    </TheButton>
    <TheButton class="ml-4" color="gray" @click="deleteModal = false">
      No
    </TheButton>
  </TheModal>
</template>

<script>
import TheButton from "../../components/TheButton.vue";
import TheModal from "../../components/TheModal.vue";
import { showErrorMessage, showSuccessMessage } from "../../utils/functions";
import privateService from "../../service/privateService";

export default {
  data: () => ({
    addModal: false,
    deleteModal: false,
    editModal: false,

    newDrug: {
      name: "",
      weight: "",
      type: "",
      vendor: "",
      price: "",
      quantity: "",
    },
    selectedDrug: {},
    deleting: false,
    editing: false,
    adding: false,
    drugs: [],
    gettingDrugs: false,
    vendors: [],
  }),
  components: {
    TheButton,
    TheModal,
  },
  mounted() {
    setTimeout(this.getAllDrugs, 100);
    setTimeout(this.getAllVendors, 100);
  },
  methods: {
    resetForm() {
      this.newDrug = {
        name: "",
        weight: "",
        type: "",
        vendor: "",
        price: "",
        quantity: "",
      };
    },

    //get all drugs
    getAllDrugs() {
      this.gettingDrugs = true;

      privateService
        .getDrugs()
        .then((res) => {
          //console.log(res.data);
          this.drugs = res.data.drug_list;
        })
        .catch((err) => {
          showErrorMessage(err);
        })
        .finally(() => {
          this.gettingDrugs = false;
        });
    },

    //get all vendors
    getAllVendors() {
      privateService
        .getVendors()
        .then((res) => {
          this.vendors = res.data.vendor_list;
        })
        .catch((err) => {
          showErrorMessage(err);
        });
    },

    //add drug
    addNew() {
      this.adding = true;
      privateService
        .addDrug(this.newDrug)
        .then((res) => {
          showSuccessMessage(res);
          this.addModal = false;
          this.resetForm();
          this.getAllDrugs();
        })
        .catch((err) => {
          showErrorMessage(err);
        })
        .finally(() => {
          this.adding = false;
        });
    },

    //edit vendor
    editDrug() {
      this.editing = true;
      privateService
        .editDrug(this.selectedDrug)
        .then((res) => {
          showSuccessMessage(res);
          this.editModal = false;
        })
        .catch((err) => {
          showErrorMessage(err);
        })
        .finally(() => {
          this.editing = false;
        });
    },

    //delete vendor
    deleteDrug() {
      this.deleting = true;
      privateService
        .deleteDrug(this.selectedDrug.id)
        .then((res) => {
          showSuccessMessage(res);
          this.deleteModal = false;
          this.getAllDrugs();
        })
        .catch((err) => {
          showErrorMessage(err);
        })
        .finally(() => {
          this.deleting = false;
        });
    },
  },
};
</script>
