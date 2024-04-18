package dao;

import model.usuario;
import security.Password;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        String sql = "INSERT INTO Usuarios (Nome, Email, CPF, Senha, ConfirmarSenha, Cargo, Status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getCpf());
            preparedStatement.setString(4, usuario.getSenha());
            preparedStatement.setString(5, usuario.getConfirmarSenha());
            preparedStatement.setString(6, usuario.getCargo());
            preparedStatement.setString(7, usuario.getStatus());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao inserir usuário no banco de dados: " + e.getMessage());
        }
        return false;
    }

    public usuario obterusuarioPorEmailSenha(String email, String senhaCriptografada) {
        String sql = "SELECT * FROM Usuarios WHERE Email = ? AND Senha = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, senhaCriptografada);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                usuario usuario = new usuario();
                usuario.setNome(resultSet.getString("Nome"));
                usuario.setEmail(resultSet.getString("Email"));
                usuario.setCpf(resultSet.getString("CPF"));
                usuario.setSenha(resultSet.getString("Senha"));
                usuario.setConfirmarSenha(resultSet.getString("ConfirmarSenha"));
                usuario.setCargo(resultSet.getString("Cargo"));
                usuario.setStatus(resultSet.getString("Status"));
                return usuario;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao obter usuário do banco de dados: " + e.getMessage());
        }
        return null;
    }

    public List<usuario> showUser(){
        String SQL = "SELECT * FROM Usuarios";

        try {

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<usuario> users = new ArrayList<>();

            while (resultSet.next()) {

                int id = resultSet.getInt("ID");
                String userName = resultSet.getString("Nome");
                String userEmail = resultSet.getString("Email");
                String userCPF = resultSet.getString("CPF");
                String userSenha = resultSet.getString("Senha");
                String userSenha2 = resultSet.getString("ConfirmarSenha");
                String userCargo = resultSet.getString("Cargo");
                String userStatus = resultSet.getString("Status");

                usuario user = new usuario(id, userName, userEmail, userCPF, userSenha, userSenha2, userCargo, userStatus);
                users.add(user);
            }
            System.out.println("success in select * from user");

            return users;

        } catch (Exception e) {

            System.out.println("fail in database connection");

            return Collections.emptyList();

        }

    }

    public void updateProfile(usuario user) {
        String SQL = "UPDATE Usuarios SET nome = ?, cpf = ?, cargo = ?, senha = ?, confirmarSenha = ? WHERE ID = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getNome());
            preparedStatement.setString(2, user.getCpf());
            preparedStatement.setString(3, user.getCargo());
            preparedStatement.setString(4, user.getSenha());
            preparedStatement.setString(5, user.getConfirmarSenha());
            preparedStatement.setInt(6, user.getId());
            preparedStatement.execute();

            System.out.println("success in update profile");

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void updateStatus(usuario user){
        String SQL = "UPDATE Usuarios SET status = ? WHERE ID = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getStatus());
            preparedStatement.setInt(2, user.getId());
            preparedStatement.execute();

            System.out.println("success in update profile");

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());
        }
    }
    }
