<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VoucherStatus extends Model
{
    use HasFactory;
    protected $table ='voucher_status';
    public $timestamps = false;

    /**
     * Relaciones
     */

    public function vouchers()
    {
        return $this->hasMany(Vouchers::class);
    }
}
