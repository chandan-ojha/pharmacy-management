<?php

namespace App\Http\Controllers;

use App\Models\Drug;
use App\Models\Sell;
use App\Models\Vendor;
use Illuminate\Http\Request;

class DashboardController extends BaseController
{
    /**
     * Overview
     */
    public function get_overview()
    {
        $totalVendors = Vendor::count();
        $totalDrugs = Drug::count();
        $totalSell = Sell::count();
        $thisweekStat = [
            (object) ['name' => 'Sunday', 'sells' => 1100],
            (object) ['name' => 'Monday', 'sells' => 2000],
            (object) ['name' => 'Tuesday', 'sells' => 3000],
            (object) ['name' => 'Wednesday', 'sells' => 1000],
            (object) ['name' => 'Thursday', 'sells' => 1000],
            (object) ['name' => 'Friday', 'sells' => 1200],
            (object) ['name' => 'Saturday', 'sells' => 1500],
        ];

        return $this->sendResponse(200, 'Success.',
            [
                'totalVendors' => $totalVendors,
                'totalDrugs' => $totalDrugs,
                'totalSell' => $totalSell,
                'thisweekStat' => $thisweekStat
            ]
        );
        //~ Error Response
        return $this->sendError('400', 'Something went wrong!');
    }
}
