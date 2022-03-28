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



<div class="container">
		<div class="main-body">
			<div class="row">
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								Ticket info
							</div>
							
							<ul class="list-group list-group-flush">
								<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" ></svg>{{ trans('cruds.ticket.fields.status') }}</h6>
									<span class="text-secondary">{{ $ticket->status->name ?? '' }}</span>
								</li>
								
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" ></svg>{{ trans('cruds.ticket.fields.priority') }}</h6>
									<span class="text-secondary">{{ $ticket->priority->name ?? '' }}</span>
								</li>

                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" ></svg>{{ trans('cruds.ticket.fields.category') }}</h6>
									<span class="text-secondary">{{ $ticket->category->name ?? '' }}</span>
								</li>
                                
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" ></svg>{{ trans('cruds.ticket.fields.author_name') }}</h6>
									<span class="text-secondary">{{ $ticket->author_name ?? '' }}</span>
								</li>
                                
                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" ></svg>{{ trans('cruds.ticket.fields.author_email') }}</h6>
									<span class="text-secondary">{{ $ticket->author_email ?? '' }}</span>
								</li>


                                <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" ></svg>{{ trans('cruds.ticket.fields.assigned_to_user') }}</h6>
									<span class="text-secondary">{{  $ticket->assigned_to_user->name ?? '' }}</span>
								</li>

							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">
							
                
                               
                                
                                    <ul id="chat">
                                      
                                     
                                    
                                       <li class="list-group-item user_info">
                                    <div class="row"> <
                                    <div class="col-xs-10 col-md-11"> <div> 
                                        <div class="comment-text  " ><h5 class=""><strong>Subject:&nbsp;</strong><a  href="'+row.view_link+'">{{ $ticket->title }}  </a></h5> 
                                         </div class="user_content"><p><strong>Body:&nbsp;</strong>   {!! $ticket->content !!}</p> 
                                        
                                        </div>
                                    </div>
                                </li>
                                     

                                        @forelse ($ticket->comments as $comment)
                                        <div class="row">
                                            <div class="col">
            
                                                <li class="you">
                                                    <div class="entete">
                                                        
                                                        <h2 class="font-weight-bold"><a href="mailto:{{ $comment->author_email }}">{{ $comment->author_name            }}</a></h2>
                                                        <h3> {{ $comment->created_at }}</h3>
                                                    </div>
                                                   
                                                    <div class="message">
                                                        <p>{{ $comment->comment_text }}</p>
                                                    </div>
                                                </li>
                                               
                                    @empty
                                        <div class="row">
                                            <div class="col">
                                                <p>There are no comments.</p>
                                            </div>
                                        </div>
                                        <hr />
                                    @endforelse
                                 
            
                                    
                                    </ul>
                                
                           
                                    <form action="{{ route('admin.tickets.storeComment', $ticket->id) }}" method="POST">
                                        @csrf
                                        <div class="form-group">
                                            <label for="comment_text">Leave a comment</label>
                                            <textarea class="form-control type_msg" id="comment_text" name="comment_text" rows="3" required></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary send_btn">@lang('global.submit')</button>
                                    </form>

						</div>
					</div>
					
				</div>
			</div>
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