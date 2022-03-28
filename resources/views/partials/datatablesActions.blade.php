@can($viewGate)
    <a class="btn btn-xs btn-primary" href="{{ route('admin.' . $crudRoutePart . '.show', $row->id) }}">
        <i title="view"  class="fa fa-eye" aria-hidden="true"></i>
    </a>
@endcan
@can($editGate)
    <a class="btn btn-xs btn-info" href="{{ route('admin.' . $crudRoutePart . '.edit', $row->id) }}">
        <i class="fa fa-pencil" aria-hidden="true"></i>
    </a>
@endcan
@can($deleteGate)
    <form action="{{ route('admin.' . $crudRoutePart . '.destroy', $row->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
        <input type="hidden" name="_method" value="DELETE">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        
        <button type="submit"  class="btn btn-xs btn-info" title="Delete " onclick="return confirm(&quot;Confirm delete?&quot;)">
            <i  class="fa fa-trash-o " aria-hidden="true"></i> </button>
    </form>
@endcan
