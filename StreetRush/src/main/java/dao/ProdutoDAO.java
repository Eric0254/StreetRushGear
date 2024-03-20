package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Produto;

public class ProdutoDAO {
    private static final String URL = "jdbc:h2:~/test"; // URL do banco de dados H2
    private static final String USERNAME = "sa"; // Usuário do banco de dados
    private static final String PASSWORD = ""; // Senha do banco de dados

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
}
