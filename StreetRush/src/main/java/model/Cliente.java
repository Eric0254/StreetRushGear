package model;

public class Cliente {
    private int id;
    private String nome;
    private String email;
    private String cpf;
    private String Senha;
    private String nascimento;
    private String genero;

    public Cliente(String nome, String email, String cpf, String senha, String nascimento, String genero) {
    }

    public Cliente(int id, String nome, String email, String cpf, String senha, String nascimento, String genero) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cpf = cpf;
        Senha = senha;
        this.nascimento = nascimento;
        this.genero = genero;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return Senha;
    }

    public void setSenha(String senha) {
        Senha = senha;
    }

    public String getNascimento() {
        return nascimento;
    }

    public void setNascimento(String nascimento) {
        this.nascimento = nascimento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
}
