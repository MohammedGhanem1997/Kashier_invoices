<?php


namespace App\lib\Ghanem_Kashier\Invoice;


use App\lib\Ghanem_Kashier\Invoice\Sitting;
use App\lib\Ghanem_Kashier\InvoiceInterface;
use Illuminate\Support\Facades\Http;

class Invoice implements InvoiceInterface
{

    public $setting;
    public $headers = [
                        'Accept' => 'application/json',
                        'Authorization' =>
                        "33ae559e34af351df6ed66b3b714d29d" . "$" . "b6a06d0b28b9c1f1e1c8e5ef774996866f7e55a3782e069a744fb3056ea5ffececb7e402a3c65a98377faa47c6414fb8"
                        ];
    public function __construct()
    {
         $setting =new Sitting();
        $this->setting = $setting;


        $this->setting->setUri(config('app.kashier_uri'));
        $this->setting->setMerchantId(config('app.merchantId'));
        $this->setting->setPaymentType(config('app.paymentType'));
    }

    public function CreateInvoice($installment)
    {
   $paylaod = [
            "paymentType" => $this->setting->getPaymentType(),
            "merchantId" => $this->setting->getMerchantId(),
            "totalAmount" =>$installment->unitPrice ,
            "customerName" =>'ghanem',
            "description" => $installment->description,
            "invoiceReferenceId" =>(string) $installment->id.$installment->order_id,
            "dueDate" =>$installment->dueDate,
            "invoiceItems" => [
                [
                    "description" => $installment->description,
                    "quantity" => (int)$installment->quantity,
                    "itemName" => "installment",
                    "unitPrice" =>  $installment->unitPrice/ $installment->quantity,
                    "subTotal" =>$installment->unitPrice,
                ],
            ],
            "state" => "submitted",
            "currency" => "EGP",
            "tax" => 0
        ];



        $response = Http::withHeaders($this->headers)->post($this->setting->getUri().'?currency=EGP', $paylaod);

        $statusCode = $response->status();

        $responseBody = json_decode($response->getBody(), true);


        return $responseBody;


    }


    public function ShareInvoice($invoice)
    {


    $invoice=[
        "invoices" => [
        [
            "_id" =>$invoice->transaction_id,
            "urlIdentifier" => $invoice->paymentRequestId,
            "customerName" => $invoice->customerName,
            "storeName" =>config('app.name'),
               "merchantId" =>  $this->setting->getMerchantId(),
            "customerEmail" => $invoice->email,
            "language" => "en",
            "subDomainUrl" => "http://merchant.kashier.io/en/prepay"
        ]

    ],
    "subDomainUrl" => "http://merchant.kashier.io/en/prepay",
    "language" => "en",
    "merchantId" => $this->setting->getMerchantId(),

    "operation" => "bulkShare"


]    ;

        $response = Http::withHeaders($this->headers)->post($this->setting->getUri().'/sendInvoiceBy?currency=EGP',$invoice);
        $responseBody = json_decode($response->getBody(), true);


        return $responseBody;

    }

    public function ListInvoices($filter=null)
    {

         $headers = [
        'Accept' => 'application/json',
        'Authorization' =>
            "5b50e9ef95e8695f2dda0a16db717ce0$4188f97b6c5d5acf5bbc90443d9bef3c0b254dbc5309b8f9f15f003858ba6b206734466431a0aaace1a58d239b270cee"
    ];
        $response = Http::withHeaders($this->headers)->get('https://test-api.kashier.io/paymentRequests/MID-1902-526?currency=EGP');
        $responseBody = json_decode($response->getBody(), true);
        return $responseBody;
    }

    public function UpdateInvoice($invoiceId, $data)
    {
        // TODO: Implement UpdateInvoice() method.
    }

    public function DeleteInvoice($invoiceId)
    {
        // TODO: Implement DeleteInvoice() method.
    }

    public function ViewInvoice($invoiceId){

        $response = Http::withHeaders($this->headers)->get($this->setting->getUri().'/'.$invoiceId.'?currency=EGP');

        $responseBody = json_decode($response->getBody(), true);


        return $responseBody ;



}

}
