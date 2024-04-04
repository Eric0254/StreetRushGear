<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <a class="navbar-brand" href="#">
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

            <!-- Itens de Login, Cadastro e Carrinho -->
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
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
                        <a href="#" class="nav-link">
                            <i class="fas fa-shopping-cart"></i> <!-- Ícone de carrinho -->
                        </a>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="Corpo">
    <div class="JGimage">
        <img src="" alt="" id="card-img">
        <p id="card-description"></p>
        <p id="card-price"></p> <!-- Elemento para exibir o preço -->
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
        const urlParams = new URLSearchParams(window.location.search);
        const cardImgElement = document.getElementById("card-img");
        const cardDescriptionElement = document.getElementById("card-description");
        const cardPriceElement = document.getElementById("card-price"); // Elemento para exibir o preço

        if (urlParams.has("imgurl")) {
            cardImgElement.src = urlParams.get("imgurl");
        }

        if (urlParams.has("description")) {
            cardDescriptionElement.textContent = urlParams.get("description");
        }

        if (urlParams.has("price")) { // Verifique se o parâmetro 'price' existe
            cardPriceElement.textContent = `R$ ${urlParams.get("price")}`; // Exiba o preço
        }
    });
</script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>
