package Control;

import Modelo.Helado;
import Modelo.Presentaciones;
import Modelo.Promociones;
import java.sql.*;
import java.util.*;

public class AccionesHelado {

    public static int agregarHelado(Helado h, Promociones prom, Presentaciones pre){
        
        int state = 0;
        
        try{ 
            
            Connection con = Conexion.getConnection();
            
            String q = "{call AgregarHeladoD(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            
            CallableStatement proc = con.prepareCall(q);
            
            proc.setString(1, h.getNombre());
            proc.setInt(2, h.getIdprecio());
            proc.setString(3, prom.getP1());
            proc.setString(4, prom.getP2());
            proc.setString(5, prom.getP3());
            proc.setString(6, prom.getP4());
            proc.setString(7, prom.getP5());
            proc.setString(8, prom.getP6());
            proc.setString(9, pre.getPre1());
            proc.setString(10, pre.getPre2());
            proc.setString(11, pre.getPre3());
            proc.setString(12, pre.getPre4());
            proc.setString(13, pre.getPre5());
            
            state = proc.executeUpdate();
            System.out.println("Registro de helado exitoso");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al registrar helado");
            System.out.println(ed.getMessage());
        }
        return state;
    }
    
    public static List<Helado> listarHelados() {

        List<Helado> lista = new ArrayList<Helado>();

        try {

            Connection con = Conexion.getConnection();
            String q = "select id_producto, tipohelado, precio_producto from mproducto";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Helado h = new Helado();

                h.setId(rs.getInt(1));
                h.setNombre(rs.getString(2));
                h.setIdprecio(rs.getInt(3));
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
