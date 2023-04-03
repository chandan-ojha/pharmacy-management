<template>
  <div class="overview-card">
    <div class="overview-card__left">{{ title }}</div>
    <div class="overview-card__right">{{ description }}</div>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      default: 0,
    },
    description: {
      default: "ddd",
    },
  },
};
</script>

<style>
.overview-card {
  display: flex;
  background-color: #fff;
  min-height: 88px;
  border: 1px solid #fff;
  cursor: pointer;
  border-radius: 3px;
}

.overview-card:hover {
  box-shadow: 0 0 6px 3px #a9a9a9;
}

.overview-card__left {
  padding: 18px 30px;
  background-color: rgb(255 236 236);
  display: flex;
  justify-content: center;
  align-items: center;
  color: var(--brand-color);
  font-size: 33px;
  font-weight: bold;
  border-radius: 3px 0 0 3px;
}

.overview-card__right {
  padding: 22px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 1;
  font-size: 30px;
  border-radius: 0 3px 3px 0;
}
</style>
