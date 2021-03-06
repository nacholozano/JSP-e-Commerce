$(document).ready(function(){

    var productosCarrito = [];
    var encontrado = false; 
    
    if( localStorage.getItem("carrito") !== null ){
        var carro2 = localStorage.getItem("carrito");
        $('.todoCarro').html(carro2); 
    }   
    
    // Añadir productos del carrito --------------
    
    $(document).on('click','.añadir',function(){
        
        var producto = this.name;
        if( $('.ProCar[name|="'+producto+'"]').length > 0 ){
            
            // Obtener datos
            var stringPrecio = $('.cuantia[data-name|="'+producto+'"]').html();
            
            var id = parseInt($('.id[name|="'+producto+'"]').val());
            var cantidad = parseInt($('div.cantProCar[data-name|="'+producto+'"]').html());
            var precio = parseInt( stringPrecio.slice(1,stringPrecio.length-1) );
            var cantidadPlus = parseInt($('.cantidad[name|="'+producto+'"]').val());
            var total = parseInt($('#total').html()); 

            // Cambiar la cantidad en la vista
            $('.cantProCar[name|="'+producto+'"]').html(cantidad+cantidadPlus);
            $('input.cantProCar[name|="'+producto+'"]').val(cantidad+cantidadPlus);
            $('#total').html( total + (precio*cantidadPlus) );
            
            var carro = $('.todoCarro').html();
            localStorage.setItem("carrito",carro);
            
        }else{
            // Obtener datos
            var stringPrecio = $('.cuantia[data-name|="'+producto+'"]').html();
            
            var id = parseInt($('.id[name|="'+producto+'"]').val());
            var nombre = $('.nombre[data-name|="'+producto+'"]').html();
            var cantidad = parseInt($('.cantidad[name|="'+producto+'"]').val());
            var precio = parseInt(stringPrecio.slice(1,stringPrecio.length-1));
            var total = parseInt($('#total').html());
           
            // Visualizar producto comprado
            $('.productsCar').append(
            '<div class="ProCar row" name="'+nombre+'">'
                +'<input type="hidden" class="idProCar" value="'+id+'"/>'
                +'<input type="hidden" name="'+nombre+'" class="cantProCar" value="'+cantidad+'"/>'
                +'<div class="col-md-12">'
                +'<div class="row">'
                    +'<div class="nombreProCar col-md-12">'
                    +nombre
                    +'</div>'
                +'</div>'
                +'<div class="row infoCompraPro">'
                    +'<div class="col-md-12">'
                        +'<div class="precioProCar pull-left" name="'+nombre+'">'
                        +precio
                        +'</div>'
                        +'<span class="pull-left">x</span>'
                        +'<div class="cantProCar pull-left" name="'+nombre+'">'
                        +cantidad
                        +'</div>'
                        +'<button id="borrarProduc" name="'+nombre+'" class="pull-right glyphicon glyphicon-remove">\n\
                            <span class="oculto">Pulsa para borrar este producto</span>\n\
                         </button>'
                    +'</div>'
                +'</div>'
                +'</div>'
            +'</div>');

            $('#total').html(total + (precio*cantidad));
            
            var carro = $('.todoCarro').html();
            localStorage.setItem("carrito",carro);
            
        }
    });
    
    // Borrar productos del carrito ----------
    
    $(document).on('click','#borrarProduc',function(){
        
        var producto = this.name;
        var id = parseInt($('.id[name|="'+producto+'"]').val());
        var precio = parseInt($('.precioProCar[name|="'+producto+'"]').html());
        var cantidad = parseInt($('div.cantProCar[name|="'+producto+'"]').html());
        var total = parseInt($('#total').html()); 

        $('.ProCar[name|="'+producto+'"]').remove();
        $('#total').html( total - (precio*cantidad) );
        
        var carro = $('.todoCarro').html();
        localStorage.setItem("carrito",carro);
    
    });
   
   // Mostrar carrito cuando la pantalla es pequeña ------------
   
    var iconoCar = $('.iconoCarrito');
    var carrito = $('.carrito');
    var appWrapper = $('.appWrapper');

    iconoCar.click(function(){
       carrito.show();
       carrito.addClass('carroSmart');
    });
    
    var iconoCerrarCarro = $('.cerrarCarroPeq');
    
    iconoCerrarCarro.click(function(){
       carrito.hide();
       carrito.removeClass('carroSmart');
    });
    
    // Mover carrito en pantallas pequeñas
    
    var header = $(".header");
    var header_h = header.height(); 
    var headerPro = $('.headerProductos');
    var headerPro_h = headerPro.height();
    
    var carro = $('.productos>.row>.hidden-sm');
    var carroCajon = $('.carrito');
    
    $(document).on('scroll',function(){
        if ($('body').scrollTop() > header_h ){
            carro.css('position','fixed');
            carro.css('top','0');
            carroCajon.css('position','fixed');
            carroCajon.css('top','0');
        }else{
            carro.css('position','absolute');
            carro.css('top','');
            carroCajon.css('position','absolute');
            carroCajon.css('top','70px');
        }
    });

    // Realizar pedido
    
    $('#formComprar').on('submit',function(e){
        
        var producto;
        
        $('.idProCar').each(function(it, elementDOM) {
            producto = { id: parseInt(elementDOM.value) ,cantidad:""};
            productosCarrito.push(producto);
        });

        $('input.cantProCar').each(function(it, elementDOM) {
            productosCarrito[it].cantidad = parseInt(elementDOM.value);
        });
        
        //Paso la tabla de JSON
        var jsonArray = {info:productosCarrito};
        var elementos = JSON.stringify(jsonArray);

        localStorage.removeItem("carrito");
        
        $('#inputCarro').val( elementos );
        
        $.ajax({
            url: "purchase",
            type: "POST",
            data: $(this).serialize(),

            success: function(){
                $('.carritoModal').html( 'Total: '+$('#total').html()+' €' );
                $('.productsCar').empty();
                $('input[name|=nombreCliente]').val('');
                $('input[name|=direccionCliente]').val('');
                $('#total').html( 0 );
            }
            
        });
        e.preventDefault();
        return false;
    });
    
});


