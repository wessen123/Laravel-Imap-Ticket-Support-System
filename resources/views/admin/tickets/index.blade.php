@extends('layouts.admin')

@section('content')
@can('ticket_create')
    <div style="margin-bottom: 10px;" class="row">
        <div class="col-lg-12">
            <a  class="btn btn-success button-84" href="{{ route("admin.tickets.create") }}"  style="align-items: center;
            background-color: initial; background-image: linear-gradient(#464d55, #25292e); border-radius: 8px;
            border-width: 0; box-shadow: 0 10px 20px rgba(0, 0, 0, .1),0 3px 6px rgba(0, 0, 0, .05);box-sizing: border-box;
            color: #fff;cursor: pointer;display: inline-flex; flex-direction: column;font-family: expo-brand-demi,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;
            font-size: 18px; height: 40px; justify-content: center;  line-height: 1; margin: 0; outline: none; overflow: hidden;padding: 0 32px; text-align: center;text-decoration: none;transform: translate3d(0, 0, 0);transition: all 150ms; vertical-align: baseline;white-space: nowrap;">
                Add New Ticket
            </a>
        </div>
    </div>
@endcan
<div class="card">
    <div class="card-header" style=" color: rgb(0, 0, 0);  font-size:1em;margin:0;  font-family: Times New Roman, Times, serif;" >
        {{ trans('cruds.ticket.title_singular') }} {{ trans('global.list') }}
    </div>

    <div class="card-body" >
        <table cellspacing="0" cellpadding="0"  width=”600” role=”presentation” style="margin: auto; background: #474646;"  class=" table  table-hover ajaxTable datatable datatable-Ticket">
            <thead>
                <tr style="   background-color: #7c0a0a;  color: rgb(0, 0, 0);  font-size:1em;text-align: center; margin:0;  font-family: Times New Roman, Times, serif; letter-spacing: 5px;">
                    <th  width="10" style="padding: 20px; background-color: #eeeeee;">

                    </th>
                    
                    <th  width="1010" style=" padding: 20px; background-color: #eeeeee;">
                       Ticket's Information
                    </th>
                  
                
                   
                    
                      <th width="10" style="padding: 20px; background-color: #eeeeee;" >
                        {{ trans('cruds.ticket.fields.status') }}
                    </th>
                    <th  width="10" style="padding: 20px; background-color: #eeeeee;">
                        {{ trans('cruds.ticket.fields.priority') }}
                    </th>
                    <th  width="10" style="padding: 20px; background-color: #eeeeee;"> 
                        {{ trans('cruds.ticket.fields.category') }}
                    </th>
                </tr>
            </thead>
        </table>


    </div>
</div>
@endsection
@section('scripts')
@parent
<script>
    $(function () {
let filters = `
<form class="form-inline" id="filtersForm" style="padding: 10px 100px 30px 0;" >
  <div class="form-group mx-sm-3 mb-2">
    <select class="dt-buttons-90 "   name="status" >
      <option value="">All statuses</option>
      @foreach($statuses as $status)
        <option value="{{ $status->id }}"{{ request('status') == $status->id ? 'selected' : '' }}>{{ $status->name }}</option>
      @endforeach
    </select>
  </div>
  <div class="form-group mx-sm-3 mb-2">
    <select class="dt-buttons-90" name="priority"  >
      <option value="">All priorities</option>
      @foreach($priorities as $priority)
        <option value="{{ $priority->id }}"{{ request('priority') == $priority->id ? 'selected' : '' }}>{{ $priority->name }}</option>
      @endforeach
    </select>
  </div>
  <div class="form-group mx-sm-3 mb-2">
    <select class="dt-buttons-90" name="category"  >
      <option value="">All categories</option>
      @foreach($categories as $category)
        <option value="{{ $category->id }}"{{ request('category') == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
      @endforeach
    </select>
  </div>
</form>`;
$('.card-body').on('change', 'select', function() {
  $('#filtersForm').submit();
})
  let dtButtons = []
@can('ticket_delete')
  let deleteButtonTrans = '{{ trans('global.datatables.delete') }}';
  let deleteButton = {
    text: deleteButtonTrans,
    url: "{{ route('admin.tickets.massDestroy') }}",
    className: 'btn-danger',
    action: function (e, dt, node, config) {
      var ids = $.map(dt.rows({ selected: true }).data(), function (entry) {
          return entry.id
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
  let searchParams = new URLSearchParams(window.location.search)
  let dtOverrideGlobals = {
    buttons: dtButtons,
    processing: true,
    serverSide: true,
    retrieve: true,
    aaSorting: [],
    ajax: {
      url: "{{ route('admin.tickets.index') }}",
      data: {
        'status': searchParams.get('status'),
        'priority': searchParams.get('priority'),
        'category': searchParams.get('category')
      }
    },
    columns: [
      { data: 'placeholder', name: 'placeholder' },

{
    data: 'title',
    name: 'title', 
    render: function ( data, type, row) {
        return '    <li class="list-group-item"  style="background:#333333; color: #fff; text-align: justify; font-size:1em;margin:0px;  font-family: cursive,Times New Roman, Times, serif;><div class="row"> <div class="col-xs-2 col-md-1"></div><div class="col-xs-10 col-md-11"> <div> <div class="comment-text"><p  styles="padding-top 5px;"><a styles="padding-top 5px;" href="'+row.view_link+'">'+data+'  </a></p>  </div> By:&nbsp;'+row.author_name+'&nbsp; &nbsp;From:&nbsp; <a href="#">'+row.author_email+'</a>  &nbsp; &nbsp; On: &nbsp; '+row.created_at+'<div class="mic-info">   Assigned User: '+row.assigned_to_user_name+'&nbsp;&nbsp; &nbsp; ['+row.comments_count+ '] Comments </div> </div> <div class="action" style="font-size: 2em; padding-left:70%;"> '+row.actions+' </div></div></div></li>';
      
    }
},

{ 
  data: 'status_name', 
  name: 'status.name', 
  render: function ( data, type, row) {
    return '    <li class="list-group-item"  style="background:#333333; color: #fff;  width:150px; height:150px; font-size:1em;margin:0;  font-family: cursive,Times New Roman, Times, serif;><div class="row"> <div class="col-xs-2 col-md-1"></div><div class="col-xs-10 col-md-11"> <div> <div style="padding-top:50px;" class="comment-text"> </div>   <span style="  text-align: center; color:'+row.status_color+'">'+data+'</span> <div class="mic-info">   </div> </div> <div class="action" style="font-size: 2em; padding-left:70%;">  </div></div></div></li>';
  }
},
{ 
  data: 'priority_name', 
  name: 'priority.name', 
  render: function ( data, type, row) {
      
      return '    <li class="list-group-item"  style="background:#333333; color: #fff;  width:150px; height:150px; font-size:1em;margin:0;  font-family: cursive,Times New Roman, Times, serif;><div class="row"> <div class="col-xs-2 col-md-1"></div><div class="col-xs-10 col-md-11"> <div> <div style="padding-top:50px; text-align: center;" class="comment-text"> </div>   <span style="  color:'+row.priority_color+'">'+data+'</span> <div class="mic-info">   </div> </div> <div class="action" style="font-size: 2em; padding-left:70%;">  </div></div></div></li>';
  }
},
{ 
  data: 'category_name', 
  name: 'category.name', 
  render: function ( data, type, row) {
      
      return '    <li class="list-group-item"  style="background:#333333; color: #fff;  width:180px; height:150px; font-size:1em;margin:0;  font-family: cursive,Times New Roman, Times, serif;><div class="row"> <div class="col-xs-2 col-md-1"></div><div class="col-xs-10 col-md-11"> <div> <div style="padding-top:50px;" class="comment-text"> </div>   <span style="  color:'+row.category_color+'">'+data+'</span> <div class="mic-info">   </div> </div> <div class="action" style="font-size: 2em; padding-left:70%;">  </div></div></div></li>';
  } 
},



    ],
    order: [[ 1, 'desc' ]],
    pageLength: 10,
  };    
$(".datatable-Ticket").one("preInit.dt", function () {
 $(".dataTables_filter").after(filters);
});
  $('.datatable-Ticket').DataTable(dtOverrideGlobals);
    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
        $($.fn.dataTable.tables(true)).DataTable()
            .columns.adjust();
    });
});

</script>

@endsection