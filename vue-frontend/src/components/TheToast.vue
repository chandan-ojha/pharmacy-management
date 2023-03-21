<template>
  <div :class="['toast', 'toast__' + toastType]">
    <div class="toast__header">
      <span> {{ toastType }}</span>
      <span> X</span>
    </div>

    <div class="toast__body">
      {{ message }}
    </div>
  </div>
</template>

<script>
export default {
  props: {
    toastType: {
      type: String,
      default: "Success",
    },
    message: {
      type: String,
      default: "Toast Message",
    },
  },
};
</script>

<style scoped>
.toast {
  width: 299px;
  box-shadow: 0 0 6px 2px rgba(0, 0, 0, 0.5);
  min-height: 22px;
  margin: 11px;
  background-color: #fff;
  border-radius: 2px;
  color: green;
}

.toast__Error {
  color: red;
}

.toast__header {
  border-radius: 3px 3px 0 0;
  background-color: rgb(215, 255, 215);
  font-weight: bold;
  padding: 5px 11px;
  display: flex;
  justify-content: space-between;
}

.toast__Error .toast__header {
  background-color: rgb(252, 198, 198);
}

.toast__body {
  padding: 11px;
}

.toast__close {
  cursor: pointer;
}
</style>
