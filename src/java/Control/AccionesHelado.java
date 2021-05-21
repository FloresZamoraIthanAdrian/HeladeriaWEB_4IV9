package Control;

import java.sql.*;
import java.util.*;
import Modelo.Helados;

public class AccionesHelado {
    
    public static int agregarHelado(Helados h){
        
        int state = 0;
        
        try{
            
            Connection con = Conexion.getConnection();
            
            String q = "insert into inventario (nombreH, precio, precioMayoreo, cantidadGeneral)"
                    + "values(?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, h.getHelado());
            ps.setInt(2, h.getPrecio());
            ps.setInt(3, h.getPrecioMayoreo());
            ps.setInt(4, h.getCantidadGeneral());
            
            state = ps.executeUpdate();
            System.out.println("Registro exitoso");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al agregar helado");
            System.out.println(ed.getMessage());
        }
        return state;
        
    }
    
    public static int editarHelado(Helados h){
        
        int state = 0;
        
        try{
            
            Connection con = Conexion.getConnection();
            
            String q = "update inventario set nombreH = ?, precio = ?, precioMayoreo = ?, cantidadGeneral = ?"
                    + " where idH = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, h.getHelado());
            ps.setInt(2, h.getPrecio());
            ps.setInt(3, h.getPrecioMayoreo());
            ps.setInt(4, h.getCantidadGeneral());
            ps.setInt(5, h.getId());
            
            state = ps.executeUpdate();
            System.out.println("Los datos del helado se editaron correctamente");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al editar los datos del helado");
            System.out.println(ed.getMessage());
        }
        return state;
    }
    
    public static Helados buscarHeladoById(int id){
        
        Helados h = new Helados();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from inventario where idH = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                h.setId(rs.getInt(1));
                h.setHelado(rs.getString(2));
                h.setPrecio(rs.getInt(3));
                h.setPrecioMayoreo(rs.getInt(4));
                h.setCantidadGeneral(rs.getInt(5));
            }
            
            System.out.println("Consulta del helado exitoso");
            con.close();
        }catch(Exception ed){
            System.out.println("Error a la consulta un helado");
            System.out.println(ed.getMessage());
        }
        return h;
    }
    
    public static int borrarHelado(int id){
        
        int state = 0;
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "delete from inventario where idH = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            state = ps.executeUpdate();
            System.out.println("Se elimino el helado con exito");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al borrar el helado");
            System.out.println(ed.getMessage());
        }
        return state;
    }

    public static List<Helados> listarHelados() {

        List<Helados> lista = new ArrayList<Helados>();

        try {

            Connection con = Conexion.getConnection();
            String q = "select * from inventario";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Helados h = new Helados();

                h.setId(rs.getInt(1));
                h.setHelado(rs.getString(2));
                h.setPrecio(rs.getInt(3));
                h.setPrecioMayoreo(rs.getInt(4));
                h.setCantidadGeneral(rs.getInt(5));
                lista.add(h);

            }

            System.out.println("Consulta de inventario exitosa");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al listar los helados");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

}
