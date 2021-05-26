package Control;

import Modelo.Usuario;
import java.sql.*;

public class AccionesUsuario {

    public static int registrarUsuario(Usuario u){
        
        int state = 0;
        
        try{ 
            
            Connection con = Conexion.getConnection();
            
            String q = "insert into mUsuario(nom_usu, appat_usu, appmat_usu, usu, "
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
            
            state = ps.executeUpdate();
            System.out.println("Registro de usuario exitoso");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al registrar usuario");
            System.out.println(ed.getMessage());
        }
        return state;
    }
    
    public static Usuario buscarUsuarioId(int id){
        
        Usuario u = new Usuario();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from mUsuario where id_usuario = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                u.setId(rs.getInt(1));
                u.setNombre(rs.getString(2));
                u.setAppat(rs.getString(3));
                u.setApmat(rs.getString(4));
                u.setUser(rs.getString(5));
                u.setEdad(rs.getInt(6));
                u.setNacimiento(rs.getString(7));
                u.setTel_par(rs.getString(8));
                u.setTel_cel(rs.getString(9));
                u.setDomicilio(rs.getString(10));
                u.setPass(rs.getString(11));
            }
            
            System.out.println("Exito al buscar el helado por el ID");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al buscar el helado por el id");
            System.out.println(ed.getMessage());
        }
        return u;
        
    }
    
}
