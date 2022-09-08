<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'tagging_tagged';
    protected $fillable = ['tag_name','tag_slug'];
    public function ticket()
    {
        return $this->belongsTo('App\ticket', 'id');
    }
  
}
