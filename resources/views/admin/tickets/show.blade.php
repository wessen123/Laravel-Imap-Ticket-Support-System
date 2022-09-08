@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.show') }} {{ trans('cruds.ticket.title') }}
    </div>

    <div class="card-body">
        @if(session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif



<div class="condtainer">
    <div class="row">

        <div class="col-md-4" style="padding-left: 30px;">

            <div class="card " >
                <div class="card-header px-3"> Ticket info</div>
                <ul class="list-group list-group-light list-group-small">
                    <li class="list-group-item px-3"> <span  style="width: 10%;">{{ trans('cruds.ticket.fields.author_name')  }}:</span>
                        <span class="badge bg-success"> <span  style="width: 10%;">{{ $ticket->author_name ?? '' }}</span></li>
                 
                
                 <li class="list-group-item px-3">  <span  style="width: 10rem;">{{ trans('cruds.ticket.fields.author_email') }}:</span>
                    <span class="badge bg-success">{{ $ticket->author_email ?? '' }}</span></li>

                  <li class="list-group-item px-3"> <span  style="width: 10%;">{{ trans('cruds.ticket.fields.category') }}:</span>
                    <span class="badge bg-success"> <span  style="width: 10%;">{{ $ticket->category->name ?? '' }}</span></li>
                   
                

                    <li class="list-group-item px-3"> <span  style="width: 10%;">{{trans('cruds.ticket.fields.status') }}:</span>
                        <span class="badge bg-success"> <span  style="width: 10%;">{{ $ticket->status->name ?? '' }}</span></li>
                    <li class="list-group-item px-3"> <span  style="width: 10%;">{{ trans('cruds.ticket.fields.priority') }}:</span>
                    <span class="badge bg-success"> <span  style="width: 10%;">{{ $ticket->priority->name ?? '' }}</span></li>

                    <li class="list-group-item px-3"> <span  style="width: 10%;">{{ trans('cruds.ticket.fields.assigned_to_user') }}:</span>
                        <span class="badge bg-success"> <span class style="width: 10%;">{{  $ticket->assigned_to_user->name?? 'Not Yet' }}</span></li>


                </ul>
             
       
              </div> 
              <div class="card" >
                <div class="card-header px-3">  Tickets by: {{ $ticket->author_name ?? '' }}</div>
                <ul class="list-group list-group-light list-group-small">
                    @php 
                    $value = \App\Ticket::where(['author_email' => $ticket->author_email])->where('uid', '!=',  $ticket->uid)->get();
                    $count=$value->count();
                    $tic= \App\Comment::where(['ticket_id' => $ticket->id])->get();
                    $total=$tic->count();
                      @endphp
                              @if($count>=1)
                      
                                     @foreach ($value as $link)
                    <li class="list-group-item px-3"> {{ '#'.$link->uid}} <a href="{{ $link->id}}" target="_blank" title="Visit Link: {{ $link->id }}">{{ $link->title}}</a></li>
                 
                    @endforeach
           
                    @else
                         
                    <li class="list-group-item px-3">  No other ticket</li>
                         
                           
                        
                     @endif
                </ul>
              </div> 
      
    
           
  
  
      
         
                   
                                                
  
                          
                              
                                  
                                 
  
                             
        </div>
        <div class="col-md-8">

         
               <div>
                <h6 class="fw-bold mb-1 tick_title">{{ '#'.$ticket->uid}}: {{ $ticket->title }} 
               
                    <a href="{{ route('admin.tickets.edit', $ticket->id) }}" ><i class="fas fa-pencil-alt ms-2"></i></a>
                        
                   
                </h6>
                <p class="mb-0  tick_title">
                   Tags:
                   @if($ticket->count())
                  
                   @foreach($ticket->tags as $key => $tag)
                   <label class="badge bg-primary">{{ $tag->name }}</label>
                   
                   
                   @endforeach
                  
        
           @endif
                   
                  </p>
               
            <div class="d-flex">
                <div class="img_cont_msg">
                    <img src="data:image/png;base64,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" class="rounded-circle user_img_msg" alt="w">
                </div>

                <div class="body_cotainer">
                
                           

                  {!! $ticket->content !!}
                            
                  <?php     
                  if($ticket->attachments ){
                  
                  foreach($ticket->attachments as $attachment){
             echo  ' <a style="color: rgb(32, 6, 117);" href=" '.$attachment->getUrl().'" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
  <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
</svg>'.$attachment->file_name .'</a>';
                   }
                }
                ?>
                 </div>
           </div>

           @php 
           $not=count($ticket->notes);
          
           if( $not>=1){
               $not= $not;
             echo ' <a class="mb-0  tick_title">Notes   <span class="badge badge-danger navbar-badge">'.$not.' </span></a>';
           }else
           {
             echo '';
           }
           
           @endphp  
          
           @foreach ($ticket->notes->sortBy('id') as $note)
        
           <div class="be-comment-content ">
            <span class="be-comment-name">
                <a href="blog-detail-2.html">{!!  $note->user->name !!}</a>
                </span>
            <span class="be-comment-time">
                <a class="btn btn-xs btn-light"href="{{ route('admin.notes.edit', $note->id) }}" ><i class=" fas fa-pencil-alt ms-2"></i></a>
              
                <form action="{{ route('admin.notes.destroy',$note->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');" style="display: inline-block;">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <button type="submit"  class="btn btn-xs btn-light" title="Delete " >
                        <i  class="fa fa-trash-o " aria-hidden="true"></i> </button>
                </form>
                <i class="fa fa-clock-o"></i>
                {!!$note->created_at->diffForHumans() !!}
            </span>
            

        <h6 class="be-comment-text">
            {!!$note->note_text !!}
        </h6>
       
    </div>
    @endforeach
  
    
                  <div> 
                    @php 
                    $num=count($ticket->comments);
                   
                    if( $num>=1){
                        $n= $num;
                      echo ' <a class="mb-1  tick_title">Messages   <span class="badge badge-danger navbar-badge">'.$n.' </span></a>';
                    }else
                    {
                      echo '';
                    }
                    
                    @endphp
                    
                </div>
                                <ul class="chat" id="chagt">
                             
                                    @forelse ($ticket->comments as $comment)

                                    
                                    
        
                                            <li class="you">
                                                
                                                
                                          
                                                  @php
                                                                                                                   
                                          $content=$comment->comment_text;
            
                            // $activity = explode( '<div dir="ltr">' , $content );
                            //$activity_second = explode("</div>" , $activity );
                            //$x= $activity_second[0];
                    
                                                    @endphp 

                                 @if($comment->user_id!== null)
                          

                <div class="d-flex justify-content-start mb-4">
                        <div class="img_cont_msg">
                            <img src="data:image/png;base64,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" class="rounded-circle user_img_msg" alt="w">
                        </div>

                            <div class="msg_cotainer">
                        
                                    {!!

                                $content
                                    
                                    !!}
                          <b class="msg_time"> <a href="mailto:{{ $comment->author_email }}">{{ $comment->author_name       }} :</a>
                            {{  date('d F Y H:i:s', strtotime($comment->created_at))
                        }}</b>
                    </div>
      </div>
   
 

@else

            <div class="d-flex justify-content-end mb-4">
             <div class="msg_cotainer_send">
            
                {!!

            $content
                
                !!}
                <b style="color: rgb(231, 222, 222)" class="msg_time_send"> <a href="mailto:{{ $comment->author_email }}">{{ $comment->author_name       }} :</a>
                    {{  date('d F Y H:i:s', strtotime($comment->created_at)) }}</b>
            </div>
            <div class="img_cont_msg">
            <img src="data:image/jpeg;base64,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" class="rounded-circle user_img_msg">
            </div>

            </div>


          @endif
                                                
                                                   
                                               
                                                
                                            </li>
                                           
                                @empty
                                    <div class="row">
                                        <div class="no_message " >
                                            <p>There are no comments.</p>
                                        </div>
                                    </div>
                                    <hr />
                                @endforelse
                             
        
                                
                                </ul>
           
                       
                               
                              </li>
                         
                  
                    
              
        
          
          <div class="nav-tabs-navigation tab" >
            <div class="nav-tabs-wrapper">
              <ul id="tabs" class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#home" role="tab">Message</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#profile" role="tab">  Note</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tdab" href="#meddssages" role="tab"></a>
                </li>
              </ul>
            </div>
          </div>
          <div id="my-tab-content" class="tab-content  body_tab" >
            <div class="tab-pane active " id="home" role="tabpanel">
                <form action="{{ route('admin.tickets.storeComment', $ticket->id) }}" method="POST">
                    @csrf
                    
                    <div class="form-group" id="wessen2">
                        <label for="comment_text"></label>
                        <textarea class="form-control type_msg" id="comment_text" name="comment_text" rows="3" required></textarea>
                     
                      
                    </div>
              
                  
                <div class="form-group col-md-12"  >
                    <div class="row" id="wessen2">
                    <div class="form-group  col-md-2">
                    <label for="cc_id">To</label>
                    </div>
                    <div class="form-group col-md-10">
                    <input type="email" id="to_id" name="to_id" class="form-control" value="{{  @$ticket->author_email  }}" >
                    </div>
                  
               
                        <div class=" form-group  col-md-2">
                            <label for="cc_id">Cc</label>
                        </div>
                        <div class="form-group  col-md-10">
                    <input type="email" id="cc_id" name="cc_id" class="form-control" value="{{  @$comment->cc }}">
               
                </div>
                
                <div class="form-group col-md-12">
                    <div id="wessen2" class="vertical-center">
                        <div >
                            <button type="submit" class="button-34  vertical-center">@lang('Send')</button>
                    </div>
                </div>
                       
                  
               
                </div>
            </div>
               
                    </div>
             </form>
            </div>
            <div class="tab-pane" id="profile" role="tabpanel">
              

                        <form action="{{ route('admin.tickets.storeNote', $ticket->id) }}" method="POST">
                            @csrf
                            
                            <div class="form-group" id="wessen2">
                                <label for="comment_text"></label>
                                <textarea class="form-control type_msg" id="note_text" name="note_text" rows="3" required></textarea>
                             
                            </div>
                            <div id="wessen2" class="vertical-center">
                                <div >
                                <button type="submit" class="button-34 vertical-center">Submit</button>
                            </div>
                        </div>
                     </form>
               
                 
                    
            </div>
            <div class="tab-pane" id="messages" role="tabpanel">
              <p>Here are your messages.</p>
            </div>
          </div>
        </div>
        
      </div>
		{{-- <div class="main-body">
			<div class="row">
				<div class="col-lg-4 ">
					<div class="card">
						<div class="card-body cat" >
							<div class="d-flex flex-column align-items-center text-center mb-0  "style="font-size: 1.2em;">
								Ticket info
							</div>
			


							<ul class="list-group list-group-flush ">
								<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap  cat-2">
									<h6 class="mb-0">{{ trans('cruds.ticket.fields.status') }}</h6>
									<span class="mb-0">{{ $ticket->status->name ?? '' }}</span>
								</li>
								
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap cat-2"">
									<h6 class="mb-0">{{ trans('cruds.ticket.fields.priority') }}</h6>
									<span class="mb-0">{{ $ticket->priority->name ?? '' }}</span>
								</li>

                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap cat-2"">
									<h6 class="mb-0">{{ trans('cruds.ticket.fields.category') }}</h6>
									<span class="mb-0">{{ $ticket->category->name ?? '' }}</span>
								</li>
                                
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap cat-2"">
									<h6 class="mb-0">{{ trans('cruds.ticket.fields.author_name') }}</h6>
									<span class="mb-0">{{ $ticket->author_name ?? '' }}</span>
								</li>
                                
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap cat-2"">
									<h6 class="mb-0">{{ trans('cruds.ticket.fields.author_email') }}</h6>
									<span class="mb-0">{{ $ticket->author_email ?? '' }}</span>
								</li>


                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap cat-2"">
									<h6 class="mb-0">{{ trans('cruds.ticket.fields.assigned_to_user') }}</h6>
									<span class="mb-0">{{  $ticket->assigned_to_user->name?? 'Not Yet' }}</span>
								</li>
                             <div class="card-body cat" >
                                        <div class="d-flex flex-column align-items-center text-center mb-0  " style="font-size: 1.2em;">
                                        
                                        TICKET TAGS
                                        @if($ticket->count())
                                        <div>
                                        @foreach($ticket->tags as $key => $tag)
                                        <label class="badge bg-primary">{{ $tag->name }}</label>
                                        
                                        
                                        @endforeach
                                        </div>
                             </div> </div>
                                @endif
							</ul>
						</div>



                       
                        <div class="card-body cat" >
							<div class="d-flex flex-column align-items-center text-center mb-0  " style="font-size: 1.2em;">
								Other tickets  by: {{ $ticket->author_name ?? '' }}
							</div>
			
                            @php 
                            $value = \App\ticket::where(['author_email' => $ticket->author_email])->get();
                            $count=$value->count();
                            $tic= \App\comment::where(['ticket_id' => $ticket->id])->get();
                            $total=$tic->count();


   

    
  
                            
                              @endphp
                                      @if($count>1)
                              
                                             @foreach ($value as $link)
                                               
                                               <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap  cat-2">
                                                <h6 class="mb-0"  style="text-align: justify">  {{ '#'.$link->uid}} &nbsp; &nbsp; <a href="{{ $link->id}}" target="_blank" title="Visit Link: {{ $link->id }}">{{ $link->title}}</a></h6>
                                              
                                               </li>
                                                <br>
                                
                                              @endforeach
         
                                       @else
                                            
                                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap  cat-2">
                                                <h6 class="mb-0">No other ticket</h6>
                                              
                                               </li>
                                        @endif
                                              

						
							
								
                               

                           
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">
                      
                
              <li class="list-group-item user_info  ">
                <div class="row wessen"> 
                <div class="col-xs-12 col-md-12  "> 
                  <div> 
                    <div class="card-header msg_head">
                        <div class="d-flexx bd-highlightxc">
                          
                            <div class="user_info">
                                <span> <b> {{ '#'.$ticket->uid}} </b> <a  href="#">{{ $ticket->title }}  </a></span>
                                <span><p class="content">   {!! $ticket->content !!}</p> </span>
                                <p>{{ $total }} Messages</p>
                            </div>
                           
                        </div>
                        <span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
                        <div class="action_menu">
                            <ul>
                                <li><i class="fas fa-user-circle"></i> View profile</li>
                                <li><i class="fas fa-users"></i> Add to close friends</li>
                                <li><i class="fas fa-plus"></i> Add to group</li>
                                <li><i class="fas fa-ban"></i> Block</li>
                            </ul>
                        </div>
                    </div>
                </div>

              
                                    <ul id="chat">
                                 
                                        @forelse ($ticket->comments as $comment)

                                        
                                        <div class="row">
                                            <div class="col">
            
                                                <li class="you">
                                                    <div class="entetfe">
                                                      <div class="message-fbox-holder">
                                                        <div class="messagfe-sender">
                                                        
                                                         </div>
                                                        <div class="messagef-box messafge-partner">
                                                      @php
                                                                                                                       
                                            $content=$comment->comment_text;
                
                                // $activity = explode( '<div dir="ltr">' , $content );
                                //$activity_second = explode("</div>" , $activity );
                                //$x= $activity_second[0];
                        
                                                        @endphp 

    @if($comment->user_id!== null)
                              

<div class="d-flex justify-content-start mb-4">
    <div class="img_cont_msg">
        <img src="data:image/png;base64,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" class="rounded-circle user_img_msg" alt="w">
    </div>
    
    <div class="msg_cotainer">
        
        {!!
   
   $content
         
          !!}
        <b  style="color: rgb(231, 222, 222)" class="msg_time"> <a href="mailto:{{ $comment->author_email }}">{{ $comment->author_name       }} :</a>
            {{  date('d F Y H:i:s', strtotime($comment->created_at))
        }}</b>
    </div>
</div>
       
     

@else

<div class="d-flex justify-content-end mb-4">
    <div class="msg_cotainer_send">
       
        {!!
   
   $content
         
          !!}
        <b style="color: rgb(231, 222, 222)" class="msg_time_send"> <a href="mailto:{{ $comment->author_email }}">{{ $comment->author_name       }} :</a>
            {{  date('d F Y H:i:s', strtotime($comment->created_at)) }}</b>
    </div>
    <div class="img_cont_msg">
<img src="data:image/jpeg;base64,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" class="rounded-circle user_img_msg">
    </div>

</div>
 
 
@endif
                                                    
                                                       
                                                   
                                                    
                                                </li>
                                               
                                    @empty
                                        <div class="row">
                                            <div class="col ">
                                                <p>There are no comments.</p>
                                            </div>
                                        </div>
                                        <hr />
                                    @endforelse
                                 
            
                                    
                                    </ul>
                </div>
                           
                                    <form action="{{ route('admin.tickets.storeComment', $ticket->id) }}" method="POST">
                                        @csrf
                                        
                                        <div class="form-group" id="wessen2">
                                            <label for="comment_text"></label>
                                            <textarea class="form-control type_msg" id="comment_text" name="comment_text" rows="3" required></textarea>
                                         
                                          
                                        </div>
                                        <label for="cc_id">To</label>
                                        <input type="email" id="to_id" name="to_id" class="form-control" value="{{  @$ticket->author_email  }}" >
                                        <label for="cc_id">Cc</label>
                                        <input type="email" id="cc_id" name="cc_id" class="form-control" value="{{  @$comment->cc }}">
                                        <button type="submit" class="btn btn-primary send_btn">@lang('global.submit')</button>
                                    </form>
                                  </li>
                             
						</div>
                        
					</div>
					
				</div>
			</div>
		</div>
	</div>


--}}

</div>

</div>
        <a class="btn btn-default my-2" href="{{ route('admin.tickets.index') }}">
            {{ trans('global.back_to_list') }}
        </a>

        <a href="{{ route('admin.tickets.edit', $ticket->id) }}" class="btn btn-primary">
            @lang('global.edit') @lang('cruds.ticket.title_singular')
        </a>

        <nav class="mb-3">
            <div class="nav nav-tabs">

            </div>
        </nav>
    </div>
</div>

 
   


@endsection

@section('scripts')

 <script>
 
      $('#comment_text').summernote({
        placeholder: 'leave comment here',
        tabsize: 2,
        height: 100,
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
      $('#note_text').summernote({
        placeholder: 'leave comment here',
        tabsize: 2,
        height: 100,
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

      $(document).ready(function(){
$('#action_menu_btn').click(function(){
	$('.action_menu').toggle();
});
	});

    </script>


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

@stop