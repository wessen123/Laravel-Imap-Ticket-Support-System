<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Str;
use Illuminate\Support\HtmlString;

class CommentEmailNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($comment)
    {
        $this->comment = $comment;
       // dd( $this->comment); 
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail','database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $cc=   $this->comment->cc;    
       // dd(storage_path('tmp/uploads/62fa554dc3fbd_images.png' ));  
      // $file=$this->comment->ticket->getMedia(); 
        if($cc!=null){         
        return (new MailMessage)
                    ->cc($cc)
                    ->subject('Re: '.$this->comment->ticket->title)
                   
                    ->greeting('Your Ticket Status  Is:  '.$this->comment->ticket->status->name)
                   
                    ->line(new HtmlString($this->comment->comment_text))
                    
                    ->salutation(' ');
    }else{

        return (new MailMessage)
        
        ->subject('Re: '.$this->comment->ticket->title)
        ->greeting('Your Ticket Status  Is:  '.$this->comment->ticket->status->name)
       
        ->line(new HtmlString($this->comment->comment_text))
        
        ->salutation(' ');
    }
}


     /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        return [
            //
            
            'ticket_id'=>$this->comment->ticket->id,
            'title'=>"new messages for ". $this->comment->ticket->title,
            'name'=>$this->comment['author_email'],
            
        ];
    }
}
