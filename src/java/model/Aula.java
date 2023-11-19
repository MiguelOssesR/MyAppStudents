package model;

public class Aula {
    int grado;
    String aula;

    public int getGrado() {
        return grado;
    }

    public void setGrado(int grado) {
        this.grado = grado;
    }

    public String getAula() {
        return aula;
    }

    public void setAula(String aula) {
        this.aula = aula;
    }

    public Aula(int grado, String aula) {
        this.grado = grado;
        this.aula = aula;
    }
}
