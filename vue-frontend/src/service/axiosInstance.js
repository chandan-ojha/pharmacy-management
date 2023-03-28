import axios from "axios";

const API_BASE_URL = "http://127.0.0.1:8000/api";

export const axiosPublic = axios.create({
  baseURL: API_BASE_URL,
  timeout: 60000,
});

export const axiosPrivate = axios.create({
  baseURL: API_BASE_URL,
  timeout: 60000,
});

axiosPrivate.interceptors.request.use(
  function (response) {
    return response;
  },
  function (error) {
    //console.log("Error: ", error);
    if (error.response && error.response.status == 401) {
      localStorage.removeItem("accessToken");
      location.href = "/";
    }
    return Promise.reject(error);
  }
);

export const setPrivateHeaders = () => {
  axiosPrivate.defaults.headers.common["authorization"] =
    localStorage.getItem("accessToken");
};
