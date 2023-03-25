<?php

namespace App\Http\Controllers;

use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VendorController extends BaseController
{
    /***
     * Api:1
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

}
