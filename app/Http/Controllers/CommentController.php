<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comment;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function save(Request $request){

        //validacion
        $validate = $this->validate($request,[
            'image_id' =>'integer|required',
            'content' =>'string|required'
        ]);

        //recoger datos
        $user = Auth::user();
        $image_id = $request->input('image_id');
        $content = $request->input('content');

        //asigno  los valores a mi nuevo objeto a guardar
        $comment = new Comment();
        $comment->user_id = $user->id;
        $comment->image_id = $image_id;
        $comment->content = $content;

        //guardar en la db
        $comment->save();

        //redireccion
        return redirect()->route('image.detail', ['id'=> $image_id])->with([
            'message' => 'Has publicado tu comentario correctamente!!'
        ]);
    }

    public function delete($id){
        //conseguir datos del usuario logueado
        $user = Auth::user();

        //conseguir objeto del comentario
        $comment = Comment::find($id);

        //comprobar si soy el dueño del comentario o de la publicacion
        if($user && ($comment->user_id == $user->id  || $comment->image->user_id == $user->id)){//nos permite borrar un comentario cuando estamos logueados que es la primer condicion del if y la segunda condicion dice que el id del usuario que hizo el comentario tiene que ser igual al id del usuario logueado  o  que el id del usuario asociado a la imagen(osea el que publico l imagen) sea igual al id del usuario que esta actualmente logueado
            //elimina el comentario
            $comment->delete();

            //redireccion a la pagina del detalle 
            return redirect()->route('image.detail', ['id'=> $comment->image->id])->with([
                'message' => 'Comentario eliminado correctamente!!'
            ]);
        }else{
            //redireccion a la pagina del detalle 
            return redirect()->route('image.detail', ['id'=> $comment->image->id])->with([
                'message' => 'EL COMENTARIO NO SE HA ELIMINADO!!'
            ]);
        }
    }
}
