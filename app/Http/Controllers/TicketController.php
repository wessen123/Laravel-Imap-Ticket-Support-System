<?php

namespace App\Http\Controllers;
use Webklex\IMAP\Facades\Client;
use Webklex\PHPIMAP\ClientManager;

use App\Ticket;
use App\Category;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Notifications\CommentEmailNotification;
use Illuminate\Support\Facades\Notification;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    use MediaUploadingTrait;

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('tickets.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


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
            $mail = Ticket::firstOrNew([
                'uid' => $message->getUid(),
            ], [
                'title' => $message->getSubject(),
                'author_email' => $message->getFrom()[0]->mail,
            
                'category_id'   => 1,
                'status_id'     => 1,
                'priority_id'   => 1
            ]);
            $mail->save();
        }
        return 'true';
    }
//+
//どんどん、関数使って、文章を書いたらええと思う。多分・・・。
    protected function getattAchmentsPath($message)
    {
        if ($message->hasAttachments()) {
            $attach_pth = uniqid("attach_pth_") . "/";
            foreach ($message->getAttachments() as $attachment) {
                Storage::disk('local')->put('public/mail/' . $attach_pth . '/' . $attachment->name, $attachment->content);
            }
            return  $attach_pth;
        } else {
            return  $attach_pth = '';
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Ticket  $ticket
     * @return \Illuminate\Http\Response
     */
    public function show(Ticket $ticket)
    {
        $ticket->load('comments');

        return view('tickets.show', compact('ticket'));
    }

    public function storeComment(Request $request, Ticket $ticket)
    {
        $request->validate([
            'comment_text' => 'required'
        ]);

        $comment = $ticket->comments()->create([
            'author_name'   => $ticket->author_name,
            'author_email'  => $ticket->author_email,
            'comment_text'  => $request->comment_text
        ]);

        $ticket->sendCommentNotification($comment);

        return redirect()->back()->withStatus('Your comment added successfully');
    }

    public function fetchState(Request $request)
    {
        $data['states'] = Category::where("c_id", $request->c_id)
                                ->get(["name", "id"]);
  
        return response()->json($data);
    }
}
