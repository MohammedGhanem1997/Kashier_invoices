<?php

namespace App\Http\Controllers\Client;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function subscribe($user_id = null)
    {

        $user=User::find($user_id);

        $plan = app('rinvex.subscriptions.plan')->all();


        return Inertia::render('client/index', ['plans' => $plan, 'subscriber' => $user]);
    }

}






