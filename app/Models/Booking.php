<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;
    protected $table ='bookings';

    /**
     * Relaciones
     */

    public function vouchers()
    {
        return $this->hasMany(Vouchers::class);
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
