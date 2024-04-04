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



<div class="container mt-5 pt-5"> <!-- Adicionando margem superior para afastar o carrossel do topo -->
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://cdn.dooca.store/1816/files/lauri-11-banner-desktop-1.png?v=1640472464&webp=0"

                     class="d-block w-100" alt="First Slide">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.tfx.company/app/sellsurf/imagens/sell-surf-banner-desktop_img1.jpeg"
                     class="d-block w-100" alt="Second Slide">
            </div>
            <div class="carousel-item">
                <img src="https://road.shimano.com/_assets/images/stories/2023/seven-factors-which-influence-how-often-your-bike-needs-service/seven-factors-which-influence-how-often-your-bike-needs-a-service-banner.jpg"
                     class="d-block w-100" alt="Third Slide">
            </div>
        </div>
    </div>
</div>


<div class="container mt-5">
    <h2>Produtos</h2>
    <div class="container">
        <div class="row" id="car-list"></div>
    </div>
    <div class="text-center p-3">
        <button class="cbtn" id="load-more">Ver Mais</button>
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


<!-- Bootstrap Bundle with Popper -->
<script src="DisplayPage.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script>
    // JavaScript para fazer o carrossel passar automaticamente
    $('.carousel').carousel({
        interval: 3000 // muda a cada 3 segundos (3000 ms)
    });
</script>
</nav>
</body>
</html>
