<?php

namespace App\Models;

use App\lib\Ghanem_Kashier\Invoice\Base;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;
    public $guarded=[];
    protected $casts = [
        'dueDate' => 'datetime',
    ];
    public function installment(){
        return  $this->belongsTo(Istallment::class,'installment_id');

    }


    public function invoice(){
        $show= new Base();
        $response= $show->Show_Invoice($this);

       $this->paymentStatus = $response['data'][0]['paymentStatus'];
        $this->save();
        $plan = app('rinvex.subscriptions.plan')->find($this->installment->order['package-id']);

        if (!$this->installment->order->user->subscribedTo($plan->id)){

//    $plan->features()->saveMany([
//        new \Rinvex\Subscriptions\Models\PlanFeature(['name' => 'period', 'value' => 90, 'sort_order' => 10, 'resettable_period' => 1, 'resettable_interval' => 'month']),
//    ]);
            $this->installment->order->user->newPlanSubscription($this->installment->order->user['name'],$plan);

            $this->installment->order->user->planSubscription($this->installment->order->user['name'])->recordFeatureUsage('period', $this->installment->order['installments_quantity']);


//            $this->installment->order->user->planSubscription($this->installment->order->user['id'])->active();
        }

       return $this;
    }

    }
