A membership system written in PHP laravel an vue js as spa. It will include up to date password salting, secure validation, MySQL injection protection and beatiful design.
it allow u to <br>
 1 -create member <br>
 2- create plan <br>
 3- allow  installments <br>
 4 - use kashier payment and invoice  <br>
 5- sync with database <br>
 
 <h1> The way of work </h1>
 
 as soon as create user or member  you can add him in a plan
 <br>
 The subscription can be paid in full or in three or even two stages
 <br>
If he chooses one stage, the system will be recording the data, adding one installment and sending only one invoice
Once the payment is made, it is subscribed because the payment system is synchronized with our databases

<br>
If he chooses over several stages, the system will be recording the data, adding a number of installments with the same number of stages, and sending only one invoice.
  The system works automatically daily through the (job) to record the outstanding invoices and sends the due invoices to the members.
 
<hr>

<h1> how to run it </h1>

1- u should have php >7.4 | 8.19" <br>
2-rename .env.example to .env <br>
3-php artisan key:generate <br>
4- composer install <br>
5- composer update <br>
u can use sqlfile in project https://github.com/MohammedGhanem1997/Kashier_invoices/blob/master/kashier(1).sql 
6-php artisan migrate <br>
7-php artisan db:seed <br>
8-npm i <br>
9 -npm run dev <br>
<hr>
<h1>
email admin is
admin@admin.com

password 
12345678
</h1>
