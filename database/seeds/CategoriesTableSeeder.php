<?php

use App\Category;
use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker\Factory::create();
        $categories = [
            "Uncategorized", "Billing/Payments", "Technical question"
        ];

        foreach($categories as $category)
        {
            Category::create([
                'name'  => $category,
                'c_id'  => 0,
                'color' => $faker->hexcolor
                
            ]);
        }
    }
}
