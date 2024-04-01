
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
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
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
        </div>
    </div>
</nav>

<div class="container mt-5 pt-5"> <!-- Adicionando margem superior para afastar o carrossel do topo -->
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://cdn.dooca.store/878/files/banner-carrossel-desktop-keychain-ex-2.jpg?v=1686853903&webp=0" class="d-block w-100" alt="First Slide">
            </div>
            <div class="carousel-item">
                <img src="https://experienceleague.adobe.com/pt-br/docs/experience-manager-cloud-service/content/assets/dynamicmedia/media_1ddd2d232e6055d38c124de8bfc6d3971c9ec47e5.png?width=750&format=png&optimize=medium" class="d-block w-100" alt="Second Slide">
            </div>
            <div class="carousel-item">
                <img src="https://thumbs.dreamstime.com/b/cartaz-de-banner-web-fundo-do-vetor-skate-desenho-em-linha-contínua-skater-com-letra-187121332.jpg" class="d-block w-100" alt="Third Slide">
            </div>
        </div>
    </div>
</div>


<div class="container mt-5">
    <h2>Produtos</h2>
    <div class="row">
        <div class="col-lg-3 col-md-4 mb-4">
            <div class="card h-100">
                <img class="card-img-top" src="https://www.sucataskateshop.com.br/images/virtuemart/product/TRUCK%20STRONGER.jpg" alt="">
                <div class="card-body">
                    <h4 class="card-title">Truck stronger</h4>
                    <h5>R$ 24.99</h5>
                    <p class="card-text">Truck stronger.</p>
                </div>
                <div class="card-footer">
                    <button class="btn btn-primary">Comprar</button>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-4 mb-4">
            <div class="card h-100">
                <img class="card-img-top" src="https://www.sucataskateshop.com.br/images/virtuemart/product/TRUCK%20STRONGER.jpg" alt="">
                <div class="card-body">
                    <h4 class="card-title">Truck stronger</h4>
                    <h5>R$ 19.99</h5>
                    <p class="card-text">Truck stronger.</p>
                </div>
                <div class="card-footer">
                    <button class="btn btn-primary">Comprar</button>
                </div>
            </div>
        </div>

        <!-- Adicione mais cards conforme necessário -->

    </div>
</div>


<!-- Bootstrap Bundle with Popper -->
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
