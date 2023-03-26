import { eventBus } from "./eventBus";

export const showErrorMessage = (error) => {
  let errorMessage = error || "Something went wrong";

  if (error.response) {
    errorMessage = error.response.data.message;
  }

  eventBus.emit("toast", {
    type: "Error",
    message: errorMessage,
  });
};

export const showSuccessMessage = (payload) => {
  let successMessage = payload || "Success";

  if (payload.data) {
    successMessage = payload.data.message;
  }

  eventBus.emit("toast", {
    type: "Success",
    message: successMessage,
  });
};
