<?php

namespace Database\Factories;

use App\Models\Company;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Validation\Rules\Unique;

class CompanyFactory extends Factory
{   
    protected $model = Company::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->randomElement(['Avis', 'Budget']),
            'display_order' => $this->faker->numerify('####'),
            'active' => $this->faker->randomElement([0, 1]),
        ];
    }
}
