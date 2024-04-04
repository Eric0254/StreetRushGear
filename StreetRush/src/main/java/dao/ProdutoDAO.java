package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.Produto;
import model.usuario;

public class ProdutoDAO {
    private static final String URL = "jdbc:h2:~/test"; // URL do banco de dados H2
    private static final String USERNAME = "sa"; // Usuário do banco de dados
    private static final String PASSWORD = "sa"; // Senha do banco de dados

    public static void addProduct(Produto produto) {
        String sql = "INSERT INTO produtos (nome, avaliacao, descricao, preco, qtd_estoque, IMAGEM_PRINCIPAL  , status) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, produto.getNome());
            stmt.setDouble(2, produto.getAvaliacao());
            stmt.setString(3, produto.getDescricao());
            stmt.setDouble(4, produto.getPreco());
            stmt.setInt(5, produto.getQtdEstoque());
            stmt.setString(6, produto.getImagemPrincipal());
            stmt.setString(7,"Ativo");

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Produto> ShowProduct(){
        String SQL = "SELECT * FROM PRODUTOS";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Produto> prods = new ArrayList<>();

            while (resultSet.next()) {

                int id = resultSet.getInt("id");
                String prodName = resultSet.getString("nome");
                double prodAval = resultSet.getDouble("avaliacao");
                String descricao = resultSet.getString("descricao");
                double preco = resultSet.getDouble("preco");
                int qtd = resultSet.getInt("qtd_estoque");
                String status = resultSet.getString("status");
                Blob imagem = resultSet.getBlob("IMAGEM_PRINCIPAL");


                Produto prod = new Produto();
                prod.setId(id);
                prod.setNome(prodName);
                prod.setAvaliacao(prodAval);
                prod.setDescricao(descricao);
                prod.setPreco(preco);
                prod.setQtdEstoque(qtd);
                prod.setStatus(status);
                prod.setImagemPrincipal(imagem.toString());
                prods.add(prod);
            }
            System.out.println("success in select * from user");

            return prods;

        } catch (Exception e) {

            System.out.println("fail in database connection");

            return Collections.emptyList();

        }
    }

    public void updateProduct(Produto prod) {
        String SQL = "UPDATE Produtos SET nome = ?, avaliacao = ?, descricao = ?, preco = ?, qtd_estoque = ? WHERE ID = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, prod.getNome());
            preparedStatement.setDouble(2, prod.getAvaliacao());
            preparedStatement.setString(3, prod.getDescricao());
            preparedStatement.setDouble(4, prod.getPreco());
            preparedStatement.setInt(5, prod.getQtdEstoque());
            preparedStatement.setInt(6, prod.getId());
            preparedStatement.execute();

            System.out.println("success in update profile");

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void updateStatus(Produto prod){
        String SQL = "UPDATE Produtos SET status = ? WHERE ID = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, prod.getStatus());
            preparedStatement.setInt(2, prod.getId());
            preparedStatement.execute();

            System.out.println("success in update profile");

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());
        }
    }
}
