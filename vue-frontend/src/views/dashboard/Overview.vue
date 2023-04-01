<template>Logged is as {{ username }}</template>

<script>
import { mapState } from "pinia";
import { useAuthStore } from "../../store/authStore";
export default {
  computed: {
    ...mapState(useAuthStore, {
      username: "username",
    }),
  },
  methods: {},
};
</script>
