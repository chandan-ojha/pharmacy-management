<?php

namespace App\Http\Controllers;

use App\Models\Sell;
use Illuminate\Http\Request;

class SellController extends BaseController
{
    /**
     * Get Sell History
     */
    public function get_sell_history()
    {
        $sell_history = Sell::get(['id','customer_name','customer_phone','total_items']);

        //~ Check Availability of data
        if (count($sell_history) > 0) {
            return $this->sendResponse(200, 'Success.',
                [
                    'count_data' => count($sell_history),
                    'sell_history' => $sell_history
                ]
            );
        }
        //~ Error Response
        return $this->sendError('400', 'Something went wrong!');
    }

    /**
     * Delete Sell History
     */
    public function delete_sell_history($sell_id)
    {
        $sell_history = Sell::where('id',$sell_id)->first();

        if($sell_history->delete())
        {
            return response()->json([
                'status_code' =>200,
                'message' =>"Sell history deleted successfully!"
            ]);
        }
        else {
            return response()->json([
                'status_code' =>400,
                'message' =>"Something went wrong!"
            ]);
        }
    }
}
