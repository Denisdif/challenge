<?php

namespace App\Http\Controllers;

use App\Models\Voucher;
use Illuminate\Http\Request;

class VoucherController extends Controller
{
    public function index(Request $request){
        $vouchers = Voucher::all();
        return view('home',compact('vouchers'));
    }
}
