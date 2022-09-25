<?php


namespace App\lib\Ghanem_Kashier\Invoice;


use App\Http\Controllers\InvoiceController;

class Base extends Invoice
{
public function __construct()
{
    parent::__construct();
}


    public function Create_Share($installment){

      $invoic=new InvoiceController;
       $response=$this->CreateInvoice($installment);

        $response=  $invoic->store($installment,$response["response"]);

           $share= $this->ShareInvoice($response);

       return $share;
    }

    public function Show_Invoice($invoice){

    $invoice = $this->ViewInvoice($invoice->paymentRequestId);
    if (count($invoice['response']['data'])){
        return ($invoice['response']) ;
    }
    return ["response"=>"error"];

    }

}
