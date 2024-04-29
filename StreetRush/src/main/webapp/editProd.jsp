<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Editar Produto</title>
<link rel="stylesheet" href="styleCadastroProduto.css">

<script>
    window.onload = function() {
        var cargoUsuario = "${sessionScope.usuarioLogado.cargo}";

        if (cargoUsuario === "estoquista") {
            var campos = document.querySelectorAll('input, select, textarea');
            campos.forEach(function(campo) {
                campo.setAttribute('readonly', 'readonly');
            });

            document.getElementById('productStock').removeAttribute('readonly');
        }
    };

</script>
</head>
<body>
    <h1>Editar Produto</h1>
    <form action="/AtualizarProdutoServlet" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <label for="productName">Nome do Produto:</label>
        <input type="text" id="productName" name="nome" maxlength="200" value="${param.nome}" required>

        <label for="productRating">Avaliação:</label>
        <select id="productRating" name="avaliacao" required>
            <option value="0.5" ${param.avaliacao == '0.5' ? 'selected' : ''}>0.5</option>
            <option value="1" ${param.avaliacao == '1' ? 'selected' : ''}>1</option>
            <option value="1.5" ${param.avaliacao == '1.5' ? 'selected' : ''}>1.5</option>
            <option value="2" ${param.avaliacao == '2' ? 'selected' : ''}>2</option>
            <option value="2.5" ${param.avaliacao == '2.5' ? 'selected' : ''}>2.5</option>
            <option value="3" ${param.avaliacao == '3' ? 'selected' : ''}>3</option>
            <option value="3.5" ${param.avaliacao == '3.5' ? 'selected' : ''}>3.5</option>
            <option value="4" ${param.avaliacao == '4' ? 'selected' : ''}>4</option>
            <option value="4.5" ${param.avaliacao == '4.5' ? 'selected' : ''}>4.5</option>
            <option value="5" ${param.avaliacao == '5' ? 'selected' : ''}>5</option>
        </select>

        <label for="productDescription">Descrição Detalhada:</label>
        <textarea id="productDescription" name="descricao" maxlength="2000" required>${param.descricao}</textarea>

        <label for="productPrice">Preço do Produto:</label>
        <input type="text" id="productPrice" name="preco" placeholder="0.00" value="${param.preco}" required>

        <label for="productStock">Quantidade em Estoque:</label>
        <input type="number" id="productStock" name="qtdEstoque" min="0" value="${param.qtdEstoque}" required>

        <button type="submit">Salvar</button>
        <button type="button" onclick="cancel()">Cancelar</button>
    </form>
</body>
</html>
