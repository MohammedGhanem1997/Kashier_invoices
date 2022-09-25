<?php


namespace App\lib\Ghanem_Kashier;


interface InvoiceInterface
{


    public function CreateInvoice($order);
    public function ViewInvoice($invoiceId);
    public function ListInvoices($filter);
    public function UpdateInvoice($invoiceId,$data);
    public function DeleteInvoice($invoiceId);
    public function ShareInvoice($invoiceId);

    }
