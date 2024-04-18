
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Cliente" %>
<%@ page import="model.EnderecoFaturamento" %>
<%
    Cliente cliente = (Cliente) session.getAttribute("cliente");
    EnderecoFaturamento endereco = (EnderecoFaturamento) session.getAttribute("endereco");
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil do Usuário</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #333;
            color: white;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #222;
            padding: 10px;
            text-align: left;
        }
        .navbar h1 {
            color: red;
            font-size: 18px;
        }
        .container {
            padding: 20px;
        }
        .profile-section {
            background-color: #444;
            padding: 20px;
            margin-bottom: 20px;
        }
        .profile-section h2, .profile-section p {
            margin: 0;
        }
        .profile-section button {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
        }
        .profile-section button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
<div class="navbar">
    <h1>ACESSE TODOS OS DEPARTAMENTOS</h1>
</div>

<div class="container">
    <% if(cliente != null) { %>
    <div class="profile-section">
        <h2>Minha Conta</h2>
        <p>Informações de Acesso</p>
        <p>Nome do Usuário: <%= cliente.getNome() %></p>
        <p><%= cliente.getEmail() %></p>
        <button>EDITAR</button>
        <button>Adicionar Endereço de Entrega</button>
    </div>

    <% if(endereco != null) { %>
    <div class="profile-section">
        <h2>Endereços Cadastrados</h2>
        <p>GERENCIAR ENDEREÇOS</p>
        <p>Endereço de Cobrança Padrão</p>
        <p><%= endereco.getLogradouro() %>, <%= endereco.getNumero() %></p>
        <p><%= endereco.getCidade() %> - <%= endereco.getUF() %> - <%= endereco.getCep() %></p>
        <p>Tel: (00) 0000-0000</p>
    </div>
    <% } %>

    <div class="profile-section">
        <h2>Meus Pedidos</h2>
        <p>VER TODOS</p>
        <p>Você não fez nenhum pedido ainda.</p>
    </div>
    <% } else { %>
    <p>Erro ao carregar informações do perfil.</p>
    <% } %>
</div>

</body>
</html>
