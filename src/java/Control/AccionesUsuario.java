package Control;

import Modelo.Usuario;
import java.sql.*;

public class AccionesUsuario {

    public static int registrarUsuario(Usuario u){
        
        int state = 0;
        
        try{ 
            
            Connection con = Conexion.getConnection();
            
            String q = "insert into registro(nom_usu, appat_usu, appmat_usu, usu, "
                    + "edad_usu, fecha, telp_usu, telc_usu, domicilio, cont_usu)"
                    + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getAppat());
            ps.setString(3, u.getApmat());
            ps.setString(4, u.getUser());
            ps.setInt(5, u.getEdad());
            ps.setString(6, u.getNacimiento());
            ps.setString(7, u.getTel_par());
            ps.setString(8, u.getTel_cel());
            ps.setString(9, u.getDomicilio());
            ps.setString(10, u.getPass());
            System.out.println(u.getPass());
            
            state = ps.executeUpdate();
            System.out.println("Registro de usuario exitoso");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al registrar usuario");
            System.out.println(ed.getMessage());
        }
        return state;
    }
    
}
