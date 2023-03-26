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
};
