@extends('layouts.admin')
@section('content')
@php
                                                                                                                       
$content=$comment->comment_text;

      // $activity = explode( '<div dir="ltr">' , $content );
      //$activity_second = explode("</div>" , $activity );
      //$x= $activity_second[0];
      $y= preg_match_all('#<div.(.+?)</div>#', $content, $matches);
  if($y){
      foreach($matches[0] as $match) {
          
      $x= $match; 
      break;
  } 
  }else {
  $x= $content ;
  
  }
                                @endphp 
<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.comment.title') }}
    </div>

    <div class="card-body">
        <div class="mb-2">
            <table class="table table-bordered table-striped">
                <tbody>
                    <tr>
                        <th>
                            {{ trans('cruds.comment.fields.id') }}
                        </th>
                        <td>
                            {{ $comment->id }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.comment.fields.ticket') }}
                        </th>
                        <td>
                            {{ $comment->ticket->title ?? '' }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.comment.fields.author_name') }}
                        </th>
                        <td>
                            {{ $comment->author_name }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.comment.fields.author_email') }}
                        </th>
                        <td>
                            {{ $comment->author_email }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.comment.fields.user') }}
                        </th>
                        <td>
                            {{ $comment->user->name ?? $comment->author_name  }}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {{ trans('cruds.comment.fields.comment_text') }}
                        </th>
                        <td>
                            {!! $x !!}
                        </td>
                    </tr>
                </tbody>
            </table>
            <a style="margin-top:20px;" class="btn btn-default" href="{{ url()->previous() }}">
                {{ trans('global.back_to_list') }}
            </a>
        </div>


    </div>
</div>
@endsection