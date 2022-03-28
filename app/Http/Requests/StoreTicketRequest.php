<?php

namespace App\Http\Requests;

use App\Ticket;
use Gate;
use Illuminate\Foundation\Http\FormRequest;
use Symfony\Component\HttpFoundation\Response;

class StoreTicketRequest extends FormRequest
{
    public function authorize()
    {
        abort_if(Gate::denies('ticket_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        return true;
    }

    public function rules()
    {
        return [
            
        ];
    }
}
