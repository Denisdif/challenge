<?php

namespace App\Exports;

use App\Models\Voucher;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class VoucherExport implements FromView
{
    /**
    * @return \Illuminate\Support\View
    */
    protected $vouchers;

    public function __construct($vouchers)
    {
        $this->vouchers = $vouchers;
    }

    public function view(): View
    {
        return view('vouchers_table', [
            'vouchers' => $this->vouchers,
        ]);
    }
}
