<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use App\Models\Istallment;
use App\Models\User;
use Auth;
use Carbon\Carbon;
use Inertia\Inertia;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function index(Request $request)
    {
        return Inertia::render('Users/Index', [
            'users' => User::query()
                ->when($request->input('search'), function ($query, $search) {
                    $query->where('name', 'like', "%{$search}%");
                })
                ->paginate(10)
                ->withQueryString()
                ->through(function($user){
                     return[
                    'id' => $user->id,
                    'name' => $user->name,
                    'order_id' => isset($user->orders[0]) ?$user->orders[0]->id :'' ,
                    'order' =>isset($user->orders[0]) ?$user->orders[0]->totalAmount : 00,
                    'plan' =>$user->planSubscription($user->name) !=null ?  $user->planSubscription($user->name)->ends_at->diffForHumans()  :  $user->planSubscription($user->name),
                    'invoice' =>isset($user->orders[0]->installments[0]->invoices) ? $user->orders[0]->installments[0]->invoices->invoice()->paymentStatus   : '-',
                    'can' => [
                        'edit' => Auth::guard('admin')->user()->can('edit', $user)
                    ]
                    ];}),

            'filters' => $request->only(['search']),
            'can' => [
                'createUser' => Auth::user()->can('create', User::class)
            ]
        ]);
    }

    public function create()
    {
        return Inertia::render('Users/Create');
    }

    public function store(Request $request)
    {
        $attributes = $request->validate([
            'name' => 'required |unique:users,name',
            'email' => ['required', 'email','unique:users,email'],
            'password' => 'required',
        ]);

        User::create($attributes);

        return redirect('/users');
    }



}
