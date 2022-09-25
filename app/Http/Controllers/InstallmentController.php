<?php

namespace App\Http\Controllers;

use App\lib\Ghanem_Kashier\Invoice\Base;
use App\lib\Ghanem_Kashier\Invoice\Invoice;
use App\Models\Istallment;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;

class InstallmentController extends Controller
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
    public function store($order)
    {
        $invoice=new Base();

        if ($order->installments_quantity !=2){
            $i=0;
            for($i ;$i < $order->installments_quantity ;$i++){
             $installment= $installment= Istallment::create([

                    'order_id'=>$order->id,
                    'description'=>'installment'. $i+1 .'from'. $order->installments_quantity,
                    'dueDate'=>Carbon::now()->addMonth($i),
                    'quantity'=>$order->installments_quantity==1?$order->installments_quantity:$i+1,
                    'unitPrice'=> $order->totalAmount /$order->installments_quantity

                ]);

                if ($i ==0){


                    $response= $invoice->Create_Share($installment);

                }

            }

        }elseif ($order->installments_quantity =2){

           $installment= Istallment::create([
                'order_id'=>$order->id,
                'dueDate'=>Carbon::now(),
                'description'=>'installment 1 from '.$order->installments_quantity,
                'quantity'=>2,
                'unitPrice'=> ($order->totalAmount /3)*$order->installments_quantity,

            ]);
            Istallment::create([
                'order_id'=>$order->id,
                'dueDate'=>Carbon::now()->addMonth(1),
                'quantity'=>1,
                'description'=>'installment 2 from '.$order->installments_quantity,
                'unitPrice'=> ($order->totalAmount /3),
            ] );
            $response= $invoice->Create_Share($installment);
        }

 return redirect()->back()->with(['message'=>$response]);


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
