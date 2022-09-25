<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIstallmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('istallments', function (Blueprint $table) {
            $table->id();
            $table->timestamp('dueDate');
            $table->tinyInteger('quantity');
            $table->float('unitPrice');
            $table->string('description');
            $table->bigInteger('order_id');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('istallments');
    }
}
