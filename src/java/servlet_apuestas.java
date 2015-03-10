/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import java.util.Enumeration;
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
@WebServlet(urlPatterns = {"/apuestas"})
public class servlet_apuestas extends HttpServlet {

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
         String botonEnviar=request.getParameter("continuar2");
          RequestDispatcher dispatcher;
         if (botonEnviar==null) {            
           dispatcher =request.getRequestDispatcher("/vistas/apuestas.jsp"); 
           dispatcher.forward(request, response);
        }
        else {
          int contador=1;
        
          for(int i=1;i<parseInt(request.getParameter("boletos"))+1;i++)
          {            
              out.println(request.getParameter("apuesta"+i));
                  if(!isInteger(request.getParameter("apuesta"+i)))
                  {
                    request.setAttribute("error_boleto"+i, 
                    "<div style=\"color:red\">El boleto "+i+" no contiene una apuesta valida.</div>");
                    dispatcher =request.getRequestDispatcher("/vistas/apuestas.jsp"); 
                    dispatcher.forward(request, response); 
                  }   
          }          
           dispatcher =request.getRequestDispatcher("/vistas/generarApuestas.jsp"); 
           dispatcher.forward(request, response); 
           
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
     
    public static boolean isInteger(String s) {
    try { 
        Integer.parseInt(s); 
    } catch(NumberFormatException e) { 
        return false; 
    }
    // only got here if we didn't return false
    return true;
}
}
