<?php

namespace Database\Seeders;

use App\Models\Admin;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user           = new Admin();
        $user->name     = "admih";
        $user->email    = "admin@gmail.com";
        $user->password = Hash::make('12345678');
        $user->save();


        $user           = new Admin();
        $user->name     = "admih";
        $user->email    = "ghanem@gmail.com";
        $user->password = Hash::make('12345678');
        $user->save();




    }
}
