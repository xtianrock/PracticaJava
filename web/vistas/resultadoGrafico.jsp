<%-- 
    Document   : resultadoGrafico
    Created on : 10-mar-2015, 17:41:41
    Author     : 2DAWT
--%><%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@page import="java.util.Random"%>


<%@page import="java.util.Random"%>
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
        <% int nBoletos = Integer.parseInt(request.getParameter("boletos"));
            int total = 0;
            for (int i = 1; i < nBoletos + 1; i++) {%> 
        <div class="boleto">
            <%int nApuestas = Integer.parseInt(request.getParameter("apuesta" + i));
                for (int f = 0; f < 8; f++) {
            int apuesta[]=aleatorios();%>  
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
        <p id="reintegro">Reintegro: <%=reintegro()%></p>             
        <p id="importeBoleto">Importe boleto: <%=nApuestas%> €</p>
        <%}%>         
        <p id="total">El importe <b>total</b> que debe abonar es de: <%=total%>€</p>
    </body>
</html>



<%! public int reintegro() {
        Random r = new Random();
        return r.nextInt(9) + 1;
    }%>
    
    
       <%!public int[] aleatorios() {
        int[] aleatorios = new int[6];
        
        for (int i = 0; i < aleatorios.length; i++) {
            Boolean existe = true;
            int numero;
               Random r = new Random();         
            do {
                numero =  r.nextInt(49) + 1;
                if (! this.indexOf(aleatorios, numero)) {
                    existe = false;
                }
            } while (existe);
            aleatorios[i] = numero;
            
        }
        
        return aleatorios;
    }%>
    
    <%!public boolean indexOf(int[] arr, int targetValue) {
	for(int s: arr){
		if(s == targetValue)
			return true;
	}
	return false;
}%>