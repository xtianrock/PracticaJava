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

        <% int nBoletos = Integer.parseInt(request.getParameter("boletos"));%>
        <p>Se juegan <%=nBoletos%> boletos</p>
        <form method="post">
            <%
                 for (int i = 1; i < nBoletos + 1; i++) {%>
            <p><%= request.getAttribute("error_boleto" + i) == null ? "" : request.getAttribute("error_boleto" + i)%></p>
            <label for="apuesta<%=i%>">Boleto <%=i%> - Nº apuestas: </label>
            <select name="apuesta<%=i%>">
                <option value="seleccione">Seleccione</option>
                <% for (int f = 1; f < 9; f++) {
                        int nApuestas;
                        try {
                            nApuestas = Integer.parseInt(request.getParameter("apuesta" + i));
                        } catch (NumberFormatException e) {
                            nApuestas = 0;
                        }
                  //if(request.getParameter("apuesta"+i)!=null)

                        if (nApuestas == f) {%>
                <option value="<%=f%>" selected><%=f%></option>
                <%} else {%>
                <option value="<%=f%>"><%=f%></option>

                <%}
                } %>
            </select>
            </br></br>

            <%}
            %>
            <button type="submit" name="continuar2">Continuar</button>      
        </form>       
    </body>
</html>
