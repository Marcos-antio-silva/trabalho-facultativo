package modelo;

import java.util.Date;

public class Inscritos {
    // Atributos
    private String cpf;
    private String nome;
    private String email;
    private String sexo;
    private String cel;
    private Date niver;

    // Métodos Setters
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public void setCel(String cel) {
        this.cel = cel;
    }

    public void setNiver(Date niver) {
        this.niver = niver;
    }

    // Métodos Getters
    public String getCpf() {
        return this.cpf;
    }

    public String getNome() {
        return this.nome;
    }

    public String getEmail() {
        return this.email;
    }

    public String getSexo() {
        return this.sexo;
    }

    public String getCel() {
        return this.cel;
    }

    public Date getNiver() {
        return this.niver;
    }
}
