<template>
  <h2>Overview</h2>
  <!-- {{ projectName }} -->
</template>

<script>
import { infoStore } from "../../data/info";
export default {
  data: () => ({
    projectName: infoStore.projectName,
  }),
};
</script>
