<?php

namespace Database\Factories;

use App\Models\Company;
use App\Models\Organization;
use App\Models\PaymentFile;
use App\Models\PaymentFileStatus;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class PaymentFileFactory extends Factory
{
    protected $model = PaymentFile::class;
    
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => User::factory(),
            'organization_id' => Organization::factory(),
            'payment_file_status_id' => PaymentFileStatus::factory(),
            'company_id' => Company::factory(),
            'cycle_start' => $this->faker->dateTimeBetween('+0 days', '+2 days'),
            'cycle_end' => $this->faker->dateTimeBetween('+0 days', '+2 days'),
            'account' => $this->faker->randomElement(['Avis', 'Budget']),
        ];
    }
}
