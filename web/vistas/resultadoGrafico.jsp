<%-- 
    Document   : resultadoGrafico
    Created on : 10-mar-2015, 17:41:41
    Author     : 2DAWT
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
        <link href="../estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="/vistas/menu.jsp" %>
        <h2>Generacion de apuestas en modo grafico</h2>
        <h3>Apuestas generadas</h3>
        <% ArrayList<Boleto> boletos =(ArrayList<Boleto>)request.getAttribute("boletos");
            int total = 0;
            for (Boleto boleto: boletos){%> 
        <div class="boleto" style="display:inline-block; width: 100%">
            <%int nApuestas = boleto.getnApuestas();
               for (int f = 0; f < nApuestas; f++) {
                total++;
            int apuesta[]=boleto.getApuesta();%>             
            <table border="1" class="apuesta" style="float:left" >
                <%for (int k = 0; k < 10; k++) {%>
                <tr>
                     <%= indexOf(apuesta,k) ? "<td style='background-color:#99ffcc'>": "<td>" %><%= k == 0 ? f+1 : k%></td>
                    <%= indexOf(apuesta,Integer.parseInt("1"+k)) ? "<td style='background-color:#99ffcc'>": "<td>" %><%="1"+k%></td> 
                    <%= indexOf(apuesta,Integer.parseInt("2"+k)) ? "<td style='background-color:#99ffcc'>": "<td>" %><%="2" + k%></td>
                    <%= indexOf(apuesta,Integer.parseInt("3"+k)) ? "<td style='background-color:#99ffcc'>": "<td>" %><%="3" + k%></td>
                    <%= indexOf(apuesta,Integer.parseInt("4"+k)) ? "<td style='background-color:#99ffcc'>": "<td>" %><%="4" + k%></td>
                </tr>
                <%}%>
            </table>
            <%}%>
        </div>
        <div style="float:none">
             <p id="reintegro">Reintegro: <%=boleto.getReintegro()%></p>             
        <p id="importeBoleto">Importe boleto: <%=nApuestas%> €</p>
        </div>       
         </br>
        <%}%>         
        <p id="total">El importe <b>total</b> que debe abonar es de: <%=total%>€</p>
    </body>
</html>

    
    <%!public boolean indexOf(int[] arr, int targetValue) {
	for(int s: arr){
		if(s == targetValue)
			return true;
	}
	return false;
}%>