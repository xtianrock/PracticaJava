<%-- 
    Document   : generarApuestas
    Created on : 10-mar-2015, 3:28:45
    Author     : xtianrock
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="cris.Boleto" %>
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
           <% ArrayList<Boleto> boletos =(ArrayList<Boleto>)request.getAttribute("boletos");
            int total = 0;
            for (int i=0; i<boletos.size();i++){%>
        <p><b>Boleto <%=i+1%></b></p>
         <%int nApuestas=boletos.get(i).getnApuestas();
               for (int f=1;f<nApuestas+1;f++)
              {
                  total++;
         int[]apuestas=boletos.get(i).getApuesta();%>
                  <p id="apuesta">Apuesta <%=f%>: 
                  <%for (int j=1;j<6;j++)
                   {%>
                   <%=apuestas[j]%>
                   <%}%>
                  </p>                   
            <%}%>
             <p id="reintegro">Reintegro: <%=boletos.get(i).getReintegro()%></p>             
             <p id="importeBoleto">Importe boleto: <%=nApuestas%> €</p>
         <%}%>         
         <p id="total">El importe <b>total</b> que debe abonar es de: <%=total%>€</p>
    </body>
</html>

