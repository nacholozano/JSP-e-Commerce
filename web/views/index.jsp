<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>E-commerce</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:directive.include file="head.jsp"/>
    </head>
    <body>
    
    <div class="appWraper container-fluid">
        
    <jsp:directive.include file="header.jsp"/>    
        
    <div class="row">
    
    <div class="productos col-md-9">
        
        <h2>Productos</h2>
        <div class="busqueda row">
            <div class="col-md-12">
                <p>Filtrar búsqueda</p>
                <input type="text" id="buscaNombre" name="buscaNombre">
                <button id="botonBuscar">Buscar</button>
                <button id="botonMostrarTodo">Mostrar todos los productos</button>
            </div>
        </div>
        
        <div class="divProdu row">
            <jsp:directive.include file="allProducts.jsp"/>
        </div>
        
    </div>
       
    <jsp:directive.include file="carrito.jsp"/>
    
    </div>
    
    </div>        
    
    </body>
</html>