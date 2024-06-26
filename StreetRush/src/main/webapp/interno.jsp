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
    <link rel="stylesheet" href="Csstela.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>StreetRushGear</title>
</head>
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
<div class="product-container">
    <img src="caminho-da-imagem.jpg" alt="Produto" id="card-img">
    <div class="product-details">
        <p id="card-name">Nome do Produto</p>
        <h3 style="display: inline-block;">R$</h3> <p id="card-price" style="display: inline-block;">Preço do Produto</p>
        <p></p>
        <button class="botao-comprar">Comprar</button>
        <h3>Descrição</h3><p id="card-description">Descrição do Produto</p>
    </div>
</div>
<div class="container-fluid bg-white text-dark py-3">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>Links Úteis</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-dark">Sobre Nós</a></li>
                    <li><a href="#" class="text-dark">Produtos</a></li>
                    <li><a href="#" class="text-dark">Contato</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Redes Sociais</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-dark">Facebook</a></li>
                    <li><a href="#" class="text-dark">Twitter</a></li>
                    <li><a href="#" class="text-dark">Instagram</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Contato</h5>
                <address>
                    Endereço: Rua Exemplo, 123<br>
                    Cidade Exemplo - Estado<br>
                    Telefone: (11) 1234-5678<br>
                    Email: contato@exemplo.com
                </address>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const botaoComprar = document.querySelector(".botao-comprar");
        botaoComprar.addEventListener("click", adicionarAoCarrinho);
        const urlParams = new URLSearchParams(window.location.search);
        const cardImgElement = document.getElementById("card-img");
        const cardDescriptionElement = document.getElementById("card-description");
        const cardPriceElement = document.getElementById("card-price");
        const cardNameElement = document.getElementById("card-name");

        if (urlParams.has("imgurl")) {
            cardImgElement.src = urlParams.get("imgurl");
        }

        if (urlParams.has("description")) {
            cardDescriptionElement.textContent = urlParams.get("description");
        }

        if (urlParams.has("price")) { // Verifique se o parâmetro 'price' existe
            cardPriceElement.textContent = urlParams.get("price"); // Exiba o preço
        }
        if (urlParams.has("name")) {
            cardNameElement.textContent = urlParams.get("name");
        }

        function adicionarAoCarrinho() {
            const cardImgElement = document.getElementById("card-img");
            const cardDescriptionElement = document.getElementById("card-description");
            const cardPriceElement = document.getElementById("card-price");
            const cardNameElement = document.getElementById("card-name");

            const itemImgUrl = cardImgElement.src;
            const itemDescription = cardDescriptionElement.textContent;
            const itemPrice = cardPriceElement.textContent;
            const itemName = cardNameElement.textContent;

            const item = {
                name: itemName,
                description: itemDescription,
                price: itemPrice,
                imageUrl: itemImgUrl
            };

            adicionarItemAoCarrinho(item);
        }

        function adicionarItemAoCarrinho(item) {
            let carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
            carrinho.push(item);
            localStorage.setItem("carrinho", JSON.stringify(carrinho));
            alert("Item adicionado ao carrinho!");
        }

    });

</script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>
