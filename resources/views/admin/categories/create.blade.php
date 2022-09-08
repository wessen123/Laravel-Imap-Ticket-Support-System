@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.create') }} {{ trans('cruds.category.title_singular') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.categories.store") }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                <label for="name">{{ trans('cruds.category.fields.name') }}*</label>
                <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($category) ? $category->name : '') }}" required>
                @if($errors->has('name'))
                    <em class="invalid-feedback">
                        {{ $errors->first('name') }}
                    </em>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.category.fields.name_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('color') ? 'has-error' : '' }}">
                <label for="color">{{ trans('cruds.category.fields.color') }}</label>
                <input type="text" id="color" name="color" class="form-control colorpicker" value="{{ old('color', isset($category) ? $category->color : '') }}">
                @if($errors->has('color'))
                    <em class="invalid-feedback">
                        {{ $errors->first('color') }}
                    </em>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.category.fields.color_helper') }}
                </p>
            </div>
           
            <div class="form-group {{ $errors->has('status_id') ? 'has-error' : '' }}">
                    <label style=" color: #8d3e3e;   font-size:1.5em;margin:0; font-family:Times New Roman, Times, serif;"  for="status">{{ trans('Main Catagory') }}</label>
                    <select name="c_id" id="status" class="form-control select1" required>
                        <option style="color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;" value="">Select Category </option>
                        <option style="color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;" value="0">Root Category </option>
                        @foreach($cats as $id => $cat)
                            <option style="color: #8d3e3e;   font-size:1.5em;margin:0; font-family: Times New Roman, Times, serif;" value="{{ $cat->id }}">{{ $cat->name }}</option>
                            @if($cat->childs->count()>0)
                            @foreach($cat->childs as $id => $ca)
                            <option  style="color: rgb(16, 150, 40);font-size:1.3em;margin:0; font-family: Times New Roman, Times, serif;"  value="{{ $ca->id }}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-{{ $ca->name }}</option>
                            @foreach($ca->childs as $id => $c)
                            <option  style="color: rgb(230, 238, 15);font-size:1.3em;margin-left:10px; font-family: Times New Roman, Times, serif;"  value="{{ $c->id }}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ $c->name }}</option>
                            @foreach($c->childs as $id => $caa)
                            <option  style="color: rgb(250, 52, 52);font-size:1.3em;margin:0; font-family: Times New Roman, Times, serif;"  value="{{ $caa->id }}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ $caa->name }}</option>
                          
                            @endforeach
                            @endforeach
                            @endforeach
                        @else
                        <option style=" color: #eb0d0d;" value="" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>no sub cat for {{ $cat->name }}</b> </option>
                        @endif
                            @endforeach
                    </select>
                    @if($errors->has('status_id'))
                        <em class="invalid-feedback">
                            {{ $errors->first('status_id') }}
                        </em>
                    @endif
                </div>
           
            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>


    </div>
</div>
@endsection

@section('styles')
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-colorpicker/2.5.3/css/bootstrap-colorpicker.min.css" rel="stylesheet">
@endsection

@section('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-colorpicker/2.5.3/js/bootstrap-colorpicker.min.js"></script>
<script>
    $('.colorpicker').colorpicker();
</script>
@endsection