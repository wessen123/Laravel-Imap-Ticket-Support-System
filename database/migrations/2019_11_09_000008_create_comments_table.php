<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentsTable extends Migration
{
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->increments('id');
            $table->string('message_id', 191)->nullable();
            $table->longText('referance',255)->nullable();
            $table->string('reply', 191)->nullable();

            $table->string('author_name')->nullable();

            $table->string('author_email')->nullable();
            $table->longText('subject')->nullable();
            $table->longText('comment_text');
            $table->datetime('received_date')->nullable();
            $table->string('cc')->nullable();
            
            $table->timestamps();

            $table->softDeletes();
        });
    }
}
