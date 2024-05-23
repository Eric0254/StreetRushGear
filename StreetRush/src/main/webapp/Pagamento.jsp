<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Importando CSS e JavaScript -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <title>Pagamento - StreetRushGear</title>
</head>
<body>
<div class="container mt-5">
    <h2>Pagamento</h2>
    <div id="resumo-compra"></div>

    <h3>Endereço de Entrega</h3>
    <p id="endereco-entrega"></p>

    <h3>Frete</h3>
    <div class="input-group mb-3">
        <input type="text" class="form-control" id="cep" placeholder="Digite seu CEP" maxlength="9">
        <button class="btn btn-outline-secondary" id="btnCalcularFrete">Calcular Frete</button>
    </div>
    <select id="opcoes-frete" class="form-select" style="display: none;">
        <option value="10.00">SEDEX - Entrega em 1 dia útil (R$ 10,00)</option>
        <option value="5.00">PAC - Entrega em 5 dias úteis (R$ 5,00)</option>
        <option value="0.00">Frete Grátis (Acima de R$ 100,00)</option>
    </select>

    <h3>Forma de Pagamento</h3>
    <div id="forma-pagamento"></div>

    <button class="btn btn-primary mt-3" id="btnFinalizarCompra">Finalizar Compra</button>
    <button class="btn btn-secondary mt-3" id="btnVoltarCarrinho">Voltar ao Carrinho</button>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="Pagamento.js"></script>
</body>
</html>
