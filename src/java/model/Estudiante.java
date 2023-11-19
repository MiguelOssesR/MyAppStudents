package model;

public class Estudiante {
    
    int id;
    int documento;
    String nombres;
    String primer_apellido;
    String segundo_apellido;
    String jornada;
    int grado;

    public Estudiante(int id, int documento, String nombres, String primer_apellido, String segundo_apellido, String jornada, int grado) {
        this.id = id;
        this.documento = documento;
        this.nombres = nombres;
        this.primer_apellido = primer_apellido;
        this.segundo_apellido = segundo_apellido;
        this.jornada = jornada;
        this.grado = grado;
    }

    public Estudiante(int documento, String nombres, String primer_apellido, String segundo_apellido, String jornada, int grado) {
        this.documento = documento;
        this.nombres = nombres;
        this.primer_apellido = primer_apellido;
        this.segundo_apellido = segundo_apellido;
        this.jornada = jornada;
        this.grado = grado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getdocumento() {
        return documento;
    }

    public void setdocumento(int cedula) {
        this.documento = documento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getPrimer_apellido() {
        return primer_apellido;
    }

    public void setPrimer_apellido(String primer_apellido) {
        this.primer_apellido = primer_apellido;
    }

    public String getSegundo_apellido() {
        return segundo_apellido;
    }

    public void setSegundo_apellido(String segundo_apellido) {
        this.segundo_apellido = segundo_apellido;
    }

    public String getJornada() {
        return jornada;
    }

    public void setJornada(String programa) {
        this.jornada = jornada;
    }

    public int getGrado() {
        return grado;
    }

    public void setGrado(int semestre) {
        this.grado = grado;
    }
    
}
