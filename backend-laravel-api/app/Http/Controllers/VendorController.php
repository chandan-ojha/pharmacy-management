<?php

namespace App\Http\Controllers;

use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VendorController extends BaseController
{
    /***
     * Api:1
     * Purpose: Get Vendor List
     */
    public function get_vendor_list()
    {
        $vendor_list = Vendor::get(['id', 'name', 'description']);

        //~ Check Availability of data
        if (count($vendor_list) > 0) {
            return $this->sendResponse(200, 'Success.',
                [
                    'count_data' => count($vendor_list),
                    'vendor_list' => $vendor_list
                ]
            );
        }
        //~ Error Response
        return $this->sendError('400', 'Something went wrong!');
    }

    /***
     * Api:2
     * Purpose: Create Vendor
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function create_vendor(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'description' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status_code' => 400,
                'message' => 'Validation Error.',
            ]);
        }

        $vendor = new Vendor();
        $vendor->name = $request->name;
        $vendor->description = $request->description;

        if ($vendor->save()) {
            return response()->json([
                'status_code' => 200,
                'message' => "Vendor created successfully!",
                'data' => $vendor->where('id', $vendor->id)
                    ->first(['id', 'name', 'description'])
            ]);
        } else {
            return response()->json([
                'status_code' => 400,
                'message' => "Something went wrong!"
            ]);
        }
    }

    /***
     * Api:3
     * Purpose: Update Vendor
     * @param Request $request
     * @param $vendor_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update_vendor(Request $request, $vendor_id)
    {
        $validator = Validator::make($request->all(),[
            'name' =>'required',
            'description' =>'required',
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status_code'=>400,
                'message'=>'Validation Error.',
            ]);
        }

        $update_vendor = Vendor::where('id',$vendor_id)->first();
        $update_vendor->name = $request->name;
        $update_vendor->description = $request->description;

        if($update_vendor->save())
        {
            return response()->json([
                'status_code' =>200,
                'message' =>"Vendor updated successfully!",
            ]);
        }
        else
        {
            return response()->json([
                'status_code' =>400,
                'message' =>"Something went wrong!"
            ]);
        }

    }

    /***
     * Api:4
     * Purpose: Delete Vendor
     * @param $vendor_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete_vendor($vendor_id)
    {
        $vendor = Vendor::where('id',$vendor_id)->first();

        if($vendor->delete())
        {
            return response()->json([
                'status_code' =>200,
                'message' =>"Vendor deleted successfully!"
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
