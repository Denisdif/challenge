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

    public function booking(){

        return $this->belongsTo(Booking::class, 'booking_id');
    }

    /**
     * Filtros
     */

    public function scopeNumber($query, $number){
        if ($number)
            return $query->where('number', '=', "$number");
    }
    public function scopeAccount($query, $account){
        if ($account) {
            return $query->join('organizations','vouchers.organization_id','=','organizations.id')
                         ->select('vouchers.*','organizations.name')
                         ->where('organizations.name', 'LIKE', "%$account%");
        }
    }
    public function scopeDate($query, $start, $end){
        if($start and $end)
            return $query->whereBetween('issue_date', [$start,$end]);
        if($start and $end == null)
            return $query->where('issue_date', '>=' ,$start);
        if($start == null and $end)
            return $query->where('issue_date', '<=' ,$end);
    }
    public function scopeBrand($query, $brand){
        if ($brand) {
            return $query->join('companies','vouchers.company_id','=','companies.id')
                         ->select('vouchers.*','companies.name')
                         ->where('companies.name', '=', "$brand");
        }
    }
}
