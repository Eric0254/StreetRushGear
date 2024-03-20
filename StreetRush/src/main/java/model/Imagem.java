package model;

public class Imagem {
    private int id;
    private String nome; // Nome da imagem no diretório
    private String caminho; // Caminho completo da imagem no diretório
    private boolean principal; // Indica se é a imagem principal do produto

    // getters e setters omitidos para brevidade


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

    public String getCaminho() {
        return caminho;
    }

    public void setCaminho(String caminho) {
        this.caminho = caminho;
    }

    public boolean isPrincipal() {
        return principal;
    }

    public void setPrincipal(boolean principal) {
        this.principal = principal;
    }
}
