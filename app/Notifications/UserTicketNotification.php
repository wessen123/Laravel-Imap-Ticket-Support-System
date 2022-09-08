<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class UserTicketNotification extends Notification
{
    use Queueable;
    public $note;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($note)
    {
        $this->note=$note;
        $users = \App\User::whereHas('roles', function ($q) {
            return $q->where('title', 'Admin');
        })->get();
       // dd($this->note);
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
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
            
            'ticket_id'=>$this->note['ticket_id'],
            'title'=>'you have new notes: '.$this->note['note_text'],
           
          
        ];
    }
}
