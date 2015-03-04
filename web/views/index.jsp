<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="Bundles.lang" var="lang" scope="application"/>

<!DOCTYPE html>
<html lang="<fmt:message key="idioma" bundle="${lang}"/>">
    <head>
        <title>E-commerce</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:directive.include file="head.jsp"/>
    </head>
    <body>
    
    <div class="container-fluid">
    <div class="appWrapper">    
    
    <jsp:directive.include file="header.jsp"/>    
        
    <div class="row">
    
    <div class="productos col-md-9 col-sm-9">
        <div class="row">
            <div class="col-md-12 col-xs-9">
                <div class="row headerProductos">
                    <header class="col-md-11 col-sm-11 col-xs-12">
                        <h2><fmt:message key="productos" bundle="${lang}"/></h2>
                    </header>
                    <div class="hidden-xs col-md-1 col-sm-1">
                        <span class="cambiarVistaLista pull-right glyphicon glyphicon-align-justify"></span>
                        <span class="cambiarVistaCuad pull-right glyphicon glyphicon-th"></span>
                    </div>
                </div>
            </div>
            
            <div class="col-xs-3 hidden-sm hidden-md hidden-lg">
                <button class="pull-right iconoCarrito">
                    <span class="pull-right glyphicon glyphicon-shopping-cart"></span>
                </button>
            </div>
    
        </div>
        <div class="busqueda row">
            <div class="col-md-12">
                <p><fmt:message key="textoFiltrar" bundle="${lang}"/></p>
                <input type="text" id="buscaNombre" name="buscaNombre">
                <button id="botonBuscar"><fmt:message key="buscar" bundle="${lang}"/></button>
                <button id="botonMostrarTodo"><fmt:message key="todosProductos" bundle="${lang}"/></button>
            </div>
        </div>
        
        <div class="divProdu row">
            <jsp:directive.include file="allProducts.jsp"/>
        </div>
        
    </div>
       
    <!-- Carrito para pantallas más grandes -->
        <jsp:directive.include file="carrito.jsp"/>
    </div>
    
        <jsp:directive.include file="footer.jsp"/>
    
    </div>
    
    <!-- Carrito para pantallas pequeñas -->
    <jsp:directive.include file="carrito.jsp"/>
    
    
    <!-- Modal al realizar la compra-->
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
              <h4>Compra realizada</h4>
              <div class="carritoModal">
                  
              </div>
          </div>
        </div>
      </div>
    
    </div>        
    
    </body>
</html>
