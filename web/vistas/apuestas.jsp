<%--
    Document   : apuestas
    Created on : 09-mar-2015, 19:39:14
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
        <%@include file="/vistas/menu.jsp" %>
        <h2>Generacion de apuestas en modo texto</h2>
        
        <% int nBoletos=Integer.parseInt(request.getParameter("boletos"));%>
        <p>Se juegan <%=nBoletos%> boletos</p>
        <%
        for(int i=0;i<nBoletos;i++)
        { %>
          <label for="apuesta <%=i%>">Boleto <%=i%> - Nº apuestas: </label>
          <select name="apuesta <%=i%>">
              <% for (int f=1;f<7;f++)
              { %>
              <option value="<%=f%>"><%=f%></option>
            <%} %>
          </select>
          </br></br>
        <%}
        %>
      
    </body>
</html>
