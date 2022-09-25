<?php

namespace Database\Seeders;

use App\Models\Admin;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Rinvex\Subscriptions\Models\PlanFeature;

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

        $plan = app('rinvex.subscriptions.plan')->create([
            'name' => 'Pro',
            'description' => 'Pro plan',
            'price' => 90,
            'signup_fee' => 1.99,
            'invoice_period' => 1,
            'invoice_interval' => 'month',
            'trial_period' => 15,
            'trial_interval' => 'day',
            'sort_order' => 1,
            'currency' => 'USD',
        ]);

// Create multiple plan features at once
        $plan->features()->saveMany([
            new PlanFeature(['name' => 'period', 'value' => 90, 'sort_order' => 10, 'resettable_period' =>3, 'resettable_interval' => 'month']),
        ]);


    }
}
