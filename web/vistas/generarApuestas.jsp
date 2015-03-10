<%-- 
    Document   : generarApuestas
    Created on : 10-mar-2015, 3:28:45
    Author     : xtianrock
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="/vistas/menu.jsp" %>
        <h2>Generacion de apuestas en modo texto</h2>
        <h3>Apuestas generadas</h3>
           <% int nBoletos=Integer.parseInt(request.getParameter("boletos")); 
        for(int i=1;i<nBoletos+1;i++)
        {%> 
        <p>Boleto <%=i%></p>
         <%int nApuestas=Integer.parseInt(request.getParameter("apuesta"+i));
               for (int f=1;f<nApuestas+1;f++)
              {%>
                  Apuesta <%=f%>: 
                  <%for (int j=1;j<6;j++)
                   {%>
                   <%=aleatorio()%>
                   <%}%>
                  </br>
             <% }
              
         }%>
    </body>
</html>

<%! public int aleatorio()
{
    Random r = new Random();
    return  r.nextInt(49)+1; 
}%>