<div class="sidebar" >
    <nav class="sidebar-nav" >
        @php 
        
        $value= App\Category::with('childs')->where('c_id',0)->get();
        $Tickets = DB::table('tickets')->get();
        $count=$value->count();
        $total=$Tickets->count();
       // $userCount = Users::where('your_condition')->count();
       
        //$totalcat = \App\ticket::where(['catagory_id' => $value->id])->get();
        //$counted=$totalcat->count();

          @endphp
          

        <ul class="nav">
            @can('dashboard_access')
                <li class="nav-item">
                    <a href="{{ route("admin.home") }}" class="nav-link">
                        <i class="nav-icon fas fa-fw fa-tachometer-alt">

                        </i>
                        {{ trans('global.dashboard') }}
                    </a>
                </li>
            @endcan
            @can('user_management_access')
                <li class="nav-item nav-dropdown">
                    <a class="nav-link  nav-dropdown-toggle" href="#">
                        <i class="fa-fw fas fa-users nav-icon">

                        </i>
                        {{ trans('cruds.userManagement.title') }}
                    </a>
                    <ul class="nav-dropdown-items">
                        @can('permission_access')
                            <li class="nav-item">
                                <a href="{{ route("admin.permissions.index") }}" class="nav-link {{ request()->is('admin/permissions') || request()->is('admin/permissions/*') ? 'active' : '' }}">
                                    <i class="fa-fw fas fa-unlock-alt nav-icon">

                                    </i>
                                    {{ trans('cruds.permission.title') }}
                                </a>
                            </li>
                        @endcan
                        @can('role_access')
                            <li class="nav-item">
                                <a href="{{ route("admin.roles.index") }}" class="nav-link {{ request()->is('admin/roles') || request()->is('admin/roles/*') ? 'active' : '' }}">
                                    <i class="fa-fw fas fa-briefcase nav-icon">

                                    </i>
                                    {{ trans('cruds.role.title') }}
                                </a>
                            </li>
                        @endcan
                        @can('user_access')
                            <li class="nav-item">
                                <a href="{{ route("admin.users.index") }}" class="nav-link {{ request()->is('admin/users') || request()->is('admin/users/*') ? 'active' : '' }}">
                                    <i class="fa-fw fas fa-user nav-icon">

                                    </i>
                                    {{ trans('cruds.user.title') }}
                                </a>
                            </li>
                        @endcan
                        @can('audit_log_access')
                            <li class="nav-item">
                                <a href="{{ route("admin.audit-logs.index") }}" class="nav-link {{ request()->is('admin/audit-logs') || request()->is('admin/audit-logs/*') ? 'active' : '' }}">
                                    <i class="fa-fw fas fa-file-alt nav-icon">

                                    </i>
                                    {{ trans('cruds.auditLog.title') }}
                                </a>
                            </li>
                        @endcan
                    </ul>
                </li>
            @endcan

            @can('ticket_access')
            <li class="nav-item">
                <a href="{{ route("admin.tickets.index") }}" class="nav-link {{ request()->is('admin/tickets') || request()->is('admin/tickets/*') ? 'active' : '' }}">
                    <i class="fa-fw fas fa-question-circle nav-icon">

                    </i>
                    {{ trans('cruds.ticket.title') }}<b style=" border-radius: 50%;
                
                margin-left: 50px;
                width: 30px;
                 height: 30px;
                 padding: 5px;
                    
                        background:rgb(50, 3, 223);
                        border: 1px solid #666;
                        color: #fff;
                        text-align: center;
                    
                        font: 16px Arial, sans-serif;
                ">{{ $total}}</b>
                   
                </a>

            </li>
            
        @endcan

      

    @can('ticket_access')
    <li class="nav-item nav-dropdown">
        <a class="nav-link  nav-dropdown-toggle" href="#">
           
            <i class="fa-fw fas  fa-folder nav-icon">

            </i>
           Ticket Folder<b style=" border-radius: 50%;
                
           margin-left: 20px;
           width: 30px;
            height: 30px;
            padding: 5px;
               
                   background:rgb(50, 3, 223);
                   border: 1px solid #666;
                   color: #fff;
                   text-align: center;
               
                   font: 16px Arial, sans-serif;
           ">{{ $count}}</b>
        </a>
        <ul class="nav-dropdown-items">
            @can('ticket_access')
             @foreach (App\Category::with('childs')
             ->where('c_id',0)->get() as $link)

             @if($link->childs->count()>0)
                <li class="nav-item" >
                    
                        <a style="color: 	#FFF8DC, 214);font-size: 1em;" href="http://127.0.0.1:8000/admin/tickets?category={{ $link->id}}" class="nav-link {{ request()->is('admin/tickets') || request()->is('admin/tickets/*') ? 'active' : '' }}"> 
                            <i class="fa-fw fas  fa-folder nav-icon">
    
                            </i>
                           
                            {{ substr($link->name, 0, 15) }} <b style=" border-radius: 50%;margin-left: 5px;width: 25px; height: 25px;padding: 4px; background: rgb(50, 3, 223); border: 1px solid #666;color: #fff; text-align: center;font: 14px Arial, sans-serif; font-size: 1.2 em;">
                         {{ $link->childs->count()}}</b>
                            
                           
                        </a>
                        @foreach($link->childs as $subMenu)
                        <ul>
                            <li class="nav-item" ><a style=" color: #FFFFFF;font-size: 1em; " href="http://127.0.0.1:8000/admin/tickets?category={{ $subMenu->id}}" >
                                <i class="fa fa-ticket" aria-hidden="true"></i>
                               {{substr($subMenu->name, 0, 15)}}
                               <b style=" border-radius: 30%;margin-left: 3px; width: 15px; height: 15px;padding: 2px; background: rgb(50, 3, 223); border: 1px solid #666;color: #fff; text-align: center;font: 10px Arial, sans-serif;">
                                {{ $subMenu->childs->count()}}</b>
                            </a></li>
                        </ul>
                       
                        @foreach($subMenu->childs as $subtwoMenu)
                        <ul>
                            <li class="nav-item" ><a style="color: #00FA9A; margin-left: 10px; font-size: 1em;" href="http://127.0.0.1:8000/admin/tickets?category={{ $subtwoMenu->id}}" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                                  </svg>
                               {{substr($subtwoMenu->name, 0, 15)}}
                               <b style=" border-radius: 30%;margin-left: 3px; width: 15px; height: 15px;padding: 2px; background: rgb(16, 170, 5); border: 1px solid #666;color: #fff; text-align: center;font: 10px Arial, sans-serif;">
                                {{$subtwoMenu->childs->count()}}</b>
                            </a></li>
                        </ul>

                        @foreach($subtwoMenu->childs as $subthreeMenu)
                        <ul>
                            <li class="nav-item" ><a style="color: #e0e411; margin-left: 15px; font-size: 1em;" href="http://127.0.0.1:8000/admin/tickets?category={{ $subthreeMenu->id}}" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                                  </svg>
                               {{substr($subthreeMenu->name, 0, 15)}}
                               <b style=" border-radius: 30%;margin-left: 3px; width: 15px; height: 15px;padding: 2px; background: rgb(204, 239, 7); border: 1px solid #666;color: #fff; text-align: center;font: 10px Arial, sans-serif;">
                                {{$subthreeMenu->childs->count()}}</b>
                            </a></li>
                        </ul>

                        @foreach($subthreeMenu->childs as $subfourMenu)
                        <ul>
                            <li class="nav-item" ><a style="color: #e41111; margin-left: 20px; font-size: 1em;" href="http://127.0.0.1:8000/admin/tickets?category={{ $subfourMenu->id}}" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                                  </svg>
                               {{substr($subfourMenu->name, 0, 15)}}
                               <b style=" border-radius: 30%;margin-left: 3px; width: 15px; height: 15px;padding: 2px; background: rgb(230, 6, 25); border: 1px solid #666;color: #fff; text-align: center;font: 10px Arial, sans-serif;">
                                {{App\Ticket::where(['category_id' => $subfourMenu->id])->count()}}</b>
                            </a></li>
                        </ul>


                        @endforeach
                        @endforeach
                        
                        @endforeach

                        @endforeach
                        @else
                        <li>
                            <a style="color: rgb(208, 205, 214);" href="http://127.0.0.1:8000/admin/tickets?category={{ $link->id}}" class="nav-link {{ request()->is('admin/tickets') || request()->is('admin/tickets/*') ? 'active' : '' }}"> 
                                <i class="fa-fw fas  fa-folder nav-icon">
        
                                </i>
                               
                                {{ substr($link->name, 0, 15) }} <b style=" border-radius: 50%;margin-left: 5px;width: 25px; height: 25px;padding: 4px; background: rgb(50, 3, 223); border: 1px solid #666;color: #fff; text-align: center;font: 14px Arial, sans-serif;
                                ">{{ @App\Ticket::where(['category_id' => $subMenu->id])->count()}}</b>
                                
                                
                               
                            </a>
                        </li>
                        @endif
                       
                   
                    
                </li>
                <br>
                @endforeach
            @endcan
           
        </ul>
       
    </li>
@endcan
            @can('status_access')
                <li class="nav-item" >
                    <a href="{{ route("admin.statuses.index") }}" class="nav-link {{ request()->is('admin/statuses') || request()->is('admin/statuses/*') ? 'active' : '' }}">
                        <i class="fa-fw fas fas fa-flag nav-icon">

                        </i>
                        {{ trans('cruds.status.title') }}
                    </a>
                </li>
            @endcan
            @can('priority_access')
                <li class="nav-item">
                    <a href="{{ route("admin.priorities.index") }}" class="nav-link {{ request()->is('admin/priorities') || request()->is('admin/priorities/*') ? 'active' : '' }}">
                        <i class="fa-fw fas fa-cogs nav-icon">

                        </i>
                        {{ trans('cruds.priority.title') }}
                    </a>
                </li>
            @endcan
            @can('category_access')
                <li class="nav-item">
                    <a href="{{ route("admin.categories.index") }}" class="nav-link {{ request()->is('admin/categories') || request()->is('admin/categories/*') ? 'active' : '' }}">
                        <i class="fa-fw fas fa-tags nav-icon">

                        </i>
                        {{ trans('cruds.category.title') }}
                    </a>
                </li>
            @endcan
          
            @can('comment_access')
                <li class="nav-item">
                    <a href="{{ route("admin.comments.index") }}" class="nav-link {{ request()->is('admin/comments') || request()->is('admin/comments/*') ? 'active' : '' }}">
                        <i class="fa-fw fas fa-comment nav-icon">

                        </i>
                        {{ trans('cruds.comment.title') }}
                    </a>
                </li>
            @endcan
            @can('comment_access')
            <li class="nav-item">
                <a href="{{ route("admin.tags.index") }}" class="nav-link {{ request()->is('admin/tags') || request()->is('admin/tags/*') ? 'active' : '' }}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tag" viewBox="0 0 16 16">
                        <path d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z"/>
                        <path d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586 7 7L13.586 9l-7-7H2v4.586z"/>
                      </svg>

                    </i>
                    Tags
                </a>
            </li>
            @endcan
            <li class="nav-item"  class="container-fluid">
                <a href="#" class="nav-link" onclick="event.preventDefault(); document.getElementById('logoutform').submit();">
                    <i class="nav-icon fas fa-fw fa-sign-out-alt">

                    </i>
                    {{ trans('global.logout') }}
                </a>
            </li>
        
    
     

        </ul>

    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>