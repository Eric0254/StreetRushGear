
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <link rel="stylesheet" href="styleADM.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Principal</title>
</head>

<body>
<header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand text-white font-weight-bold" href="#">
                <img class="img" src="img/Logo.jpg" alt="Sua Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link text-white font-weight-bold active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link text-white font-weight-bold dropdown-toggle" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Jogos
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white font-weight-bold" href="#">Comunidade</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link text-white font-weight-bold" href="#">News</a>
                    </li>
                </ul>

                <c:if test="${not empty sessionScope.usuario}">
                    <div class="dropdown">
                        <button class="btn btn-danger dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown"
                                aria-expanded="false">
                            Bem-vindo, ${sessionScope.usuario.name}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="userDropdown">
                            <c:if test="${sessionScope.usuario.email eq 'gmaiabarbosa13@gmail.com'}">
                                <li><a class="dropdown-item" href="ADM.jsp">Listar Usuario</a></li>
                            </c:if>
                            <li><a class="dropdown-item" href="logout">Logout</a></li>
                        </ul>
                    </div>
                </c:if>

            </div>
        </div>
    </nav>
</header>
<main class="container mt-4">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <img src="img/Produtos.png" class="card-img-top" alt="Imagem Inserir">
                <div class="card-body">
                    <h5 class="card-title">Listar Produto</h5>
                    <p class="card-text">Clique aqui para exibir os produtos listado.</p>
                    <a href="" class="btn btn-primary">Exibir</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <img src="img/Usuario.png" class="card-img-top" alt="Imagem Usuario">
                <div class="card-body">
                    <h5 class="card-title">Listar Usuario</h5>
                    <p class="card-text">Clique aqui para exibri os usuarios listados.</p>
                    <a href="#" class="btn btn-primary">Exibir</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <img src="img/Pedido.png" class="card-img-top" alt="Imagem Excluir">
                <div class="card-body">
                    <h5 class="card-title">Listar Pedidos</h5>
                    <p class="card-text">Clique aqui para exibri os pedisos listados.</p>
                    <a href="#" class="btn btn-danger">Exibir</a>
                </div>
            </div>
        </div>
    </div>

</main>
<footer class="text-light py-3" style="background-color: #1C1C1C;">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="/">
                    <img class="Pe" src="img/Logo.jpg" alt="GameRaters Logo">
                </a>
            </div>
            <div class="col-md-4">
                <h4 style="color: #fff;">Useful Links</h4>
                <ul class="list-unstyled">
                    <li><a href="#" style="text-decoration: none; color: #fff;">Home</a></li>
                    <li><a href="#" style="text-decoration: none; color: #fff;">Products</a></li>
                    <li><a href="#" style="text-decoration: none; color: #fff;">Services</a></li>
                    <li><a href="#" style="text-decoration: none; color: #fff;">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h4 style="color: #fff;">Follow Us</h4>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#" style="text-decoration: none; color: #fff;"><i class="fab fa-twitter"></i></a></li>
                    <li class="list-inline-item"><a href="#" style="text-decoration: none; color: #fff;"><i class="fab fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="#" style="text-decoration: none; color: #fff;"><i class="fab fa-facebook"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
