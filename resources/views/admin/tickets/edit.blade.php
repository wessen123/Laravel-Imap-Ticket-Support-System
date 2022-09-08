@extends('layouts.admin')
@section('content')
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Laravel 8 Tags System Example - Nicesnippets.com</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css" rel="stylesheet" />
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laravel</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <meta name="csrf-token" content="{{ csrf_token() }}" />
    </head>
<style>
    .bootstrap-tagsinput .tag{
        margin-right: 2px;
        color: #ffffff;
        background: #2196f3;
        padding: 3px 7px;
        border-radius: 3px;
    }
    .bootstrap-tagsinput {
        width: 100%;
    }
</style>
<div class="card">
    <div class="card-header" style="color: rgb(97, 6, 6);  font-size:2em;margin:0; font-family: Times New Roman, Times, serif;">
        {{ trans('global.edit') }} {{ trans('cruds.ticket.title_singular') }}
    </div>



<div class="container-xl px-4 mt-4">
 
    <hr class="mt-0 mb-4">
    <div class="row">
    
        <div class="col-xl-12">
            <!-- Account details card-->
            <div class="card mb-4">
               
                <div class="card-body">
                    <form action="{{ route("admin.tickets.update", [$ticket->id]) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                      
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (first name)-->
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('title') ? 'has-error' : '' }}">
                                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;"  for="title">{{ trans('cruds.ticket.fields.title') }}</label>
                                    <input type="text" id="title" name="title" class="form-control" value="{{ old('title', isset($ticket) ? $ticket->title : '') }}" required>
                                    @if($errors->has('title'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('title') }}
                                        </em>
                                    @endif
                                    <p class="helper-block">
                                        {{ trans('cruds.ticket.fields.title_helper') }}
                                    </p>
                                </div>
                            </div>
                            
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('author_email') ? 'has-error' : '' }}">
                                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;"  for="author_email">{{ trans('cruds.ticket.fields.author_email') }}</label>
                                    <input type="text" id="author_email" name="author_email" class="form-control" value="{{ old('author_email', isset($ticket) ? $ticket->author_email : '') }}">
                                    @if($errors->has('author_email'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('author_email') }}
                                        </em>
                                    @endif
                                    <p class="helper-block">
                                        {{ trans('cruds.ticket.fields.author_email_helper') }}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('author_name') ? 'has-error' : '' }}">
                                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;"  for="author_name">{{ trans('cruds.ticket.fields.author_name') }}</label>
                                    <input type="text" id="author_name" name="author_name" class="form-control" value="{{ old('author_name', isset($ticket) ? $ticket->author_name : '') }}">
                                    @if($errors->has('author_name'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('author_name') }}
                                        </em>
                                    @endif
                                    <p class="helper-block">
                                        {{ trans('cruds.ticket.fields.author_name_helper') }}
                                    </p>
                                </div>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('status_id') ? 'has-error' : '' }}">
                                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family:Times New Roman, Times, serif;"  for="status">{{ trans('cruds.ticket.fields.status') }}</label>
                                    <select name="status_id" id="status" class="form-control select2" required>
                                        @foreach($statuses as $id => $status)
                                            <option value="{{ $id }}" {{ (isset($ticket) && $ticket->status ? $ticket->status->id : old('status_id')) == $id ? 'selected' : '' }}>{{ $status }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('status_id'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('status_id') }}
                                        </em>
                                    @endif
                                </div>
                            </div>
                        </div>
                     
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('priority_id') ? 'has-error' : '' }}">
                                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;"  for="priority">{{ trans('cruds.ticket.fields.priority') }}</label>
                                    <select name="priority_id" id="priority" class="form-control select2" required>
                                        @foreach($priorities as $id => $priority)
                                            <option value="{{ $id }}" {{ (isset($ticket) && $ticket->priority ? $ticket->priority->id : old('priority_id')) == $id ? 'selected' : '' }}>{{ $priority }}</option>
                                        @endforeach
                                    </select>
                                    @if($errors->has('priority_id'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('priority_id') }}
                                        </em>
                                    @endif
                                </div>
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('category_id') ? 'has-error' : '' }}">
                                   <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;"  for="category">{{ trans('cruds.ticket.fields.category') }}</label>
                                    <select name="category_id" id="category" class="form-control select2" required>
                                        @foreach($categories as $id => $category)
                                            <option style="color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;"  value="{{ $category->id }}"{{ (isset($ticket) && $ticket->category ? $ticket->category->id : old('category_id')) == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                                            @if($category->childs->count()>0)
                                            @foreach($category->childs as $cat)
                                     <option style="color: rgb(2, 104, 9);font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;" value="{{ $cat->id }}" {{ (isset($ticket) && $ticket->category ? $ticket->category->id : old('category_id')) ==$cat->id ? 'selected' : '' }}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ $cat->name }}</option>
                                     @foreach($cat->childs as $ca)
                                          <option style="color: rgb(247, 212, 14);font-size:1.3em;margin-left:20px; font-family: Times New Roman, Times, serif;" value="{{ $ca->id }}" {{ (isset($ticket) && $ticket->category ? $ticket->category->id : old('category_id')) == $ca->id  ? 'selected' : '' }}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ $ca->name }}</option>
                                          @foreach($ca->childs as  $c)
                                          <option  style="color: rgb(190, 19, 22);font-size:1.3em;margin-left:10px; font-family: Times New Roman, Times, serif;"  value="{{ $c->id }}" {{ (isset($ticket) && $ticket->category ? $ticket->category->id : old('category_id')) == $c->id  ? 'selected' : '' }}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ $c->name }}</option>
                                          @foreach($c->childs as $id => $caa)
                                          <option  style="color: rgb(6, 102, 105);font-size:1.3em;margin:0; font-family: Times New Roman, Times, serif;"   value="{{ $caa->id }}" {{ (isset($ticket) && $ticket->category ? $ticket->category->id : old('category_id')) == $caa->id  ? 'selected' : '' }}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ $caa->name }}</option>
                                        
                                          @endforeach
                                          @endforeach
                                          
                                          @endforeach
                                           @endforeach
                                           
                                @else
                                <option style=" color: #eb0d0d;" value="" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>no sub cat for {{ $category->name }} </b></option>
                                @endif
                                            @endforeach
                                    </select>
                                    @if($errors->has('category_id'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('category_id') }}
                                        </em>
                                    @endif

                            
                                </div>
                            </div>
                        </div>

                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6" >
                                <div class="form-group {{ $errors->has('attachments') ? 'has-error' : '' }}">
                                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;" for="attachments">{{ trans('cruds.ticket.fields.attachments') }}</label>
                                    <div class="needsclick dropzone" id="attachments-dropzone">
                    
                                    </div>
                                    @if($errors->has('attachments'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('attachments') }}
                                        </em>
                                    @endif
                                    <p class="helper-block">
                                        {{ trans('cruds.ticket.fields.attachments_helper') }}
                                    </p>
                                </div>
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('content') ? 'has-error' : '' }}">
                                    <label  style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;" for="content">{{ trans('cruds.ticket.fields.content') }}</label>
                                    <textarea id="content" name="content" class="form-control ">{{ old('content', isset($ticket) ? $ticket->content : '') }}</textarea>
                                    @if($errors->has('content'))
                                        <em class="invalid-feedback">
                                            {{ $errors->first('content') }}
                                        </em>
                                    @endif
                                    <p class="helper-block">
                                        {{ trans('cruds.ticket.fields.content_helper') }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                                @if(auth()->user()->isAdmin())
                <div class="form-group {{ $errors->has('assigned_to_user_id') ? 'has-error' : '' }}">
                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;" for="assigned_to_user">{{ trans('cruds.ticket.fields.assigned_to_user') }}</label>
                    <select name="assigned_to_user_id" id="assigned_to_user" class="form-control select2">
                        @foreach($assigned_to_users as $id => $assigned_to_user)
                            <option value="{{ $id }}" {{ (isset($ticket) && $ticket->assigned_to_user ? $ticket->assigned_to_user->id : old('assigned_to_user_id')) == $id ? 'selected' : '' }}>{{ $assigned_to_user }}</option>
                        @endforeach
                    </select>
                    @if($errors->has('assigned_to_user_id'))
                        <em class="invalid-feedback">
                            {{ $errors->first('assigned_to_user_id') }}
                        </em>
                    @endif
                    
                </div>
            @endif
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                                <div class="form-group {{ $errors->has('title') ? 'has-error' : '' }}">
                                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;"  for="title">{{ trans('Tags') }}</label>
                                   
                                    @if($ticket->count())
                                   
                                    @foreach($ticket->tags as $key => $tag)
                                    <label class="badge bg-primary">{{ @$tag->name }}</label>
                                   
                                    @endforeach
                         
                            @endif
                                    <input class="form-control" type="text" data-role="tagsinput" name="tags">
                                    @if ($errors->has('tags'))
                                        <span class="text-danger">{{ $errors->first('tags') }}</span>
                                    @endif
                                </div>
                                
                            </div>
                            <div class="col-md-6">
                                <div>
                                    <input style="background: #8d3e3e;  color: #fff; width:180px; height: 50px; font-size:2em;margin:0; font-family: cursive,Times New Roman, Times, serif;" class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
                                </div>
                            </div>
                        </div>
                        <!-- Save changes button-->
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>





    
@endsection

@section('scripts')

<script>
    
    var uploadedAttachmentsMap = {}
Dropzone.options.attachmentsDropzone = {
    url: '{{ route('admin.tickets.storeMedia') }}',
    maxFilesize: 2, // MB
    addRemoveLinks: true,
    headers: {
      'X-CSRF-TOKEN': "{{ csrf_token() }}"
    },
    params: {
      size: 2
    },
    success: function (file, response) {
      $('form').append('<input type="hidden" name="attachments[]" value="' + response.name + '">')
      uploadedAttachmentsMap[file.name] = response.name
    },
    removedfile: function (file) {
      file.previewElement.remove()
      var name = ''
      if (typeof file.file_name !== 'undefined') {
        name = file.file_name
      } else {
        name = uploadedAttachmentsMap[file.name]
      }
      $('form').find('input[name="attachments[]"][value="' + name + '"]').remove()
    },
    init: function () {
@if(isset($ticket) && $ticket->attachments)
          var files =
            {!! json_encode($ticket->attachments) !!}
              for (var i in files) {
              var file = files[i]
              this.options.addedfile.call(this, file)
              file.previewElement.classList.add('dz-complete')
              $('form').append('<input type="hidden" name="attachments[]" value="' + file.file_name + '">')
            }
@endif
    },
     error: function (file, response) {
         if ($.type(response) === 'string') {
             var message = response //dropzone sends it's own error messages in string
         } else {
             var message = response.errors.file
         }
         file.previewElement.classList.add('dz-error')
         _ref = file.previewElement.querySelectorAll('[data-dz-errormessage]')
         _results = []
         for (_i = 0, _len = _ref.length; _i < _len; _i++) {
             node = _ref[_i]
             _results.push(node.textContent = message)
         }

         return _results
     }
}
</script>

@section('scripts')

 <script>
 
      $('#content').summernote({
        placeholder: '',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.js"></script>
@endsection
@stop