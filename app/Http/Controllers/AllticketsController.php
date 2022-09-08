<?php
   
namespace App\Console\Commands;
   
use Illuminate\Console\Command;
use Webklex\IMAP\Facades\Client;
use Webklex\PHPIMAP\ClientManager;

use App\Category;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyTicketRequest;
use App\Http\Requests\StoreTicketRequest;
use App\Http\Requests\UpdateTicketRequest;
use App\Priority;
use App\Status;
use App\Ticket;
use App\Comment;




class DemoCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'demo:cron';
    
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';
    
    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }
    
    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //https://www.itsolutionstuff.com/post/laravel-8-cron-job-task-scheduling-tutorialexample.html
        
        \Log::info("Cron is working fine!wessen");
     
        /*
           Write your database logic we bellow:
           Item::create(['name'=>'hello new']);
        */
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
           
             
       
            if (!$references) {
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
            $attachments = $message->getAttachments();
            $attachments->each(function ($attachment) {
                /** @var \Webklex\PHPIMAP\Attachment $attachment */
                $attach_pth = uniqid("attach_pth_") . "/";
                
                $attachment->save('C:/xampp/htdocs/Laravel/Laravel-Support-Ticketing-2/public/mail/$attach_pth');
              
            });
            $mail->save();
        }
        if ($references) {
            $mesid=$message->getSubject();
            //Re: New comment on ticket aaaaaaaaaaaaaaa
        
          $pattern = '/Re: /i';
          $mesid = preg_replace($pattern,"",$mesid);
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
               
                'comment_text' =>$message->getHTMLBody(true) ?? $message->getTextBody() ?? '',
                'created_at'=> $message->getdate(),
                'ticket_id'=>  $tic,
            
            ]);
            $attachments = $message->getAttachments();
            $attachments->each(function ($attachment) {
                /** @var \Webklex\PHPIMAP\Attachment $attachment */
                $attach_pth = uniqid("attach_pth_") . "/";
                
                $attachment->save('C:/xampp/htdocs/Laravel/Laravel-Imap-Ticket-Support-System/public/mail/$attach_pth');
              
            });
            $reply->save();
        }
      


    }

        
       
      

       
         
        
        //return redirect()->route('admin.tickets.index');
        
    
    }
}