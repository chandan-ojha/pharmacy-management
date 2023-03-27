<?php

namespace App\Http\Controllers;

use App\Models\Drug;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class DrugController extends BaseController
{
    /***
     * Api:1
     * Purpose: Get Drug List
     */
    public function get_drug_list()
    {
        $drug_list = Drug::get(['id','name', 'weight', 'type', 'vendor', 'price', 'quantity']);

        //~ Check Availability of data
        if (count($drug_list) > 0) {
            return $this->sendResponse(200, 'Success.',
                [
                    'count_data' => count($drug_list),
                    'drug_list' => $drug_list
                ]
            );
        }
        //~ Error Response
        return $this->sendError('400', 'Something went wrong!');
    }

    /***
     * Api:2
     * Purpose: Create Drug
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function create_drug(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'weight' => 'required',
            'type' => 'required',
            'vendor' => 'required',
            'price' => 'required',
            'quantity' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status_code' => 400,
                'message' => 'Validation Error.',
            ]);
        }

        $drug = new Drug();
        $drug->name = $request->name;
        $drug->weight = $request->weight;
        $drug->type = $request->type;
        $drug->vendor = $request->vendor;
        $drug->price = $request->price;
        $drug->quantity = $request->quantity;

        if ($drug->save()) {
            return response()->json([
                'status_code' => 200,
                'message' => "Drug created successfully!",
                'data' => $drug->where('id', $drug->id)
                    ->first(['id', 'name', 'weight', 'type', 'vendor', 'price', 'quantity'])
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
     * Purpose: Update Drug
     * @param Request $request
     * @param $drug_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update_drug(Request $request, $drug_id)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'weight' => 'required',
            'type' => 'required',
            'vendor' => 'required',
            'price' => 'required',
            'quantity' => 'required',
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status_code'=>400,
                'message'=>'Validation Error.',
            ]);
        }

        $update_drug = Drug::where('id',$drug_id)->first();
        $update_drug->name = $request->name;
        $update_drug->weight = $request->weight;
        $update_drug->type = $request->type;
        $update_drug->vendor = $request->vendor;
        $update_drug->price = $request->price;
        $update_drug->quantity = $request->quantity;

        if($update_drug->save())
        {
            return response()->json([
                'status_code' =>200,
                'message' =>"Drug updated successfully!",
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
     * Purpose: Delete Drug
     * @param $drug_id
     */
    public function delete_drug($drug_id)
    {
        $drug = Drug::where('id',$drug_id)->first();

        if($drug->delete())
        {
            return response()->json([
                'status_code' =>200,
                'message' =>"Drug deleted successfully!"
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
