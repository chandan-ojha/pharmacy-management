<template>
  <div class="tab">
    <RouterLink to="/dashboard/settings/account">Account</RouterLink>
    <RouterLink to="/dashboard/settings/website">Website</RouterLink>
    <RouterLink to="/dashboard/settings/theme">Theme</RouterLink>
  </div>
  <router-view></router-view>
</template>

<style>
.tab a {
  text-decoration: none;
  padding: 3px 9px;
  display: inline-block;
  color: #333;
}

.tab a.router-link-active {
  border-bottom: 3px solid var(--brand-color);
}
</style>
