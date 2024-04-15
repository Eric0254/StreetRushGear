<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Cliente</title>
    <link rel="stylesheet" href="styleCadastroCliente.css">
</head>
<body>
<div class="container">
    <h2>Cadastro de Cliente</h2>
    <form id="cadastroForm">
        <div class="form-group">
            <label for="nome">Nome Completo:</label>
            <input type="text" id="nome" name="nome" required>
        </div>
        <div class="form-group">
            <label for="dataNascimento">Data de Nascimento:</label>
            <input type="date" id="dataNascimento" name="dataNascimento" required>
        </div>
        <div class="form-group">
            <label>Gênero:</label>
            <input type="radio" id="generoMasculino" name="genero" value="masculino" required>
            <label for="generoMasculino">Masculino</label>
            <input type="radio" id="generoFeminino" name="genero" value="feminino">
            <label for="generoFeminino">Feminino</label>
        </div>
        <div class="form-group">
            <label for="cep">CEP:</label>
            <input type="text" id="cep" name="cep" required>
        </div>
        <div class="endereco-container form-group">
            <label for="logradouro" class="numero-label">Logradouro:</label>
            <input type="text" id="logradouro" name="logradouro" class="logradouro-input" required>
            <label for="numero" class="numero-label">N°</label>
            <input type="text" id="numero" name="numero" class="numero-input" required>
        </div>
        <div class="form-group">
            <label for="complemento">Complemento:</label>
            <input type="text" id="complemento" name="complemento">
        </div>
        <div class="form-group">
            <label for="bairro">Bairro:</label>
            <input type="text" id="bairro" name="bairro" required>
        </div>
        <div class="form-group">
            <label for="cidade">Cidade:</label>
            <input type="text" id="cidade" name="cidade" required>
        </div>
        <div class="form-group">
            <label for="uf">UF:</label>
            <input type="text" id="uf" name="uf" required>
        </div>
        <div class="form-group">
            <label for="enderecoEntregaBtn">Endereço de Entrega:</label>
            <button type="button" id="enderecoEntregaBtn">Adicionar Endereço de Entrega</button>
        </div>
        <div id="enderecoEntregaContainer" class="hidden">
            <!-- Os campos de endereço de entrega serão adicionados aqui dinamicamente -->
        </div>
        <button type="submit">Cadastrar</button>
    </form>
</div>

<script src="scriptCadastroCliente.js"></script>
</body>
</html>
