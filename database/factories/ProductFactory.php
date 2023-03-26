<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Store;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $name=$this->faker->word(5,true);
        return [
            'name'=>$name,
            'slug'=>Str::slug($name),
            'image'=>$this->faker->imageUrl(600,600),
            'price'=>$this->faker->randomFloat(1,1,499),
            'compare_price'=>$this->faker->randomFloat(1,1,499),
            'category_id'=>Category::inRandomOrder()->first()->id,
            'featured'=>rand(0,1),
            'store_id'=>Store::inRandomOrder()->first()->id,

        ];
    }
}
