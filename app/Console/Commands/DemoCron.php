<?php
   
namespace App\Console\Commands;
   
use Illuminate\Console\Command;
use Webklex\IMAP\Facades\Client;
use Webklex\PHPIMAP\ClientManager;
use Illuminate\Support\Facades\Storage;
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
use Illuminate\Support\Str;




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
            $attachments = $message->getAttachments();
             
       
            if (!$references) {
                $tick_tag="new";
                $tags = explode(",", $tick_tag);

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

        
       
      

       
         
        
        //return redirect()->route('admin.tickets.index');
        
    
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