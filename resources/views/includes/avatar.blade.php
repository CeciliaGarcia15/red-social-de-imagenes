 <!--MUESTRA LA IMAGEN QUE ESTA GUARDADA EN LA DB PARA ESE USUARIO-->
 @if(Auth::user()->image)
    <div class="container-avatar">
        <img src="{{ route('user.avatar',['filename'=>Auth::user()->image])}}" class="avatar">
    </div>
@endif