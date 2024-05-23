package model;

import java.util.List;

public class Pedido {
    private int idPedido;
    private String dataPedido;
    private double valorTotal;
    private String status;
    private List<ItemPedido> itens;

    public Pedido(int id, String dataPedido, double valorTotal, String status, List<ItemPedido> itens) {}
    public Pedido(int idPedido, String dataPedido, double valorTotal, String status) {
        this.idPedido = idPedido;
        this.dataPedido = dataPedido;
        this.valorTotal = valorTotal;
        this.status = status;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public List<ItemPedido> getItens() {
        return itens;
    }

    public void setItens(List<ItemPedido> itens) {
        this.itens = itens;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public String getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(String dataPedido) {
        this.dataPedido = dataPedido;
    }
}
