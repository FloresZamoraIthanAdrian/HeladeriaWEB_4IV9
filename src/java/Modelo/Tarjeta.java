package Modelo;

public class Tarjeta {

    private int id_tarjeta, num_tajetagen;
    private String tipo_tarjeta;
    private int id_tipot;
    private String titular, num_tarjeta, mes, year, cvv;

    public int getId_tarjeta() {
        return id_tarjeta;
    }

    public void setId_tarjeta(int id_tarjeta) {
        this.id_tarjeta = id_tarjeta;
    }

    public String getTipo_tarjeta() {
        return tipo_tarjeta;
    }

    public void setTipo_tarjeta(String tipo_tarjeta) {
        this.tipo_tarjeta = tipo_tarjeta;
    }

    public int getId_tipot() {
        return id_tipot;
    }

    public void setId_tipot(int id_tipot) {
        this.id_tipot = id_tipot;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }

    public String getNum_tarjeta() {
        return num_tarjeta;
    }

    public void setNum_tarjeta(String num_tarjeta) {
        this.num_tarjeta = num_tarjeta;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public int getNum_tajetagen() {
        return num_tajetagen;
    }

    public void setNum_tajetagen(int num_tajetagen) {
        this.num_tajetagen = num_tajetagen;
    }
    
}
