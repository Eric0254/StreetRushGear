package dao;
import model.ItemPedido;
import model.Pedido;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {

    private static final String URL = "jdbc:h2:~/test"; // URL do banco de dados H2
    private static final String USERNAME = "sa"; // Usuário do banco de dados
    private static final String PASSWORD = "sa"; // Senha do banco de dados


    private static final String SELECT_ALL_PEDIDOS = "SELECT id, data_pedido, valor_total, status FROM pedidos";
    private static final String SELECT_PEDIDO_BY_ID = "SELECT pedidos.id, pedidos.data_pedido, pedidos.valor_total, pedidos.status, " +
            "produtos.nome, itens_pedido.quantidade, itens_pedido.preco " +
            "FROM pedidos " +
            "JOIN itens_pedido ON pedidos.id = itens_pedido.pedido_id " +
            "JOIN produtos ON itens_pedido.produto_id = produtos.id " +
            "WHERE pedidos.id = ?";

    // Método para obter a conexão com o banco de dados
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Método para listar todos os pedidos
    public List<Pedido> selectAllPedidos() {
        List<Pedido> pedidos = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PEDIDOS);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String dataPedido = rs.getString("data_pedido");
                double valorTotal = rs.getDouble("valor_total");
                String status = rs.getString("status");
                pedidos.add(new Pedido(id, dataPedido, valorTotal, status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pedidos;
    }

    // Método para obter os detalhes de um pedido específico
    public Pedido selectPedido(int id) {
        Pedido pedido = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PEDIDO_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String dataPedido = rs.getString("data_pedido");
                double valorTotal = rs.getDouble("valor_total");
                String status = rs.getString("status");
                List<ItemPedido> itens = new ArrayList<>();
                do {
                    String nomeProduto = rs.getString("nome");
                    int quantidade = rs.getInt("quantidade");
                    double preco = rs.getDouble("preco");
                    itens.add(new ItemPedido(nomeProduto, quantidade, preco));
                } while (rs.next());
                pedido = new Pedido(id, dataPedido, valorTotal, status, itens);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pedido;
    }
}
