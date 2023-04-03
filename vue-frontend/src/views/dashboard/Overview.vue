<template>
  <h2>Overview</h2>
  <div class="text-center" v-if="gettingOverview">Loading...</div>
  <div v-else>
    <div class="row mt-3">
      <div class="col-4">
        <router-link class="card-link" to="/dashboard/vendors">
          <OverviewCard
            :title="overview.totalVendors"
            description="Vendors"
          ></OverviewCard>
        </router-link>
      </div>
      <div class="col-4">
        <router-link class="card-link" to="/dashboard/drugs">
          <OverviewCard
            :title="overview.totalDrugs"
            description="Drugs"
          ></OverviewCard>
        </router-link>
      </div>
      <div class="col-4">
        <router-link class="card-link" to="/dashboard/selling-history">
          <OverviewCard
            :title="overview.totalSell"
            description="Sells"
          ></OverviewCard>
        </router-link>
      </div>
    </div>

    <h2 class="mt-4">This Week Statistics</h2>

    <Chart
      :size="{ width: 800, height: 400 }"
      :data="overview.thisweekStat"
      :margin="margin"
      :direction="direction"
      class="mt-4"
    >
      <template #layers>
        <Grid strokeDasharray="2,2" />
        <Line
          :dataKeys="['name', 'sells']"
          :lineStyle="{ strokeWidth: '10px' }"
        />
      </template>
    </Chart>
  </div>
</template>

<script>
import { mapState } from "pinia";
import { useAuthStore } from "../../store/authStore";
import privateService from "../../service/privateService";
import OverviewCard from "../../components/OverviewCard.vue";
import { Chart, Grid, Line } from "vue3-charts";

export default {
  components: {
    OverviewCard,
    Chart,
    Grid,
    Line,
  },
  data: () => ({
    overview: {},
    gettingOverview: true,
    direction: "horizontal",
    margin: {
      left: 0,
      top: 20,
      right: 20,
      bottom: 0,
    },
  }),
  computed: {
    ...mapState(useAuthStore, {
      username: "username",
    }),
  },
  methods: {
    getOverview() {
      this.gettingOverview = true;
      privateService
        .getOverview()
        .then((res) => {
          this.overview = res.data;
        })
        .catch((e) => {})
        .finally(() => {
          this.gettingOverview = false;
        });
    },
  },
  mounted() {
    setTimeout(this.getOverview, 333);
  },
};
</script>
