package Servlet;

import Control.AccionesTarjeta;
import Modelo.Tarjeta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class agregarTarjeta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int id_tarjeta, id_tipot;
            String titular, num_tarjeta, mes, year, cvv;
            
            id_tarjeta = Integer.parseInt(request.getParameter("id_usuario"));
            id_tipot = Integer.parseInt(request.getParameter("tipoTarheta"));
            titular = request.getParameter("titular");
            num_tarjeta = request.getParameter("numTarjeta");
            mes = request.getParameter("mesVencimiento");
            year = request.getParameter("yearVencimiento");
            cvv = request.getParameter("cvv");
            
            Tarjeta t = new Tarjeta();
            t.setId_tarjeta(id_tarjeta);
            t.setId_tipot(id_tipot);
            t.setTitular(titular);
            t.setNum_tarjeta(num_tarjeta);
            t.setMes(mes);
            t.setYear(year);
            t.setCvv(cvv);
            
            int state = AccionesTarjeta.agregarTarjeta(t);
            
            if(state > 0){
                response.sendRedirect("CRUDTarjetas.jsp");
            }else{
                response.sendRedirect("error.html");
            }
            
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
