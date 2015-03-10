<%-- 
    Document   : boletos1
    Created on : 09-mar-2015, 16:29:11
    Author     : 2DAWT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/estilos.css" type="text/css">
    </head>
    <body>

          <%@include file="/vistas/menu.jsp" %>
        <h2>Generacion de apuestas en modo texto</h2>
        
        <form method="post">
                <p style="color:red"><%=request.getAttribute("error_boleto")==null ? "" : request.getAttribute("error_boleto")%></p>
                <label for="boletos">Boletos: </label>
                <input type="text" name="boletos" value="<%= request.getParameter("boletos") == null ? "" : request.getParameter("boletos") %>"/>
                <button type="submit" name="continuar" >Continuar</button>              
            </form>
    </body>
</html>
