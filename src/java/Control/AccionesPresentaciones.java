package Control;

import Modelo.Presentaciones;
import Modelo.Promociones;
import java.sql.*;
import java.util.*;

public class AccionesPresentaciones {

    public static List<Presentaciones> listarPresentaciones(){
        
        List<Presentaciones> lista = new ArrayList();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from Cpresentacion";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();
            
            
            while (rs.next()) {

                Presentaciones pp = new Presentaciones();

                pp.setId(rs.getInt(1));
                pp.setPresentacion(rs.getString(2));
                pp.setPrecioPresentacion(rs.getInt(3));
                pp.setCantidad_presentacion(rs.getInt(4));
                lista.add(pp);

            }

            //System.out.println("Consulta de presentaciones exitosa");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al listar las presentaciones");
            System.out.println(ed.getMessage());
        }
        return lista;
    }
    
    public static Presentaciones buscarPresentacionesDisponibles(int id){
        
        Presentaciones pre = new Presentaciones();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from cpresentaciones_a where id_presentacion_a = ? ";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                pre.setId(rs.getInt(1));
                pre.setPre1(rs.getString(2));
                pre.setPre2(rs.getString(3));
                pre.setPre3(rs.getString(4));
                pre.setPre4(rs.getString(5));
                pre.setPre5(rs.getString(6));
            }
            
            //System.out.println("Error al listar presentaciones disponibles");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al listar presentaciones");
            System.out.println(ed.getMessage());
        }
        return pre;
    }
 
    public static Presentaciones buscarPresentacionId(int id_Presentacion){
        
        Presentaciones pre = new Presentaciones();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select tipo_presentacion from cpresentacion where id_presentacion = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_Presentacion);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                pre.setPresentacion(rs.getString(1));
            }
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al buscar la promocion");
            System.out.println(ed.getMessage());
        }
        return pre;
    }
    
}
