<?php

namespace Database\Factories;

use App\Models\Booking;
use App\Models\Company;
use App\Models\Organization;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class BookingFactory extends Factory
{
    protected $model = Booking::class;
    
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name(),
            'last_name' => $this->faker->lastName(),
            'age' => $this->faker->numerify('##'),
            'number' => $this->faker->numerify('####'),
            'company_id' => Company::factory(),
            'user_id' => User::factory(),
            'organization_id' => Organization::factory()
        ];
    }
}
