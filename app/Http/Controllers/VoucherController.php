<?php

namespace App\Http\Controllers;

use App\Models\Voucher;
use Illuminate\Http\Request;
use App\Exports\VoucherExport;
use Maatwebsite\Excel\Facades\Excel;
class VoucherController extends Controller
{
    public function index(Request $request){
        $vouchers = Voucher::number($request->number)
                            ->account($request->account)
                            ->date($request->create_date_start, $request->create_date_end)
                            ->brand($request->brand)
                            ->orderBy('id','desc')
                            ->paginate(5);
        return view('home',compact('vouchers'));
    }

    public function export(Request $request){
        $vouchers = Voucher::number($request->number)
                            ->account($request->account)
                            ->date($request->create_date_start, $request->create_date_end)
                            ->brand($request->brand)
                            ->orderBy('id','desc')
                            ->get();
        $export = new VoucherExport($vouchers);
        return Excel::download($export, 'vouchers.csv');
    }
}
