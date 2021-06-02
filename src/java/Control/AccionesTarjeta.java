package Control;

import Modelo.Tarjeta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AccionesTarjeta {

    public static List<Tarjeta> listarTiposTarjetas(){
        
        List<Tarjeta> lista = new ArrayList();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from ctipoTarjeta";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();
            
            
            while (rs.next()) {

                Tarjeta t = new Tarjeta();

                t.setId_tarjeta(rs.getInt(1));
                t.setTipo_tarjeta(rs.getString(2));
                lista.add(t);

            }

            //System.out.println("Consulta de promociones exitosa");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al listar las promociones");
            System.out.println(ed.getMessage());
        }
        return lista;
    }
    
    public static int agregarTarjeta(Tarjeta t){
        
        int state = 0;
        
        try{ 
            
            Connection con = Conexion.getConnection();
            String q = "insert into mtarjeta(id_tarjeta, titular_tarjeta, numero_tarjeta, "
                    + "mes_vencimiento, year_vencimiento, cvv_tarjeta, id_tipoTarjeta) values"
                    + "(?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, t.getId_tarjeta());
            ps.setString(2, t.getTitular());
            ps.setString(3, t.getNum_tarjeta());
            ps.setString(4, t.getMes());
            ps.setString(5, t.getYear());
            ps.setString(6, t.getCvv());
            ps.setInt(7, t.getId_tipot());
            
            state = ps.executeUpdate();
            //System.out.println("Registro de usuario exitoso");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al registrar tarjeta");
            System.out.println(ed.getMessage());
        }
        
        return state;
    }
    
    public static List<Tarjeta> listarTarjetasUsuario(int id_usu){
        
        List<Tarjeta> listaTarjetas = new ArrayList<Tarjeta>();
        
        try{
            
            Connection con = Conexion.getConnection();
            String q = "select * from mtarjeta where id_tarjeta = ?";
            
            PreparedStatement ps = con.prepareCall(q);
            
            ps.setInt(1, id_usu);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                Tarjeta t = new Tarjeta();
                t.setNum_tajetagen(rs.getInt(1));
                t.setId_tarjeta(rs.getInt(2));
                t.setTitular(rs.getString(3));
                t.setNum_tarjeta(rs.getString(4));
                t.setMes(rs.getString(5));
                t.setYear(rs.getString(6));
                t.setCvv(rs.getString(7));
                t.setId_tipot(rs.getInt(8));
                listaTarjetas.add(t);
                
            }
            
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al listar las tarjetas del usuario");
            System.out.println(ed.getMessage());
        }
        
        return listaTarjetas;
    }
    
    public static int borrarTarjeta(int id_t){
        int state = 0;
        try{
            
            Connection con = Conexion.getConnection();
            
            String q = "delete from mtarjeta where id_generalt = ?";
            
            PreparedStatement ps = con.prepareCall(q);
            
            ps.setInt(1, id_t);
            
            state = ps.executeUpdate();
            //System.out.println("Se borro de manera exitosa");
            con.close();
            
        }catch(Exception ed){
            System.out.println("Error al borrar un helado");
            System.out.println(ed.getMessage());
        }
        return state;
    }
    
}
