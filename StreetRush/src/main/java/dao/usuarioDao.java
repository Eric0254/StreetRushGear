package dao;

import model.usuario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        String sql = "INSERT INTO Usuarios (Nome, Email, CPF, Senha, ConfirmarSenha, Cargo) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getCpf());
            preparedStatement.setString(4, usuario.getSenha());
            preparedStatement.setString(5, usuario.getConfirmarSenha());
            preparedStatement.setString(6, usuario.getCargo());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao inserir usuário no banco de dados: " + e.getMessage());
        }
        return false;
    }

    public usuario obterusuarioPorEmailSenha(String email, String senha) {
        String sql = "SELECT * FROM Usuarios WHERE Email = ? AND Senha = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, senha);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                usuario usuario = new usuario();
                usuario.setNome(resultSet.getString("Nome"));
                usuario.setEmail(resultSet.getString("Email"));
                usuario.setCpf(resultSet.getString("CPF"));
                usuario.setSenha(resultSet.getString("Senha"));
                usuario.setConfirmarSenha(resultSet.getString("ConfirmarSenha"));
                return usuario;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao obter usuário do banco de dados: " + e.getMessage());
        }
        return null;
    }
}
