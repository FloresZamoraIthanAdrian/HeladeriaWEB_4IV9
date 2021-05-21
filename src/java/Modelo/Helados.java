package Modelo;

public class Helados {

    private int id, precio, precioMayoreo, cantidadGeneral;
    private String helado;
    
    public Helados(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getPrecioMayoreo() {
        return precioMayoreo;
    }

    public void setPrecioMayoreo(int precioMayoreo) {
        this.precioMayoreo = precioMayoreo;
    }

    public int getCantidadGeneral() {
        return cantidadGeneral;
    }

    public void setCantidadGeneral(int cantidadGeneral) {
        this.cantidadGeneral = cantidadGeneral;
    }

    public String getHelado() {
        return helado;
    }

    public void setHelado(String helado) {
        this.helado = helado;
    }
    
}
