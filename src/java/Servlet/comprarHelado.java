package Servlet;

import Control.AccionesUsuario;
import Modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class comprarHelado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
           /*
            !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            SI NO SE ELIGE UNA UNA PRESENTACION VA A GENERERAR UN ERROR
            METER VALIDACION (TIENE QUE HABER SELECCIONADO AL MESNO UNA PRESENTACION)
            !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            */
            
           int id_helado, id_presentacion, cantidad, id_promocion, id_usuario;
            
           id_helado = Integer.parseInt(request.getParameter("id_heladoF"));
           id_presentacion = Integer.parseInt(request.getParameter("presentaciones"));
           cantidad = Integer.parseInt(request.getParameter("Cantidad"));
           id_promocion = Integer.parseInt(request.getParameter("promociones"));
           id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
           
           Helado h = new Helado();
           Presentaciones pre = new Presentaciones();
           Usuario u = new Usuario();
           Promociones pro = new Promociones();

           u.setId(id_usuario);
           h.setId(id_helado);
           pre.setId(id_presentacion);
           u.setCantidad_pedido(cantidad);
           pro.setId(id_promocion);
           
           int state = AccionesUsuario.agregarHeladoCC(h, pre, u, pro);
           
           if(state > 0){
               response.sendRedirect("Menu.jsp");
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
