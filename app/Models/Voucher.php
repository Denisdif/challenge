<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    use HasFactory;
    protected $table ='vouchers';

    /**
     * Relaciones
     */

    public function voucherStatus(){

        return $this->belongsTo(VoucherStatus::class, 'voucher_status_id');
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

    public function gsaOrganization(){

        return $this->belongsTo(Organization::class, 'gsa_organization_id');
    }

    public function paymentFile(){

        return $this->belongsTo(PaymentFile::class, 'payment_file_id');
    }
}
