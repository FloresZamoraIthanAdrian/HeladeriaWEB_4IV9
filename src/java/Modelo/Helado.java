package Modelo;

public class Helado {

    private int id, idprecio, promocion, presentacion, stock_gramos, disponibilidad;
    private String nombre, spromcion, spresentacion;
    
    public Helado(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdprecio() {
        return idprecio;
    }

    public void setIdprecio(int idprecio) {
        this.idprecio = idprecio;
    }

    public int getPromocion() {
        return promocion;
    }

    public void setPromocion(int promocion) {
        this.promocion = promocion;
    }

    public int getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(int presentacion) {
        this.presentacion = presentacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSpromcion() {
        return spromcion;
    }

    public void setSpromcion(String spromcion) {
        this.spromcion = spromcion;
    }

    public String getSpresentacion() {
        return spresentacion;
    }

    public void setSpresentacion(String spresentacion) {
        this.spresentacion = spresentacion;
    }

    public int getStock_gramos() {
        return stock_gramos;
    }

    public void setStock_gramos(int stock_gramos) {
        this.stock_gramos = stock_gramos;
    }

    public int getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(int disponibilidad) {
        this.disponibilidad = disponibilidad;
    }
    
}
