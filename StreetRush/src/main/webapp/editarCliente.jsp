<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar cadastro</title>
    <link rel="stylesheet" href="styleCadastroCliente.css">
</head>
<body>
<div class="container">
    <h2 class="titulo">Editar Cadastro</h2>
    <div class="content">
        <div class="faturamento">
            <form action="/AtualizarClienteServlet" method="post">
                <div class="form-group">
                    <label for="nome">Nome Completo:</label>
                    <input type="text" id="nome" name="nome" required value="${param.nome}">
                </div>
                <div class="form-group">
                    <label for="dataNascimento">Data de Nascimento:</label>
                    <input type="date" id="dataNascimento" name="nascimento" required value="${param.nascimento}>">
                </div>
                <div class="form-group">
                    <label>Gênero:</label>
                    <input type="radio" id="generoMasculino" name="genero" value="masculino" required checked>
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
                <button type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#cep").on("blur", function() {
            var cep = $(this).val().replace(/\D/g, '');
            if (cep !== "") {
                $.getJSON("https://viacep.com.br/ws/" + cep + "/json/", function(data) {
                    if (!("erro" in data)) {
                        $("#logradouro").val(data.logradouro);
                        $("#complemento").val(data.complemento);
                        $("#bairro").val(data.bairro);
                        $("#cidade").val(data.localidade);
                        $("#uf").val(data.uf);
                    } else {
                        alert("CEP não encontrado.");
                    }
                });
            }
        });
    });
</script>
</body>
</html>
