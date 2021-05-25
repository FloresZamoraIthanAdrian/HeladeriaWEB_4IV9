package Servlet;

import Control.AccionesHelado;
import Control.AccionesPromociones;
import Modelo.Helado;
import Modelo.Presentaciones;
import Modelo.Promociones;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class agregarHelado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int id, precio;
            String nombreH;
            String pre1, pre2, pre3, pre4, pre5;
            String p1, p2, p3, p4, p5, p6;

            nombreH = request.getParameter("nombreHelado");
            precio = Integer.parseInt(request.getParameter("precio100gr"));
            pre1 = request.getParameter("Cono");
            pre2 = request.getParameter("Cubeta");
            pre3 = request.getParameter("Bote de helado");
            pre4 = request.getParameter("Barquillo");
            pre5 = request.getParameter("Vaso");
            p1 = request.getParameter("2 X 1 (Todas las presentaciones)");
            p2 = request.getParameter("3 X 1 (Todas las presentaciones)");
            p3 = request.getParameter("A partir de $1000 se obtiene un descuento de 30%");
            p4 = request.getParameter("A partir de $10000 se obtiene un descuento de 50%");
            p5 = request.getParameter("A partir de $200 se obtiene un descuento de 10%");
            p6 = request.getParameter("A partir de $600 se obtiene un descuento de 20%");
            
            Helado h = new Helado();
            Promociones pro = new Promociones();
            Presentaciones pre = new Presentaciones();
            
            h.setNombre(nombreH);
            h.setIdprecio(precio);
            
            pre.setPre1(pre1);
            pre.setPre2(pre2);
            pre.setPre3(pre3);
            pre.setPre4(pre4);
            pre.setPre5(pre5);

            pro.setNombreHP(nombreH);
            pro.setP1(p1);
            pro.setP2(p2);
            pro.setP3(p3);
            pro.setP4(p4);
            pro.setP5(p5);
            pro.setP6(p6);
            
            int state = AccionesHelado.agregarHelado(h, pro, pre);
            
            if (state > 0) {
                response.sendRedirect("Administrador.jsp");
            } else {
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
