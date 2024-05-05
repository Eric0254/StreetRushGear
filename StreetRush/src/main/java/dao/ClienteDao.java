package dao;

import model.Cliente;
import model.EnderecoEntrega;
import model.EnderecoFaturamento;


import java.sql.*;


public class ClienteDao {
    private Connection connection;

    public ClienteDao() {
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
            preparedStatementCliente.setString(5, cliente.getNascimento());
            preparedStatementCliente.setString(6, cliente.getGenero());

            preparedStatementCliente.executeUpdate();

            ResultSet generatedKeys = preparedStatementCliente.getGeneratedKeys();
            int clienteID;
            if (generatedKeys.next()) {
                clienteID = generatedKeys.getInt(1);

                try (PreparedStatement preparedStatementEndereco = connection.prepareStatement(sqlEndereco)) {
                    preparedStatementEndereco.setInt(1, clienteID);
                    preparedStatementEndereco.setString(2, enderecoFaturamento.getCep());
                    preparedStatementEndereco.setString(3, enderecoFaturamento.getLogradouro());
                    preparedStatementEndereco.setString(4, enderecoFaturamento.getNumero());
                    preparedStatementEndereco.setString(5, enderecoFaturamento.getComplemento());
                    preparedStatementEndereco.setString(6, enderecoFaturamento.getBairro());
                    preparedStatementEndereco.setString(7, enderecoFaturamento.getCidade());
                    preparedStatementEndereco.setString(8, enderecoFaturamento.getUF());

                    return preparedStatementEndereco.executeUpdate() > 0;
                }
            } else {
                throw new SQLException("Falha ao obter o ID gerado para o cliente.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao inserir cliente e endereço de faturamento no banco de dados: " + e.getMessage());
        }
        return false;
    }


    public boolean adicionarEnderecoEntrega(int clienteId, EnderecoEntrega enderecoEntrega) {
        String sql = "INSERT INTO EnderecoEntrega (Cliente_ID, CEP, Logradouro, Numero, Complemento, Bairro, Cidade, UF) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, clienteId);
            preparedStatement.setString(2, enderecoEntrega.getCep());
            preparedStatement.setString(3, enderecoEntrega.getLogradouro());
            preparedStatement.setString(4, enderecoEntrega.getNumero());
            preparedStatement.setString(5, enderecoEntrega.getComplemento());
            preparedStatement.setString(6, enderecoEntrega.getBairro());
            preparedStatement.setString(7, enderecoEntrega.getCidade());
            preparedStatement.setString(8, enderecoEntrega.getUF());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao adicionar endereço de entrega no banco de dados: " + e.getMessage());
        }
        return false;
    }



    public Cliente obterClientePorEmailSenha(String email, String senha) {
        String sql = "SELECT * FROM Cliente WHERE Email = ? AND Senha = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, senha);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(resultSet.getInt("id"));
                cliente.setNome(resultSet.getString("nome"));
                cliente.setEmail(resultSet.getString("email"));
                cliente.setCpf(resultSet.getString("cpf"));
                cliente.setSenha(resultSet.getString("senha"));
                cliente.setNascimento(resultSet.getString("nascimento"));
                cliente.setGenero(resultSet.getString("genero"));
                return cliente;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao obter cliente do banco de dados: " + e.getMessage());
        }
        return null;
    }

    public Cliente obterClientePorEmail(String email) {
        String sql = "SELECT * FROM Cliente WHERE Email = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(resultSet.getInt("id"));
                cliente.setNome(resultSet.getString("nome"));
                cliente.setEmail(resultSet.getString("email"));
                cliente.setCpf(resultSet.getString("cpf"));
                cliente.setSenha(resultSet.getString("senha"));
                cliente.setNascimento(resultSet.getString("nascimento"));
                cliente.setGenero(resultSet.getString("genero"));
                return cliente;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erro ao obter cliente por e-mail do banco de dados: " + e.getMessage());
        }
        return null;
    }
}
