package Servlet;

import Control.AccionesUsuario;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class editarDatosUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int edad, id_usuario;
            String nombre, appat, apmat, user, nacimiento, tel_par, tel_cel, domicilio, passwd;
            
            id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            edad = Integer.parseInt(request.getParameter("edad"));
            nombre = request.getParameter("nombre");
            appat = request.getParameter("appat");
            apmat = request.getParameter("apmat");
            user = request.getParameter("usuario");
            nacimiento = request.getParameter("fecha_de_nacimiento");
            tel_par = request.getParameter("telefono_Particular");
            tel_cel = request.getParameter("telefono_Celular");
            domicilio = request.getParameter("domicilio");
            passwd = request.getParameter("verificarContrasena");
            System.out.println(id_usuario);
            System.out.println(edad);
            System.out.println(nombre);
            System.out.println(appat);
            System.out.println(apmat);
            System.out.println(user);
            System.out.println(nacimiento);
            System.out.println(tel_par);
            System.out.println(tel_cel);
            System.out.println(domicilio);
            System.out.println(passwd);
            
            Usuario u = new Usuario();
            
            u.setId(id_usuario);
            u.setNombre(nombre);
            u.setAppat(appat);
            u.setApmat(apmat);
            u.setUser(user);
            u.setEdad(edad);
            u.setNacimiento(nacimiento);
            u.setTel_par(tel_par);
            u.setTel_cel(tel_cel);
            u.setDomicilio(domicilio);
            u.setPass(passwd);
            
            int state = AccionesUsuario.editarDatosPersonales(u);
            
            if(state > 0){
                response.sendRedirect("Cuenta.jsp");
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
