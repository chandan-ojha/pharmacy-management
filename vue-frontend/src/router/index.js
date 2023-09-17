import { createRouter, createWebHistory } from "vue-router";
import LoginPage from "../views/Login.vue";
import DashboardPage from "../views/Dashboard.vue";
const Overview = () => import("../views/dashboard/Overview.vue");
const Drugs = () => import("../views/dashboard/Drugs.vue");
const Vendors = () => import("../views/dashboard/Vendors.vue");
const SellingHistory = () => import("../views/dashboard/SellingHistory.vue");
const Settings = () => import("../views/dashboard/Settings.vue");
const Account = () => import("../views/dashboard/settings/Account.vue");
const Website = () => import("../views/dashboard/settings/Website.vue");
const Theme = () => import("../views/dashboard/settings/Theme.vue");

const routes = [
  { path: "/", component: LoginPage },
  {
    path: "/dashboard",
    component: DashboardPage,
    redirect: "/dashboard/overview",
    children: [
      { path: "overview", component: Overview },
      { path: "drugs", component: Drugs },
      { path: "vendors", component: Vendors },
      { path: "selling-history", component: SellingHistory },
      {
        path: "settings",
        component: Settings,
        redirect: "/dashboard/settings/account",
        children: [
          { path: "account", component: Account },
          { path: "website", component: Website },
          { path: "theme", component: Theme },
        ],
      },
    ],
  },
];

const router = createRouter({
  routes,
  history: createWebHistory(),
});

// router.beforeEach((to, from) => {
//   console.log("To: ", to);
//   console.log("From", from);
// });

export default router;
