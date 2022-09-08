<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->increments('id');
            
            $table->integer('uid')->nullable();
            $table->string('message_id', 191)->nullable();
            $table->string('referance', 191)->nullable();
            $table->string('reply', 191)->nullable();

            $table->string('title')->nullable();

            $table->longText('content')->nullable();

            $table->string('author_name')->nullable();

            $table->string('author_email')->nullable();
            $table->datetime('received_date')->nullable();
          
            $table->timestamps();

            $table->softDeletes();
        });
    }
}
