<?php

namespace App\Http\Controllers;

use App\Models\Voucher;
use Illuminate\Http\Request;

class VoucherController extends Controller
{
    public function index(Request $request){
        $vouchers = Voucher::number($request->number)
                            ->account($request->account)
                            ->date($request->create_date_start, $request->create_date_end)
                            ->brand($request->brand)
                            ->get();
        return view('home',compact('vouchers'));
    }
}
