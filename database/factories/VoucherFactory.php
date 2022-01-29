<?php

namespace Database\Factories;

use App\Models\Booking;
use App\Models\Company;
use App\Models\Organization;
use App\Models\PaymentFile;
use App\Models\User;
use App\Models\Voucher;
use App\Models\VoucherStatus;
use Illuminate\Database\Eloquent\Factories\Factory;

class VoucherFactory extends Factory
{
    protected $model = Voucher::class;
    
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'booking_id' => Booking::factory(),
            'gsa_organization_id' => Organization::factory(),
            'organization_id' => Organization::factory(),
            'user_id' => User::factory(),
            'payment_file_id' => $this->faker->randomElement([PaymentFile::factory(), null]),
            'company_id' => Company::factory(),
            'iata_code' => $this->faker->bothify('????????#######'),
            'voucher_status_id' => VoucherStatus::factory(),
            'past_due' => $this->faker->randomElement([0, 1]),
            'account' => $this->faker->name(),
            'booking_base_rate' => $this->faker->numerify('####'),
            'booking_taxes' => $this->faker->numerify('####'),
            'booking_total' => $this->faker->numerify('####'),
            'gross_amount' => $this->faker->numerify('####'),
            'gsa_comission_rate' => $this->faker->numerify('####'),
            'gsa_taxes_included' => $this->faker->randomElement([0, 1]),
            'gsa_comission_amount' => $this->faker->numerify('####'),
            'abg_net_amount' => $this->faker->numerify('####'),
            'issue_date' => $this->faker->dateTimeBetween('-200 days', '+0 days'),
            'net_rate' => $this->faker->numerify('####'),
            'manual_voucher' => $this->faker->randomElement([0, 1]),
            'number' => $this->faker->bothify('???###'),
        ];
    }
}
