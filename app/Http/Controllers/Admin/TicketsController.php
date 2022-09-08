<?php

namespace App\Http\Controllers\Admin;
use Webklex\IMAP\Facades\Client;
use Webklex\PHPIMAP\ClientManager;
use Illuminate\Support\Facades\Storage;
use App\Category;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyTicketRequest;
use App\Http\Requests\StoreTicketRequest;
use App\Http\Requests\UpdateTicketRequest;
use App\notifications\UserTicketNotification;
use App\notifications\UserCommentNotification;

use App\Priority;
use App\Status;
use App\Ticket;
use App\Note;
//use App\Tag;https://www.nicesnippets.com/blog/how-to-bootstrap-tags-system-in-laravel-8
use App\Comment;
use App\Thread;
use App\Conversation;
use DB;
use App\User;
use Gate;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Str;

class TicketsController extends Controller
{
    use MediaUploadingTrait;

    public function index(Request $request)
    {
       
          
        if ($request->ajax()) {
            $query = Ticket::with(['status', 'priority', 'category', 'assigned_to_user', 'comments','tagged'])
           
                ->filterTickets($request)
                ->AgentTickets($request)
                ->select(sprintf('%s.*', (new Ticket)->table))->orderBy('created_at', 'DESC');

               
               $tags =  $query;
       
       
                if($tags->count()){
                    foreach($tags as $key => $tag){
                       
                    foreach((array)$tag->$tags as $tag){
                       $tag_name= $tag->name;
                        $tags = explode(",", $tick_tag);
                            }
                    }
                  }  
            $table = Datatables::of($query);

            $table->addColumn('placeholder', '&nbsp;');
            $table->addColumn('actions', '&nbsp;');

            $table->editColumn('actions', function ($row) {
                $viewGate      = 'ticket_show';
                $editGate      = 'ticket_edit';
                $deleteGate    = 'ticket_delete';
                $crudRoutePart = 'tickets';

                return view('partials.datatablesActions', compact(
                    'viewGate',
                    'editGate',
                    'deleteGate',
                    'crudRoutePart',
                    'row'
                ));
            });

            $table->editColumn('id', function ($row) {
                return $row->id ? $row->id : "";
            });
     
            $table->editColumn('title', function ($row) {
                return $row->title ? $row->title : "";
            });
            $table->addColumn('status_name', function ($row) {
               
                return $row->status ? $row->status->name : '';
            });
            $table->addColumn('tag_name', function ($row) {
               
                return $row->tagNames();
            });
            $table->addColumn('status_color', function ($row) {
                return $row->status ? $row->status->color : '#000000';
            });

            $table->addColumn('priority_name', function ($row) {
                return $row->priority ? $row->priority->name : '';
            });
            $table->addColumn('priority_color', function ($row) {
                return $row->priority ? $row->priority->color : '#000000';
            });

            $table->addColumn('category_name', function ($row) {
                return $row->category ? $row->category->name : '';
            });
            $table->addColumn('category_color', function ($row) {
                return $row->category ? $row->category->color : '#000000';
            });
      
            $table->editColumn('author_name', function ($row) {
                return $row->author_name ? $row->author_name : "Unknown";
            });
            $table->editColumn('author_email', function ($row) {
                return $row->author_email ? $row->author_email : "";
            });
            $table->addColumn('assigned_to_user_name', function ($row) {
                return $row->assigned_to_user ? $row->assigned_to_user->name : 'Not Yet';
            });
   
            $table->editColumn('created_at', function ($row) {
               // return $row->created_at->timestamp ? $row->created_at->timestamp: "";
               return date('d F Y H:i:s', strtotime($row->created_at));
          
            });
          
            $table->addColumn('assigned_to_user_name', function ($row) {
                return $row->assigned_to_user ? $row->assigned_to_user->name : 'Not Yet';
            });
           

            $table->addColumn('comments_count', function ($row) {
                return $row->comments->count();
            });
            
            $table->addColumn('tag_name', function ($row) {
                return $row->tagNames();
            });

            $table->addColumn('view_link', function ($row) {
                return route('admin.tickets.show', $row->id);
            });

            $table->rawColumns(['actions', 'placeholder', 'status', 'priority', 'category', 'assigned_to_user','tags']);

            return $table->make(true);
        }

        $priorities = Priority::all();
        $statuses = Status::all();
        //$categories = Category::all();
        $categories = Category::with('childs')->where('c_id',0)->get();
       
       
        return view('admin.tickets.index', compact('priorities', 'statuses', 'categories', ));
    }

    public function create()
    {
        abort_if(Gate::denies('ticket_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');
     
            
        $client_user = [
            'host'          => 'smtp.gmail.com',
            'port'          => 993,
            'encryption'    => 'ssl',
            'validate_cert' => true,
            'username'      => 'wondwessenh41@gmail.com',
            'password'      => 'tedehhitvgczoeve',
            'protocol'      => 'imap',
        ];
        $client = Client::make($client_user);
        $client->connect();
        $folder = $client->getFolder("INBOX");
        $query = $folder->query();
        $messages = $query->since(now()->subDays(1))->get();

        foreach ($messages as $message) {

            $references = $message->getReferences();
            $test = $message->getReferences();
            $word = $message->getMessageId();
            $references = $message->getReferences();
           
            $attachments = $message->getAttachments();
       
            if (!$references) {
                $tick_tag="new";
                $tags = explode(",", $tick_tag);
        
                //$post = TagPost::create($input);
        
                
            $mail = Ticket::firstOrNew([
                'uid' => $message->getUid(),
            ], [
                'message_id'=>$message->getMessageId(),
                'referance'=> $message->getReferences(),
                'reply'=> $message->getInReplyTo(),
                'title' => $message->getSubject(),
                'author_email' => $message->getFrom()[0]->mail,
                'author_name' =>  $message->getFrom()[0]->personal,
               // 'content' => $message->getTextBody(),
                'content' =>$message->getHTMLBody(true) ?? $message->getTextBody() ?? '',
                'created_at'=> $message->getdate(),
                'category_id'   => 1,
                'status_id'     => 1,
                'priority_id'   => 1,
                

            ]);

            $media = $mail->attachments;

           
           // $attachments = $message->getAttachments();
            foreach ($attachments  as $attachment) {
                if (count($media) === 0 ) {
              //  $ticket->addMedia(storage_path('tmp/uploads/' . $file))->toMediaCollection('attachments');
              Storage::disk('local')->put(('public/tmp/uploads/' . $attachment->name), $attachment->content);
                $mail->addMedia(storage_path('app/public/tmp/uploads/' . $attachment->name))->toMediaCollection('attachments');
            }}
     

            $mail->save();
            $mail->tag($tags);
         
        }
        if ($references) {
            $mesid=$message->getSubject();
            //Re: New comment on ticket aaaaaaaaaaaaaaa
        
          $pattern = '/Re: /i';
          $mesid = preg_replace($pattern,"",$mesid);
          if ($message->hasHTMLBody()) {
            // Get body and replace :cid with images URLs
            $repBody = $message->getHTMLBody(true);
            $repBody  = $this->cleanReplyEmail($repBody, true);
        } else {
            $repBody = $message->getTextBody();
            $repBody  = $this->cleanReplyEmail($repBody, false);
        }

         //$repBody= $message->getHTMLBody(true) ?? $message->getTextBody() ?? '';
          //var_dump($mesid);  
            if( $mesid ){
                $tic = Ticket::where('title',  $mesid)->first()->id;

                        }
           else{
            //not sure will fix it later
            $tic= $mail->id;
               }
           
            $reply= Comment::firstOrNew([
                'message_id'=>$message->getMessageId(),
            ], [
                
                'referance'=> $message->getReferences(),
                'reply'=> $message->getInReplyTo(),

               // 'subject' => $message->getSubject(),
                'author_email' => $message->getFrom()[0]->mail,
                'author_name' => $message->getFrom()[0]->personal,
                'subject' => $message->getSubject(),
               
                'comment_text' =>$repBody,
                'created_at'=> $message->getdate(),
                'ticket_id'=>  $tic,
            
            ]);

            $reply->save();
        }
      


    }

        
       
      

       
         
        
        return redirect()->route('admin.tickets.index');
        
    }

    

    protected function getattAchmentsPath($message)
    {
        if ($message->hasAttachments()) {
            $attach_pth = uniqid("attach_pth_") . "/";
            foreach ($message->getAttachments() as $attachment) {
                Storage::disk('local')->put('public/mail/' . $attach_pth . '/' . $attachment->name, $attachment->content);
                 $ticket->addMedia(storage_path('tmp/uploads/' . $attachment))->toMediaCollection('attachments');
            }
            return  $attach_pth;
        } else {
            return  $attach_pth = '';
        }
    }
       
 

    public function store(StoreTicketRequest $request)
    {
     
        $request->validate([
            'title'         => 'required',
            'content'       => 'required',
            'author_name'   => 'required',
            'author_email'  => 'required|email',
            'tags'  => 'required',
        ]);
    $tags = explode(",", $request->tags);

  

 
  
   
        $ticket = Ticket::create($request->all());
        $ticket->tag($tags);
      
 
        return redirect()->route('admin.tickets.index');
    }

    public function edit(Ticket $ticket)
    {
        abort_if(Gate::denies('ticket_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $statuses = Status::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        $priorities = Priority::all()->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');

        //$categories = Category::with('childs')->where(['c_id' => 0])->pluck('name', 'id')->prepend(trans('global.pleaseSelect'), '');
        //$categories= Category::where(['c_id' => 0])->get();
        $categories = Category::with('childs')->where('c_id',0)->get();
        $assigned_to_users = User::whereHas('roles', function($query) {
                $query->whereId(2);
            })
            ->pluck('name', 'id')
            ->prepend(trans('global.pleaseSelect'), '');

        $ticket->load('status', 'priority', 'category', 'assigned_to_user');

        return view('admin.tickets.edit', compact('statuses', 'priorities', 'categories', 'assigned_to_users', 'ticket'));
    }

    public function update(UpdateTicketRequest $request, Ticket $ticket)
    {
        $this->validate($request, [
            
            
           // 'tags' => 'required',
        ]);

       
        $ticket->untag("new");

        $tags = explode(",", $request->tags);

       // $post = TagPost::create($input);

        $ticket->tag($tags);


        $ticket->update($request->all());

        if (count($ticket->attachments) > 0) {
            foreach ($ticket->attachments as $media) {
                if (!in_array($media->file_name, $request->input('attachments', []))) {
                    $media->delete();
                }
            }
        }

        $media = $ticket->attachments->pluck('file_name')->toArray();

        foreach ($request->input('attachments', []) as $file) {
            if (count($media) === 0 || !in_array($file, $media)) {
                $ticket->addMedia(storage_path('tmp/uploads/' . $file))->toMediaCollection('attachments');
            }
        }

        return redirect()->route('admin.tickets.index');
    }

    public function show(Ticket $ticket)
    {
        abort_if(Gate::denies('ticket_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $links = ticket::all();
    
        $ticket->load('status', 'priority', 'category', 'assigned_to_user', 'comments');

        return view('admin.tickets.show', compact('ticket', 'links'));
    }

    public function destroy(Ticket $ticket)
    {
        abort_if(Gate::denies('ticket_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $ticket->delete();

        return back();
    }

    public function massDestroy(MassDestroyTicketRequest $request)
    {
        Ticket::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
   

    public function subcat(Request $request)
    {
       
            $parent_id = "$request->cat_id";
            
            $subcategories = Category::where('id',$parent_id)
                                  ->with('subcategories')
                                  ->get();
        
            return response()->json([
                'subcategories' => $subcategories
            ]);
           
       

    }

    public function storeNote(Request $request, Ticket $ticket)
    {
        $request->validate([
            'note_text' => 'required',
            
            
        ]);
        //dd($request->cc_id);
   
   
        $user = auth()->user();
      
        $note = $ticket->notes()->create([
            'user_id'   => $user->id,
            'ticket_id'  => $ticket->id,
           
            'note_text'  => $request->note_text,
           
        ]);
       
       
         
        if( $user->roles->contains(1) ) {

            $user = $ticket->assigned_to_user;
            if($user!=null){
            $user->notify(new UserTicketNotification($note) );
            }
        }//
        elseif( $user->roles->contains(2) )
           {
            $users = User::whereHas('roles', function ($q) {
                 $q->where('title', 'Admin');
            })->get();   
            foreach($users as $user){

                $user->notify(new UserTicketNotification($note) );
            }
           // $user->notify(new UserTicketNotification($note) );
           // Notification::send($users, new UserTicketNotification($note));
           }
       
            //dd($user);
            
        
       // $ticket->UserTicketNotification($note);

        return redirect()->back()->withStatus('Your comment added successfully');
    }

    public function storeComment(Request $request, Ticket $ticket)
    {
        $request->validate([
            'comment_text' => 'required',
           
        ]);
        //dd($request->cc_id);
    if( $request->to_id!=""){
      
       $ticket->update(['author_email' => $request->to_id]);

            
    }
   
    foreach ($request->input('attachments', []) as $file) {
        $ticket->addMedia(storage_path('tmp/uploads/' . $file))->toMediaCollection('attachments');
    }

        $user = auth()->user();
       
        $comment = $ticket->comments()->create([
            'author_name'   => $user->name,
            'author_email'  => $user->email,
            'user_id'       => $user->id,
            'comment_text'  => $request->comment_text,
            'cc'  => $request->cc_id
        ]);

        $ticket->sendCommentNotification($comment);

        if( $user->roles->contains(1) ) {

            $user = $ticket->assigned_to_user;
            if($user!=null){
                $user->notify(new UserCommentNotification($comment) );
                }
           
        }//
        elseif( $user->roles->contains(2))
           {
            $users = User::whereHas('roles', function ($q) {
                 $q->where('title', 'Admin');
            })->get();   
            foreach($users as $user){

                $user->notify(new UserCommentNotification($comment) );
            }
           // $user->notify(new UserTicketNotification($note) );
           // Notification::send($users, new UserTicketNotification($note));
           }
       
     //   $user->notify(new UserCommentNotification($comment) );


        return redirect()->back()->withStatus('Your comment added successfully');
    }

    public function create2()
    {
        abort_if(Gate::denies('ticket_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $cm = new ClientManager(config("imap"));
        $client =$cm->make([
            'host'          => 'smtp.gmail.com',
            'port'          => 993,
            'encryption'    => 'ssl',
            'validate_cert' => true,
            'username'      => 'wondwessenh41@gmail.com',
            'password'      => 'tedehhitvgczoeve',
            'protocol'      => 'imap',
        ]);

        //MAIL_USERNAME=wondwessenhaile42@gmail.com
        //MAIL_PASSWORD=ogshawqgudxnfvsb
        // Connect to the Server
        //$Client = Client::account('gmail');

       // $client->connect($client_user);


        $this->connection = $client->connect();
        // Get folder
        $folder = $client->getFolder('INBOX');

        if (!$folder) {
            throw new \Exception("Could not get mailbox folder: INBOX", 1);
        }

        // Get unseen messages for a period
        $messages = $folder->query()->unseen()->since(now()->subDays(1))->leaveUnread()->get();
        
        //$this->line('['.date('Y-m-d H:i:s').'] Fetched: '.count($messages));

        $message_index = 1;
        foreach ($messages as $message_id => $message) {
            //$this->line('['.date('Y-m-d H:i:s').'] '.$message_index.') '.$message->getSubject());
            $message_index++;

            // Check if message already fetched
            if (Thread::where('message_id', $message_id)->first()) {
               // $this->line('['.date('Y-m-d H:i:s').'] Message with such Message-ID has been fetched before: '.$message_id);
                $message->setFlag(['Seen']);
                continue;
            }
            
            if ($message->hasHTMLBody()) {
                // Get body and replace :cid with images URLs
                $body = $message->getHTMLBody(true);
                $body = $this->separateReply($body, true);
            } else {
                $body = $message->getTextBody();
                $body = $this->separateReply($body, false);
            }
            if (!$body) {
                $this->error('['.date('Y-m-d H:i:s').'] Message body is empty');
                $message->setFlag(['Seen']);
                continue;
            }

            $subject = $message->getSubject();
            $from = $message->getReplyTo();
            if (!$from) {
                $from = $message->getFrom();
            }
            if (!$from) {
                $this->error('['.date('Y-m-d H:i:s').'] From is empty');
                $message->setFlag(['Seen']);
                continue;
            } else {
                $from = $message->getFrom();
            }

           // $to = $this->formatEmailList($message->getTo());
            //$to = $this->removeMailboxEmail($to, $mailbox->email);
            $to=$message->getTo();

            //$cc = $this->formatEmailList($message->getCc());
           // $cc = $this->removeMailboxEmail($cc, $mailbox->email);
           $cc=$message->getCc();
           // $bcc = $this->formatEmailList($message->getBcc());
           // $bcc = $this->removeMailboxEmail($bcc, $mailbox->email);
           $bcc=$message->getBcc();
            $in_reply_to = $message->getInReplyTo();
            $references = $message->getReferences();

            $attachments = $message->getAttachments();

            $save_result = $this->saveThread( $message_id, $in_reply_to, $references, $from, $to, $cc, $bcc, $subject, $body,$attachments);
            
            if ($save_result) {
                $message->setFlag(['Seen']);
                //$this->line('['.date('Y-m-d H:i:s').'] Processed');
            } else {
                $this->error('['.date('Y-m-d H:i:s').'] Error occured processing message');
            }
        }
    }

    /**
     * Save email as thread.
     */
    public function saveThread($message_id, $in_reply_to, $references, $from, $to, $cc, $bcc, $subject, $body,$attachments)
    {
        $cc = $cc;

        // Find conversation
        $new = false;
        $conversation = null;
        $now = date('Y-m-d H:i:s');
        
        $prev_thread = null;

        if ($in_reply_to) {
            $prev_thread = Thread::where('message_id', $in_reply_to)->first();
        } elseif ($references) {
            if (!is_array($references)) {
                $references = array_filter(preg_split("/[, <>]/", $references));
            }
            $prev_thread = Thread::whereIn('message_id', $references)->first();
        }

        if ($prev_thread) {
            $conversation = $prev_thread->conversation;
        } else {
            // Create conversation
            $new = true;
            $customer = "wessen";

            $conversation = new Conversation();
            $conversation->type = Conversation::TYPE_EMAIL;
            $conversation->status = Conversation::STATUS_ACTIVE;
            $conversation->state = Conversation::STATE_PUBLISHED;
            $conversation->subject = $subject;
            $conversation->setCc($cc);
            $conversation->setBcc($bcc);
            $conversation->setPreview($body);
            if (count($attachments)) {
                $conversation->has_attachments = true;
            }
            $conversation->mailbox_id = 1;
            $conversation->customer_id = 1;
            $conversation->created_by_customer_id = 1;
            $conversation->source_via = Conversation::PERSON_CUSTOMER;
            $conversation->source_type = Conversation::SOURCE_TYPE_EMAIL;
        }
        $conversation->last_reply_at = $now;
        $conversation->last_reply_from = Conversation::PERSON_USER;
        // Set folder id
       
        $conversation->save();

        // Thread
        $thread = new Thread();
        $thread->conversation_id = $conversation->id;
        $thread->type = Thread::TYPE_CUSTOMER;
        $thread->status = $conversation->status;
        $thread->state = Thread::STATE_PUBLISHED;
        $thread->message_id = $message_id;
        $thread->body = $body;
        $thread->setTo($to);
        $thread->setCc($cc);
        $thread->setBcc($bcc);
        $thread->source_via = Thread::PERSON_CUSTOMER;
        $thread->source_type = Thread::SOURCE_TYPE_EMAIL;
        $thread->customer_id = 1;
        $thread->created_by_customer_id = 1;
        $thread->save();

        return redirect()->route('admin.tickets.index');
        
    }

    /**
     * Separate reply in the body.
     *
     * @param string $body
     *
     * @return string
     */
    public function separateReply($body, $is_html)
    {
        if ($is_html) {
            $separator = "new email separator";

            $dom = new \DOMDocument;
            libxml_use_internal_errors(true);
            $dom->loadHTML($body);
            libxml_use_internal_errors(false);
            $bodies = $dom->getElementsByTagName('body');
            if ($bodies->length == 1) {
                $body_el = $bodies->item(0);
                $body = $dom->saveHTML($body_el);
            }
            preg_match("/<body[^>]*>(.*?)<\/body>/is", $body, $matches);
            if (count($matches)) {
                $body = $matches[1];
            }
        } else {
            $separator = "new separator";
            $body = nl2br($body);
        }
        $parts = explode($separator, $body);
        if (!empty($parts)) {
            return $parts[0];
        }
        return $body;
    }

    /**
     * Remove mailbox email from the list of emails.
     * 
     * @param  array $list
     * @param  string $mailbox_email [description]
     * @return array
     */
    public function removeMailboxEmail($list, $mailbox_email)
    {
        if (!is_array($list)) {
            return [];
        }
        foreach ($list as $i => $email) {
            if (Email::sanitizeEmail($email) == $mailbox_email) {
                unset($list[$i]);
                break;
            }
        }
        return $list;
    }

    /**
     * Conver email object to plain emails.
     * 
     * @param  array $obj_list
     * @return array
     */
    public function formatEmailList($obj_list)
    {
        $plain_list = [];
        foreach ($obj_list as $item) {
            $plain_list[] = $item->mail;
        }
        return $plain_list;
    }
   

    /**
   * Strips quotes (older messages) from a message body.
   *
   * This function removes any lines that begin with a quote character (>).
   * Note that quotes in reply bodies will also be removed by this function,
   * so only use this function if you're okay with this behavior.
   *
   * @param $message1 (string)
   *   The message to be cleaned.
   * @param $plain_text_output (bool)
   *   Set to TRUE to also run the text through strip_tags() (helpful for
   *   cleaning up HTML emails).
   *
   * @return (string)
   *   Same as message passed in, but with all quoted text removed.
   *
   * @see http://stackoverflow.com/a/12611562/100134
   */
    public function cleanReplyEmail($repBody,$is_html) {


        if ($is_html=false) {
            $repBody  = strip_tags($repBody);
          }
        // Strip markup if $plain_text_output is set.
         $alternative_reply_separators = [
    

            // Email service providers specific separators.
            '<div class="gmail_quote">', // Gmail
            '<div id="appendonsend"></div>', // Outlook / Live / Hotmail / Microsoft
            '<div name="quote" ',
            'yahoo_quoted_', // Yahoo, full: <div id=3D"ydp6h4f5c59yahoo_quoted_2937493705"
            '------------------ 原始邮件 ------------------', // QQ
            '------------------ Original ------------------', // QQ English
            '<div id=3D"divRplyFwdMsg" dir=', // Outlook
            'regex:/<div style="border:none;border\-top:solid \#[A-Z0-9]{6} 1\.0pt;padding:3\.0pt 0in 0in 0in">[^<]*<p class="MsoNormal"><b>/', // MS Outlook
    
            // General separators.
            'regex:/<blockquote((?!quote)[^>])*>/', // General sepator. Should skip Gmail's <blockquote class="gmail_quote">.
            '<!-- originalMessage -->',
            '‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐',
            '--------------- Original Message ---------------',
        ];
        $cmp_reply_length_desc = function ($a, $b) {
            if (mb_strlen($a) == mb_strlen($b)) {
                return 0;
            }

            return (mb_strlen($a) < mb_strlen($b)) ? -1 : 1;
        };
        
        $reply_separators = $alternative_reply_separators;

        foreach ($reply_separators as $reply_separator) {
            if (Str::startsWith($reply_separator, 'regex:')) {
                $regex = preg_replace("/^regex:/", '', $reply_separator);
                $parts = preg_split($regex, $repBody);
            } else {
                $parts = explode($reply_separator, $repBody);
            }
            if (count($parts) > 1) {
                // Check if past contains any real text.
                $text = $parts[0];
                $text = trim($text);
                $text = preg_replace('/^\s+/mu', '', $text);

                if ($text) {
                    $reply_bodies[] = $parts[0];
                }
            }
        }
        if (count($reply_bodies)) {
            usort($reply_bodies, $cmp_reply_length_desc);

            return $reply_bodies[0];
        }
       
   
       return $repBody;
      }
      
}

