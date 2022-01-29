<?php

namespace Database\Factories;

use App\Models\PaymentFileStatus;
use Illuminate\Database\Eloquent\Factories\Factory;

class PaymentFileStatusFactory extends Factory
{
    protected $model = PaymentFileStatus::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->randomElement(['Confirmed', 'Otro estado']),
            'display_order' => $this->faker->numerify('########'),
        ];
    }
}
