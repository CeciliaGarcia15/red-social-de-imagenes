<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Response;
use App\Models\User;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($search = null)
    {
        if(!empty($search)){
            $users = User::where('nick', 'LIKE', '%'.$search.'%')
                            //el or where es lo mismo que el or osea si se cumple uno o el otro o el otro si quisieramos hacer como un and osea  que se cumpla esta condicion Y esta condicion y esta condicion 
                            ->orWhere('name', 'LIKE', '%'.$search.'%')
                            ->orWhere('surname', 'LIKE', '%'.$search.'%')
                            ->orderBy('id','desc')
                            ->simplePaginate(5);
        }else{
            $users = User::orderBy('id', 'desc')->simplePaginate(5);
        }

        return view('user.index', [
            'users' =>$users
        ]);
    }

    public function config()
    {
        return view('user.config');
    }

    public function update(Request $request){

        //conseguir usuario identificado
        $user = Auth::user();
        $id = $user->id;

        //validacion del formulario
        $validate = $this->validate($request,[
            'name' => ['required', 'string', 'max:255'],
            'surname' => ['required', 'string', 'max:255'],
            'nick' => ['required', 'string', 'max:255', 'unique:users,nick,'.$id],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,'.$id]
        ]);


        //recoger datos del formulario
        $name = $request->input('name');
        $surname = $request->input('surname');
        $nick = $request->input('nick');
        $email = $request->input('email');

        //asignar nuevos valores al objeto del usuario
        $user->name = $name;
        $user->surname = $surname;
        $user->nick = $nick;
        $user->email = $email;


        //subir la imagen
        $image_path = $request->file('image_path');
        if($image_path){
            //poner nombre unico
            $image_path_name = time().$image_path->getClientOriginalName();
            //guardar en la carpeta storage(storage/app/users)
            Storage::disk('users')->put($image_path_name, File::get($image_path));

            //seteo el nombre de la imagen en el objeto
            $user->image = $image_path_name;
        }


        //ejecutar consulta y cambios en la base de datos
        $user->update();
        return redirect()->route('config')->with(['message'=>'Usuario actualizado correctamente']);//el message dentro del with es como un mensaje que se manda dentro de la session actual

    }


    public function getImage($filename){
        $file = Storage::disk('users')->get($filename);
        return new Response($file, 200);
    }

    public function profile($id){
        $user = User::find($id);

        return view('user.profile',[
            'user' => $user
        ]);
    }



}
