package dao;

import model.Cliente;
import model.EnderecoFaturamento;
import model.usuario;

import java.sql.*;


public class ClienteDao {
    private Connection connection;

    public ClienteDao(){
        try {
            connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean inserirCliente(Cliente cliente, EnderecoFaturamento enderecoFaturamento) {
        String sqlCliente = "INSERT INTO Cliente (Nome, Email, CPF, Senha, Nascimento, Genero) VALUES (?, ?, ?, ?, ?, ?)";
        String sqlEndereco = "INSERT INTO EnderecoFaturamento (Cliente_ID, CEP, Logradouro, Numero, Complemento, Bairro, Cidade, UF) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preparedStatementCliente = connection.prepareStatement(sqlCliente, Statement.RETURN_GENERATED_KEYS);
            preparedStatementCliente.setString(1, cliente.getNome());
            preparedStatementCliente.setString(2, cliente.getEmail());
            preparedStatementCliente.setString(3, cliente.getCpf());
            preparedStatementCliente.setString(4, cliente.getSenha());
            preparedStatementCliente.setDate(5, java.sql.Date.valueOf(cliente.getNascimento()));
            preparedStatementCliente.setString(6, cliente.getGenero());

            int affectedRows = preparedStatementCliente.executeUpdate();

            ResultSet generatedKeys = preparedStatementCliente.getGeneratedKeys();
            if (generatedKeys.next()) {
                int clienteID = generatedKeys.getInt(1);

                PreparedStatement preparedStatementEndereco = connection.prepareStatement(sqlEndereco);
                preparedStatementEndereco.setInt(1, clienteID);
                preparedStatementEndereco.setString(2, enderecoFaturamento.getCep());
                preparedStatementEndereco.setString(3, enderecoFaturamento.getLogradouro());
                preparedStatementEndereco.setString(4, enderecoFaturamento.getNumero());
                preparedStatementEndereco.setString(5, enderecoFaturamento.getComplemento());
                preparedStatementEndereco.setString(6, enderecoFaturamento.getBairro());
                preparedStatementEndereco.setString(7, enderecoFaturamento.getCidade());
                preparedStatementEndereco.setString(8, enderecoFaturamento.getUF());

                return preparedStatementEndereco.executeUpdate() > 0;
            } else {
                throw new SQLException("Falha ao obter o ID gerado para o cliente.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao inserir cliente e endereço de entrega no banco de dados: " + e.getMessage());
        }
        return false;
    }
    public usuario obterclientePorEmailSenha(String email, String senha) {
        String sql = "SELECT * FROM Cliente WHERE Email = ? AND Senha = ?";
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
}
