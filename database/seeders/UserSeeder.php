<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Hash,DB;
class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::Create([
      'name'=>'Ahmad Ali',
      'email'=>'ahmady00376ali@gmail.com',
      'password'=>Hash::make('password'),
      'phone_number'=>'962788811695',
        ]);
        DB::table('users')->insert([
            'name'=>'System Admin ',
            'email'=>'sys@gmail.com',
            'password'=>Hash::make('password'),
            'phone_number'=>'787444411',
        ]);
    }
}
