package Control;

import Modelo.Presentaciones;
import Modelo.Promociones;
import java.sql.*;
import java.util.*;

public class AccionesPromociones {

    public static List<Promociones> listarPromociones(){
        
        List<Promociones> lista = new ArrayList();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from Cpromocion";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();
            
            
            while (rs.next()) {

                Promociones p = new Promociones();

                p.setId(rs.getInt(1));
                p.setPromocion(rs.getString(2));
                lista.add(p);

            }

            System.out.println("Consulta de promociones exitosa");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al listar las promociones");
            System.out.println(ed.getMessage());
        }
        return lista;
    }
    
    public static Promociones buscarPromocionesDisponibles(int id){
        
        Promociones prom = new Promociones();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from cpromociones_a where id_promociones_a = ? ";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                prom.setId(rs.getInt(1));
                prom.setP1(rs.getString(2));
                prom.setP2(rs.getString(3));
                prom.setP3(rs.getString(4));
                prom.setP4(rs.getString(5));
                prom.setP5(rs.getString(6));
                prom.setP6(rs.getString(7));
            }
            
            System.out.println("Error al listar promociones disponibles");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al listar presentaciones");
            System.out.println(ed.getMessage());
        }
        return prom;
    }
    
}
