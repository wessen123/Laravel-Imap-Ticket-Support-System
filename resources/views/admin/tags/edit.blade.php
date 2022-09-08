@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.edit') }} {{ trans('Tag') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.tags.update", [$tag->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-group {{ $errors->has('tag_name') ? 'has-error' : '' }}">
                <label for="tagname">{{ trans('Tag Name') }}*</label>
                <input type="text" id="name" name="tag_name" class="form-control" value="{{ old('tag_name', isset($tag) ? $tag->tag_name : '') }}" required>
                @if($errors->has('tag_name'))
                    <em class="invalid-feedback">
                        {{ $errors->first('tag_name') }}
                    </em>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.category.fields.name_helper') }}
                </p>
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