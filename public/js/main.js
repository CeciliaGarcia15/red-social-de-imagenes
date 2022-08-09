var url = 'http://proyecto_laravel.test';
window.addEventListener("load", function(){
    //alert("La pagina esta completamente cargada!!");
    //$('body').css('background','red');

    $('.btn-like').css('cursor','pointer');
    $('.btn-dislike').css('cursor','pointer');

    //boton de like
    function like(){
        $('.btn-like').unbind('click').click(function(){
            console.log('like');
            $(this).addClass('btn-dislike').removeClass('btn-like');
            $(this).attr('src',url+'/img/heart-red.png');


            $.ajax({
                url: url+'/like/'+$(this).data('id'),
                type: 'GET',
                success:function(response){
                    if(response.like){
                        console.log('has dado like a la publicacion');
                    }else{
                        console.log('error al dar like');
                    }
                }
            });

            dislike();
        });
    }
    like();


    //boton de dislike
    function dislike(){
        $('.btn-dislike').unbind('click').click(function(){
            console.log('dislike');
            $(this).addClass('btn-like').removeClass('btn-dislike');
            $(this).attr('src',url+'/img/heart-black.png');

            $.ajax({
                url: url+'/dislike/'+$(this).data('id'),
                type: 'GET',
                success:function(response){
                    if(response.like){
                        console.log('has dado dislike a la publicacion');
                    }else{
                        console.log('error al dar dislike');
                    }
                }
            });


            like();
        });
    }
    dislike();

    //BUSCADOR
    //el #buscador viene del id del formulario nosotros nombramos buscador al id del formulario 
    $('#buscador').submit(function(e){
        $(this).attr('action', url+'/gente/'+$('#buscador #search').val());//en este osea en el formulario, en el atributo llamado action quiero que lo rellenes con lo que tiene la variable url  y a eso le concatenes /gente/ y a todo eso lo concatenes con lo que trae el id buscador y el id search y el .val no se que es
    });
});