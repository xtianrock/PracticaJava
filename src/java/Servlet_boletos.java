/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 2DAWT
 */
@WebServlet(urlPatterns = {"/boletos"})
public class Servlet_boletos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String botonEnviar=request.getParameter("continuar");
          RequestDispatcher dispatcher;
       // response.sendRedirect("www.google.com");
        if (botonEnviar==null) {            
            dispatcher =request.getRequestDispatcher("/vistas/boletos.jsp"); 
            dispatcher.forward(request, response);
        }
        else {
            int nBoletos=0;
            try {
                 nBoletos=parseInt(request.getParameter("boletos"));               
                
            } catch (Exception e) {
                 request.setAttribute("error_boleto", 
                    "<div style=\"color:red\">Boletos debe contener un numero entero.</div>");
                  dispatcher =request.getRequestDispatcher("/vistas/boletos.jsp"); 
                  dispatcher.forward(request, response);            
            }            
          
                  if(nBoletos<1||nBoletos>10) {
                  request.setAttribute("error_boleto", 
                    "<div style=\"color:red\">Boletos debe ser un numero entre 1 y 10</div>");
                   dispatcher =request.getRequestDispatcher("/vistas/boletos.jsp");                 
                  }
                  else
                  {
                     request.setAttribute("nBoletos",nBoletos);
                     dispatcher =request.getRequestDispatcher("/apuestas");                  
                  }   
             dispatcher.forward(request, response);
            // Redirigimos petición a página JSP -> form_servlet_procesado.jsp
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
