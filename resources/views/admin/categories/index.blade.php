@extends('layouts.admin')
@section('content')
@can('category_create')
    <div style="margin-bottom: 10px;" class="row">
        <div class="col-lg-12">
            <a class="btn btn-success" href="{{ route("admin.categories.create") }}">
                {{ trans('global.add') }} {{ trans('cruds.category.title_singular') }}
            </a>
        </div>
    </div>
@endcan
<div class="card">
    <div class="card-header">
        {{ trans('cruds.category.title_singular') }} {{ trans('global.list') }}
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class=" table table-bordered table-striped table-hover datatable datatable-Category">
                <thead>
                    <tr>
                        <th width="10">

                        </th>
                        <th>
                            {{ trans('cruds.category.fields.id') }}
                        </th>
                        <th>
                            {{ trans('cruds.category.fields.name') }}
                        </th>
                        <th>
                            {{ trans('cruds.category.fields.color') }}
                        </th>
                        <th>
                            {{ trans('Sub Categories') }}
                        </th>
                        <th>
                            &nbsp;
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($categories as $key => $category)
                        <tr data-entry-id="{{ $category->id }}">
                            <td>

                            </td>
                            <td>
                                {{ $category->id ?? '' }}
                            </td>
                            <td>
                                {{ $category->name ?? '' }}
                            </td>
                            <td style="background-color:{{ $category->color ?? '#FFFFFF' }}"></td>
                            <td style="">
                              
                                 
                                    
                                @if($category->childs->count()>0)
                                @foreach($category->childs as $subMenu)
                                <label class="badge badge-primary" style="margin-left: 10px; width: 270px">
                                    &nbsp;
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                                  </svg> {{ $subMenu->name ?? '' }}&nbsp;

                                </label>
                              <label class="badge bg-primary" style="margin-left: 50px;">
                                @can('category_show')
                                <a class="btn btn-xs btn-primary" href="{{ route('admin.categories.show', $subMenu->id) }}">
                                    <i title="view"  class="fa fa-eye" aria-hidden="true"></i>
                                </a>
                            @endcan

                            @can('category_edit')
                                <a class="btn btn-xs btn-info" href="{{ route('admin.categories.edit', $subMenu->id) }}">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                                </a>
                            @endcan

                            @can('category_delete')
                                <form action="{{ route('admin.categories.destroy',$subMenu->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                    <button type="submit"  class="btn btn-xs btn-info" title="Delete " onclick="return confirm(&quot;Confirm delete?&quot;)">
                                        <i  class="fa fa-trash-o " aria-hidden="true"></i> </button>
                                </form>
                            @endcan</label>
                            
                            <br>
                         
                            @foreach($subMenu->childs as $Menu)
                            <label class="badge badge-success" style="margin-left: 50px; width: 200px">
                            &nbsp;
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                              </svg>{{ $subMenu->name ?? '' }}<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                              </svg>{{ $Menu->name ?? '' }}
                            </label>
                            <label class="badge bg-primary" style="margin-left: 80px;">
                              @can('category_show')
                              <a class="btn btn-xs btn-primary" href="{{ route('admin.categories.show', $Menu->id) }}">
                                <i title="view"  class="fa fa-eye" aria-hidden="true"></i>
                              </a>
                          @endcan

                          @can('category_edit')
                              <a class="btn btn-xs btn-info" href="{{ route('admin.categories.edit', $Menu->id) }}">
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                              </a>
                          @endcan

                          @can('category_delete')
                              <form action="{{ route('admin.categories.destroy',$Menu->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                  <input type="hidden" name="_method" value="DELETE">
                                  <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                  <button type="submit"  class="btn btn-xs btn-info" title="Delete " onclick="return confirm(&quot;Confirm delete?&quot;)">
                                    <i  class="fa fa-trash-o " aria-hidden="true"></i> </button>
                              </form>
                          @endcan</label>
                          
                          <br>
                          @foreach($Menu->childs as $Me)
                          <label class="badge badge-warning" style="margin-left: 60px; width: 200px">
                          &nbsp;
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                              <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                            </svg>{{ $subMenu->name ?? '' }}<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                              <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                            </svg>{{ $Me->name ?? '' }}
                          </label>
                          <label class="badge bg-primary" style="margin-left: 70px;">
                            @can('category_show')
                            <a class="btn btn-xs btn-primary" href="{{ route('admin.categories.show', $Me->id) }}">
                              <i title="view"  class="fa fa-eye" aria-hidden="true"></i>
                            </a>
                        @endcan

                        @can('category_edit')
                            <a class="btn btn-xs btn-info" href="{{ route('admin.categories.edit', $Me->id) }}">
                              <i class="fa fa-pencil" aria-hidden="true"></i>
                            </a>
                        @endcan

                        @can('category_delete')
                            <form action="{{ route('admin.categories.destroy',$Me->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                <input type="hidden" name="_method" value="DELETE">
                                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                <button type="submit"  class="btn btn-xs btn-info" title="Delete " onclick="return confirm(&quot;Confirm delete?&quot;)">
                                  <i  class="fa fa-trash-o " aria-hidden="true"></i> </button>
                            </form>
                        @endcan</label>
                        
                        <br>
                        @foreach($Me->childs as $M)
                        <label class="badge badge-danger" style="margin-left: 70px; width: 200px">
                        &nbsp;
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                          </svg>{{ $Me->name ?? '' }}<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                          </svg>{{ $M->name ?? '' }}
                        </label>
                        <label class="badge bg-primary" style="margin-left: 60px;">
                          @can('category_show')
                          <a class="btn btn-xs btn-primary" href="{{ route('admin.categories.show', $M->id) }}">
                            <i title="view"  class="fa fa-eye" aria-hidden="true"></i>
                          </a>
                      @endcan

                      @can('category_edit')
                          <a class="btn btn-xs btn-info" href="{{ route('admin.categories.edit', $M->id) }}">
                            <i class="fa fa-pencil" aria-hidden="true"></i>
                          </a>
                      @endcan

                      @can('category_delete')
                          <form action="{{ route('admin.categories.destroy',$M->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                              <input type="hidden" name="_method" value="DELETE">
                              <input type="hidden" name="_token" value="{{ csrf_token() }}">
                              <button type="submit"  class="btn btn-xs btn-info" title="Delete " onclick="return confirm(&quot;Confirm delete?&quot;)">
                                <i  class="fa fa-trash-o " aria-hidden="true"></i> </button>
                          </form>
                      @endcan</label>
                      
                      <br>
                      @endforeach
                        @endforeach

                          @endforeach
                                @endforeach
                                @else
                                     <p>Not Yet</p>
                                @endif
                            </td>
                            <td>
                                @can('category_show')
                                    <a class="btn btn-xs btn-primary" href="{{ route('admin.categories.show', $category->id) }}">
                                        {{ trans('global.view') }}
                                    </a>
                                @endcan

                                @can('category_edit')
                                    <a class="btn btn-xs btn-info" href="{{ route('admin.categories.edit', $category->id) }}">
                                        {{ trans('global.edit') }}
                                    </a>
                                @endcan

                                @can('category_delete')
                                    <form action="{{ route('admin.categories.destroy', $category->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                                        <input type="hidden" name="_method" value="DELETE">
                                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        <input type="submit" class="btn btn-xs btn-danger" value="{{ trans('global.delete') }}">
                                    </form>
                                @endcan

                            </td>

                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>


    </div>
</div>
@endsection
@section('scripts')
@parent
<script>
    $(function () {
  let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
@can('category_delete')
  let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
  let deleteButton = {
    text: deleteButtonTrans,
    url: "{{ route('admin.categories.massDestroy') }}",
    className: 'btn-danger',
    action: function (e, dt, node, config) {
      var ids = $.map(dt.rows({ selected: true }).nodes(), function (entry) {
          return $(entry).data('entry-id')
      });

      if (ids.length === 0) {
        alert('{{ trans('global.datatables.zero_selected') }}')

        return
      }

      if (confirm('{{ trans('global.areYouSure') }}')) {
        $.ajax({
          headers: {'x-csrf-token': _token},
          method: 'POST',
          url: config.url,
          data: { ids: ids, _method: 'DELETE' }})
          .done(function () { location.reload() })
      }
    }
  }
  dtButtons.push(deleteButton)
@endcan

  $.extend(true, $.fn.dataTable.defaults, {
    order: [[ 1, 'desc' ]],
    pageLength: 100,
  });
  $('.datatable-Category:not(.ajaxTable)').DataTable({ buttons: dtButtons })
    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
        $($.fn.dataTable.tables(true)).DataTable()
            .columns.adjust();
    });
})

</script>
@endsection