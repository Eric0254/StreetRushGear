package model;

public class ItemPedido {
 private String nomeProduto;
 private int quantidade;
 private double preco;

 public ItemPedido(String nomeProduto, int quantidade, double preco) {
     this.nomeProduto = nomeProduto;
     this.quantidade = quantidade;
     this.preco = preco;
 }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
