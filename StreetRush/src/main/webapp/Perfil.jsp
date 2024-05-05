
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil do Usuário</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            color: white;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #222;
            padding: 10px;
            text-align: left;
        }
        .navbar h1 {
            color: red;
            font-size: 18px;
        }
        .container {
            padding: 20px;
        }
        .profile-section {
            background-color: #444;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 40px;
        }
        .profile-section h2, .profile-section p {
            margin: 0;
        }
        .profile-section button {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
        }
        .profile-section button:hover {
            opacity: 0.8;
        }
    </style>
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

            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${sessionScope.usuarioLogado != null or sessionScope.clienteLogado != null}">
                    <div class="dropdown">
                        <button class="btn btn-dark" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Bem-vindo, ${sessionScope.clienteLogado.nome}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="Perfil.jsp">Perfil</a></li>
                            <li><a class="dropdown-item" href="/logout">Logout</a></li>
                        </ul>
                    </div>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="fas fa-shopping-cart"></i> <!-- Ícone de carrinho -->
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.usuarioLogado == null and sessionScope.clienteLogado == null}">
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
            </ul>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<br>
<br>
<br>
<c:if test="${sessionScope.clienteLogado != null}">
<div class="container">
    <div class="profile-section">
        <h2>Minha Conta</h2>
        <p>Informações de Acesso</p>
        <p>Nome do Usuário: ${clienteLogado.nome}</p> <!-- Alteração aqui -->
        <a href="editarCliente.jsp" class="btn btn-danger">EDITAR</a>
        <a href="AddEndereco.jsp" class="btn btn-danger">Adcionar Endereço de Entrega</a>
    </div>

    <div class="profile-section">
        <h2>Endereços Cadastrados</h2>
        <p>GERENCIAR ENDEREÇOS</p>
        <p>Endereço de Cobrança Padrão</p>
        <p></p>
        <p></p>
        <p>Tel: (00) 0000-0000</p>
    </div>


    <div class="profile-section">
        <h2>Meus Pedidos</h2>
        <p>VER TODOS</p>
        <p>Você não fez nenhum pedido ainda.</p>
    </div>
</div>
</c:if>

</body>
</html>
