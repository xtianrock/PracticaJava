<%-- 
    Document   : boletos1
    Created on : 09-mar-2015, 16:29:11
    Author     : 2DAWT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%  
            // Obtenemos información que nos ha pasado el servlet para ello
            // utilizamos los métodos getAttribute/setAttribute
            // Como lo que se almacena es de tipo Object hay que convertirlo
            // al tipo original. Podría ser otro tipo (int), otra clase, etc.
           
            
             String errorBoleto=(String) request.getAttribute("error_boleto");            
            out.write(errorBoleto);
        %>
        <form method="post">
                <label for="boletos">Boletos: </label>
                <input type="text" name="boletos" value="<%= request.getParameter("boletos") == null ? "" : request.getParameter("boletos") %>"/>
                <button type="submit" name="continuar" >Continuar</button>              
            </form>
    </body>
</html>
