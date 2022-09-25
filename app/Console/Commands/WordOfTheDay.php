<?php

namespace App\Console\Commands;

use App\lib\Ghanem_Kashier\Invoice\Base;
use App\lib\Ghanem_Kashier\Invoice\Invoice;
use App\Models\Istallment;
use Illuminate\Console\Command;

class WordOfTheDay extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'word:day';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send a Daily email to all users subscriber  with a payment invoice to pay Duedate invoice';
    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $invoice=new Base();
      $installments= Istallment::whereDate('dueDate', date('Y-m-d'))->get();

      foreach ($installments as $installment){

          if (! isset($installment->invoices))
          $invoice->Create_Share($installment);
      }

        return 0;
    }
}
