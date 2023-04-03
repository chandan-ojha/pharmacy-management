import { axiosPrivate } from "./axiosInstance";

export default {
  getVendors() {
    return axiosPrivate.get("/get-vendor-list");
  },

  addVendor(payload) {
    return axiosPrivate.post("/create-vendor", payload);
  },

  editVendor(payload) {
    return axiosPrivate.put("/update-vendor/" + payload.id, payload);
  },

  deleteVendor(id) {
    return axiosPrivate.delete("/delete-vendor/" + id);
  },

  getDrugs() {
    return axiosPrivate.get("/get-drug-list");
  },

  addDrug(payload) {
    return axiosPrivate.post("/create-drug", payload);
  },

  editDrug(payload) {
    return axiosPrivate.put("/update-drug/" + payload.id, payload);
  },

  deleteDrug(id) {
    return axiosPrivate.delete("/delete-drug/" + id);
  },

  searchDrug(searchString) {
    return axiosPrivate.post("/search-drug", {
      searchString: searchString,
    });
  },

  placeOrder(payload) {
    return axiosPrivate.post("/place-order", payload);
  },

  getSellHistory() {
    return axiosPrivate.get("/get-sell-history");
  },

  deleteSellHistory(sell_id) {
    return axiosPrivate.delete("/delete-sell-history/" + sell_id);
  },

  getOverview() {
    return axiosPrivate.get("/get-overview");
  },
};
