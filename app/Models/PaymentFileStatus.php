<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentFileStatus extends Model
{
    use HasFactory;
    protected $table ='payment_file_status';
    public $timestamps = false;
    
    /**
     * Relaciones
     */

    public function paymentFiles()
    {
        return $this->hasMany(PaymentFile::class);
    }
}
