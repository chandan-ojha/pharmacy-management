<template>
  <div class="sidebar">
    <div class="sidebar__top">
      <h5 class="brand">Pharmacy Management</h5>
    </div>
    <div class="sidebar__bottom">
      <div class="sidebar__nav pt-5">
        <router-link to="/dashboard/overview">Overview</router-link>
        <router-link to="/dashboard/drugs">Drugs</router-link>
        <router-link to="/dashboard/vendors">Vendors</router-link>
        <router-link to="/dashboard/selling-history">
          Selling History
        </router-link>
        <router-link to="/dashboard/settings">Setting</router-link>
      </div>
    </div>
  </div>
</template>

<style>
.sidebar {
  flex: 1;
  display: flex;
  flex-direction: column;
  background-color: var(--brand-color);
  color: #f0faf5;
}

.sidebar__top {
  padding: 11px 22px;
  color: #c39f9f;
  text-shadow: 0 1px 0 #040404;
}

.sidebar__bottom {
  flex: 1;
  overflow-y: auto;
}

.sidebar__nav a,
.sidebar__nav a:visited {
  display: block;
  padding: 9px 22px;
  text-decoration: none;
  border-bottom: 1px solid var(--brand-color);
  color: #a7a097;
  border-left: 4px solid var(--brand-color);
  text-shadow: none;
}

.sidebar__nav a:hover,
.sidebar__nav a.router-link-active {
  font-weight: bold;
  background-color: rgba(255, 255, 255, 0.09);
  border-left: 4px solid #ff5602;
  color: #cfcfcf;
}

.brand {
  color: #ffab81;
  font-size: 17px;
}
</style>
