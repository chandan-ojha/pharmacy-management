<script>
import { useThemeStore } from "../../../store/themeStore";
import { mapActions } from "pinia";
import { mapState } from "pinia";
import TheButton from "../../../components/TheButton.vue";
export default {
  data: () => ({}),
  computed: {
    ...mapState(useThemeStore, {
      brandColor: "brandColor",
    }),
  },
  components: {
    TheButton,
  },
  methods: {
    ...mapActions(useThemeStore, {
      setBrandColor: "setBrandColor",
    }),
    handleInput(e) {
      this.setBrandColor(e.target.value);
    },
  },
};
</script>
<template>
  <div>
    <br />
    <div>Brand Color</div>
    <div class="brand-color"></div>
    <input
      :value="brandColor"
      type="color"
      name="bc"
      id="bc"
      class="mt-2"
      @input="handleInput"
    />
    <br />
  </div>
  <TheButton>Save</TheButton>
</template>

<style scoped>
.brand-color {
  background-color: var(--brand-color);
  width: 444px;
  height: 444px;
}
</style>
