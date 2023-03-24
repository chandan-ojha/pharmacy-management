import { createApp } from "vue";
import mitt from "mitt";
import App from "./App.vue";
import router from "./router";

import "./assets/css/ayoflex.css";
import "./assets/css/example.css";

const eventBus = mitt();

const app = createApp(App);
app.use(router);
app.config.globalProperties.$eventBus = eventBus;

app.mount("#app");
