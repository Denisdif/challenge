<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Organization extends Model
{
    use HasFactory;
    protected $table ='organizations';

    /**
     * Relaciones
     */

    public function paymentFiles()
    {
        return $this->hasMany(Payment_file::class);
    }

    public function users()
    {
        return $this->hasMany(User::class);
    }
}
