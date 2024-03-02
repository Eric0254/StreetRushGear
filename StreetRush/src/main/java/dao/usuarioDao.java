package dao;

import model.usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class usuarioDao {
    private Connection connection;

    public usuarioDao() {
        try {
            connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean inserirUsuario(usuario usuario) {
        String sql = "INSERT INTO Usuarios (Nome, Email, CPF, Senha, ConfirmarSenha) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getCpf());
            preparedStatement.setString(4, usuario.getSenha());
            preparedStatement.setString(5, usuario.getConfirmarSenha());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao inserir usuário no banco de dados: " + e.getMessage());
        }
        return false;
    }
}
