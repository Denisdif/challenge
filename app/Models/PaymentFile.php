<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentFile extends Model
{
    use HasFactory;
    protected $table ='payment_files';

    /**
     * Relaciones
     */

    public function vouchers()
    {
        return $this->hasMany(Vouchers::class);
    }

    public function paymentFileStatus(){

        return $this->belongsTo(payment_file_status::class, 'payment_file_status_id');
    }

    public function user(){

        return $this->belongsTo(User::class, 'user_id');
    }

    public function company(){

        return $this->belongsTo(Company::class, 'company_id');
    }

    public function organization(){

        return $this->belongsTo(Organization::class, 'organization_id');
    }
}
