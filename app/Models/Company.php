<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    use HasFactory;
    protected $table ='companies';

    /**
     * Relaciones
     */

    public function vouchers()
    {
        return $this->hasMany(Vouchers::class);
    }

    public function paymentFiles()
    {
        return $this->hasMany(Payment_file::class);
    }
}
