<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="carrito col-md-3 col-sm-3">
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="row">
                <div id="tituloCarro" class="col-md-12 col-lg-12 col-sm-12 col-xs-10">
                    <fmt:message key="carrito" bundle="${lang}"/>
                </div>
                <div class="hidden-lg hidden-md hidden-sm col-xs-2">
                    <button class="cerrarCarroPeq pull-right">
                        <span class="glyphicon glyphicon-remove pull-right"></span>
                        <span class="oculto">Pulsa para cerrar el carrito</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="todoCarro">
        <div class="row">
            <div class="productsCar col-md-12 col-sm-12">

            </div>
        </div>
        <div class="row div-total">
            <div class="col-md-12 col-sm-12">
                <span class="pull-right"><fmt:message key="total" bundle="${lang}"/>: <span id="total">0</span> &euro;</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-9">
            <form action="purchase" id="formComprar" method="POST">
                <input id="inputCarro" name="inputCarro" type="hidden" value="">
                <div class="col-md-6 col-sm-12 col-xs-7">
                    <label for="nombreCLienteId"><fmt:message key="nombreCliente" bundle="${lang}"/></label>: <input id="nombreCLienteId" name="nombreCliente" type="text"/>
                </div>
                <div class="col-md-7 col-sm-12 col-xs-7">
                    <label for="direccionClienteId"><fmt:message key="direccionCliente" bundle="${lang}"/></label>: <input id="direccionClienteId" name="direccionCliente" type="text"/> 
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <button type="submit" id="botonComprar" class="pull-right" data-toggle="modal" data-target=".bs-example-modal-sm">
                        <span class="oculto"><fmt:message key="relleno" bundle="${lang}"/></span>  
                        <fmt:message key="comprar" bundle="${lang}"/>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>