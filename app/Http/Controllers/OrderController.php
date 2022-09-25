<?php

namespace App\Http\Controllers;

use App\Models\Istallment;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Inertia\Inertia;
use mysql_xdevapi\Exception;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


        try {
            $order= Order::create([
                'name'=> $request->subscriber['name'],
                'email'=> $request->subscriber['email'],
                'user_id'=>$request->subscriber['id'],
                'package-id'=> $request->get('package_id'),
                'totalAmount'=> 90,
                'status'=> 0,
                'installments_quantity'=> $request->get('package'),
                'dueDate'=> Carbon::now()->addMonth($request->get('package')),

            ]);
            $installment=new InstallmentController ;
          return  $installment->store($order);
        }catch (Exception $e){

        }




    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {


        $order=Order::with('installments')->find($id);

        foreach ($order->installments as $installment ){

            $installment ['invoice']=$installment->invoices;
        }




        return Inertia::render('client/Order',['order'=>$order]);


    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
