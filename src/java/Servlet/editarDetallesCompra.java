package Servlet;

import Modelo.Helado;
import Modelo.Pedido;
import Modelo.Presentaciones;
import Modelo.Promociones;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class editarDetallesCompra extends HttpServlet {

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
            int id_usuario, id_pedido, id_producto, cantidad, id_promocion, id_presentacion;

            id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
            id_producto = Integer.parseInt(request.getParameter("id_producto"));
            cantidad = Integer.parseInt(request.getParameter("Cantidad"));
            id_promocion = Integer.parseInt(request.getParameter("promociones"));
            id_presentacion = Integer.parseInt(request.getParameter("presentaciones"));

            Helado h = new Helado();
            Presentaciones pre = new Presentaciones();
            Usuario u = new Usuario();
            Promociones pro = new Promociones();
            Pedido ped = new Pedido();

            u.setId(id_usuario);
            h.setId(id_producto);
            pre.setId(id_presentacion);
            u.setCantidad_pedido(cantidad);
            pro.setId(id_promocion);

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
