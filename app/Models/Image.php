<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    //esto es para que sepa que tabla de la base de datos es la que va  a modificar
    protected $table = 'images';


    //relacion One to Many/ de uno a muchos   un unico modelo va a tener muchos comentarios
    public function comments(){
        return $this->hasMany('App\Models\Comment')->orderBy('id','desc'); // como que devuelve los comentarioso accede al modelo de los comentarios y trae los comentarios de esa imagen creo o algo asi parece que es no entendi mmuy bien 
    }

    //relacion one to many

    public function likes(){
        return $this->hasMany('App\Models\Like'); //aca tambein como que va a traer los likes que tiene cada foto o algo asi parece 
    }
    //relacion de muchos a uno //un mismo usuario tiene muchas imagenes o muchas imagenes son hechas por un usuario
    public function user(){
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
