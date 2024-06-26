<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Importando CSS e JavaScript -->
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!--===============================================================================================-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!--===============================================================================================-->
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <!--===============================================================================================-->
    <title>StreetRushGear</title>
    <link rel="stylesheet" href="CssTela.css">
</head>
<style>
    /* Estilo para fixar o nav no topo */
    .fixed-top {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        z-index: 1030;
    }
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="img/Logo.jpg" alt="Logo" style="max-height: 60px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Itens do Navbar -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">Sobre Nós</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Produtos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contato</a>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${sessionScope.usuarioLogado != null or sessionScope.clienteLogado != null}">
                    <div class="dropdown">
                        <button class="btn btn-dark" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Bem-vindo, ${sessionScope.clienteLogado.nome}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="Perfil.jsp">Perfil</a></li>
                            <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            <!-- Adicione mais opções se necessário (por exemplo, para usuários administradores) -->
                        </ul>
                    </div>

                </c:if>
                <c:if test="${sessionScope.usuarioLogado == null and sessionScope.clienteLogado == null}">
                    <!-- Se usuário ou cliente NÃO logado -->
                    <li class="nav-item">
                        <form class="d-flex" role="search">
                            <p class="nav-link" style="font-size: 0.7rem;">
                                Faça Seu
                                <a href="login.jsp" class="text-muted">
                                    <span>Login</span>
                                </a>
                                <br>
                                Ou
                                <a href="login.jsp" class="text-muted">
                                    <span>Cadastre-se</span>
                                </a>
                                em nosso site
                            </p>
                        </form>
                    </li>
                </c:if>
                <li class="nav-item">
                    <a href="Carrinho.jsp" class="nav-link">
                        <i class="fas fa-shopping-cart"></i> <!-- Ícone de carrinho -->
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br><br><br><br>
<div class="container">
    <h2>Seu Carrinho</h2>
    <div id="carrinho-items"></div>

    <h3>Opções de Compra</h3>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="opcaoCompra" id="opcao1" value="opcao1">
        <label class="form-check-label" for="opcao1">
            Pix
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="opcaoCompra" id="opcao2" value="opcao2">
        <label class="form-check-label" for="opcao2">
            Cartão de débito
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="opcaoCompra" id="opcao3" value="opcao3">
        <label class="form-check-label" for="opcao3">
            Cartão de Crédito
        </label>
    </div>
    <h3>Frete</h3>
    <div class="input-group mb-3">
        <input type="text" class="form-control" id="cep" placeholder="Digite seu CEP" maxlength="9"> <!-- Limite de 9 caracteres para considerar a máscara -->
        <button class="btn btn-outline-secondary" id="btnCalcularFrete">Calcular Frete</button>
    </div>


    <select id="opcoes-frete" class="form-select" style="display: none;">
        <option value="10.00">SEDEX - Entrega em 1 dia útil (R$ 10,00)</option>
        <option value="5.00">PAC - Entrega em 5 dias úteis (R$ 5,00)</option>
        <option value="0.00">Frete Grátis (Acima de R$ 100,00)</option>
    </select>

    <br>
    <c:if test="${sessionScope.usuarioLogado != null or sessionScope.clienteLogado != null}">
        <button class="btn btn-primary" id="btnPagar">Ir para Pagamento</button>
    </c:if>
    <c:if test="${sessionScope.usuarioLogado == null and sessionScope.clienteLogado == null}">
        <p>Por favor, <a href="login.jsp">faça login</a> para prosseguir com o pagamento.</p>
    </c:if>

</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="Carrinho.js"></script>
</body>
</html>
