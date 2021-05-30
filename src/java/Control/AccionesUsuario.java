package Control;

import Modelo.*;
import java.sql.*;
import java.util.*;

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
            //System.out.println("Registro de usuario exitoso");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al registrar usuario");
            System.out.println(ed.getMessage());
        }
        return state;
    }
    
    public static Usuario buscarUsuarioId(int id_usu){
        
        Usuario u = new Usuario();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from mUsuario where id_usuario = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_usu);
            
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
            
            //System.out.println("Exito al buscar el helado por el ID");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al buscar el helado por el id");
            System.out.println(ed.getMessage());
        }
        return u;
        
    }
    
    public static int agregarHeladoCC(Helado h, Presentaciones pre, Usuario u, Promociones pro){
        
        int state = 0;
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "{call agregarHeladoCC__nwn__3(?, ?, ?, ?, ?)}";            
            
            CallableStatement proc = con.prepareCall(q);
            proc.setInt(1, h.getId());
            proc.setInt(2, pre.getId());
            proc.setInt(3, u.getCantidad_pedido());
            proc.setInt(4, pro.getId());
            proc.setInt(5, u.getId());
            
            state = proc.executeUpdate();
            //System.out.println("Se agrego el helado al carrito de manera correcta");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Hubo un error al agregar el helado al carrito del usuario");
            System.out.println(ed.getMessage());
        }
        
        return state;
    }
    
    public static List<Pedido> listarCarritoUsuario(int id_usu){
        
        List<Pedido> listaPedido = new ArrayList<Pedido>();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select id_compra, id_producto, id_promocion, id_presentacion, cantidad_p, subtotal "
                    + " from dcompra where id_ecompra = ? ";
            
            PreparedStatement ps = con.prepareCall(q);
            
            ps.setInt(1, id_usu);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                Pedido p = new Pedido();
                
                p.setId_pedido(rs.getInt(1));
                p.setId_producto(rs.getInt(2));
                p.setId_promocion(rs.getInt(3));
                p.setId_presentacion(rs.getInt(4));
                p.setCantidad(rs.getInt(5));
                p.setSubtotal(rs.getDouble(6));
                listaPedido.add(p);
                
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al listar el carrito del usuario");
            System.out.println(ed.getMessage());
        }
        
        return listaPedido;
    }
    
    public static int borrarDelCarrito(int id_Pedido, int id_Usuario){
        
        int state = 0;
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "{call borrarHeladoCarritounu (?, ?)}";

            CallableStatement proc = con.prepareCall(q);
            proc.setInt(1, id_Pedido);
            proc.setInt(2, id_Usuario);
            
            state = proc.executeUpdate();
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al borrar el helado del carrito");
            System.out.println(ed.getMessage());
        }
        
        return state;
    }
    
}
