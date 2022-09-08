<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Tag;

class TagController extends Controller
{
    public function index()
    {
        $tags = Tag::all();

        return view('admin.tags.index', compact('tags'));
    }

    public function create()
    {
        return view('admin.tags.create');
    }

    public function store(Request $request)
    {
        //$request->validate(['name' => 'required']);

        Tag::create(['tag_name' => $request->name]);
       $this->validate($request, [
       
        'tags' => 'required',
    ]);

        $tags = explode(",", $request->tags);

        $post = Tag::create($input);

        $post->tag($tags);


        return redirect()->route('admin.tags.index');
    }

    public function edit(Tag $tag)
    {
        return view('admin.tags.edit', compact('tag'));
    }

    public function update(Request $request,  Tag $tag)
    {
        $request->validate(['tag_name' => 'required']);
        $slug = preg_replace('/\?/u', ' ', trim($request->tag_name));
        $slug = preg_replace('/\s+/u', '-', trim($slug));
        $slug  = strtolower( $slug ); 
        $tag->update(['tag_name' => $request->tag_name,'tag_slug' => $slug]);

       

        return redirect()->route('admin.tags.index');
       
    }

    public function destroy(Tag $tag)
    {
        $tag->delete();
        return back();
    }
    public function massDestroy(MassDestroyCategoryRequest $request)
    {
       Tag::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
