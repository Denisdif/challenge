<?php

namespace Database\Factories;

use App\Models\VoucherStatus;
use Illuminate\Database\Eloquent\Factories\Factory;

class VoucherStatusFactory extends Factory
{
    protected $model = VoucherStatus::class;
    
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->randomElement(['Issued', 'Voided']),
            'display_order' => $this->faker->numerify('########'),
        ];
    }
}
