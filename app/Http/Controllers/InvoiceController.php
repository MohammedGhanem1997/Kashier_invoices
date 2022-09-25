<?php

namespace App\Http\Controllers;


use App\lib\Ghanem_Kashier\Invoice\Base;
use App\lib\Ghanem_Kashier\Invoice\Invoice;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Inertia\Inertia;
use mysql_xdevapi\Exception;

class InvoiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $response = new Invoice;
     $invoices=  $response->ListInvoices();

        return Inertia::render('Home',['invoices'=>$invoices]);

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
    public function store($installment, $response )
    {


        $invoice=\App\Models\Invoice::create([

       'customerName'=> isset($response[ 'customerName'])?$response[ 'customerName']:'-',
         'transaction_id'=>  isset($response[ '_id'])?$response[ '_id']:'-',
        'totalAmount'=>$response['totalAmount'],
       'dueDate'=>$response['dueDate'],
       'paymentRequestId'=>$response['paymentRequestId'],
        'paymentStatus'=>$response['paymentStatus'],
       'email'=>$installment->order->email,
       'user_id'=>$installment->order->user_id,
        'installment_id'=>$installment->id,
             ]);





        return $invoice ;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $invoice=\App\Models\Invoice::findOrFail($id);


       $show= new Base();
      $response= $show->Show_Invoice($invoice);

        $invoice->paymentStatus = $response['data'][0]['paymentStatus']; ;

        $invoice->save();
        return $response;
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
