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
        String sql = "INSERT INTO produtos (nome, avaliacao, descricao, preco, qtd_estoque, imagem_principal) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, produto.getNome());
            stmt.setDouble(2, produto.getAvaliacao());
            stmt.setString(3, produto.getDescricao());
            stmt.setDouble(4, produto.getPreco());
            stmt.setInt(5, produto.getQtdEstoque());
            stmt.setString(6, produto.getImagemPrincipal());

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
                Blob imagem = resultSet.getBlob("imagem_principal");

                Produto prod = new Produto();
                prod.setId(id);
                prod.setNome(prodName);
                prod.setAvaliacao(prodAval);
                prod.setDescricao(descricao);
                prod.setPreco(preco);
                prod.setQtdEstoque(qtd);
                prods.add(prod);
            }
            System.out.println("success in select * from user");

            return prods;

        } catch (Exception e) {

            System.out.println("fail in database connection");

            return Collections.emptyList();

        }
    }
}
