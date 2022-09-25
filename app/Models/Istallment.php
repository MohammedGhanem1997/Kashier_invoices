<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Istallment extends Model
{
    use HasFactory;
    public $guarded=[];

    public function order(){
        return  $this->belongsTo(Order::class,'order_id');

    }
    public function invoices(){
        return  $this->hasOne(Invoice::class,'installment_id');

    }
}
