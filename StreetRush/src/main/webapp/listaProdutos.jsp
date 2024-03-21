<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="StyleLista.css">

    <title>Lista de Produtos</title>
</head>

<body>
    <h1 class="title">Lista de Produtos</h1>

            <div class="filter-input">
            <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Pesquisar por nome">
            </div>

            <div class="table-container">
            <table border="1" id="userTable">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Qtd Estoque</th>
                    <th>Valor</th>
                    <th>Status</th>
                    <th>Editar</th>
                    <th>Alterar Status</th>
                    <th>Visualizar Produto</th>
                    <c:if test="${sessionScope.usuarioLogado.cargo.equalsIgnoreCase('administrador')}">
                    <th><button onclick="window.location.href='cadastroProduto.jsp'">+</button></th>
                    </c:if>
                </tr>

                <c:forEach var="prod" items="${prods}">
                    <tr>
                        <td>${prod.id}</td>
                        <td>${prod.nome}</td>
                        <td>${prod.qtdEstoque}</td>
                        <td>R$ ${prod.preco}</td>
                        <td>${prod.status}</td>
                        <td><button onclick="abrirNovaJanela('${prod.id}', '${prod.nome}', '${prod.avaliacao}', '${prod.descricao}', '${prod.preco}', '${prod.qtdEstoque}', '${prod.imagemPrincipal}')">Editar</button></td>
                        <td>Alterar</td>
                        <td><button onclick="abrirNovaJanela('${prod.id}', '${prod.nome}', '${prod.avaliacao}', '${prod.descricao}', '${prod.preco}', '${prod.qtdEstoque}', '${prod.imagemPrincipal}')">Visualizar</button></td>
                    </tr>
                </c:forEach>
            </table>
            </div>
            <script>
                    function filterTable() {
                        var input, filter, table, tr, td, i, txtValue;
                        input = document.getElementById("searchInput");
                        filter = input.value.toUpperCase();
                        table = document.getElementById("userTable");

                        if (table) {
                            tr = table.getElementsByTagName("tr");

                            for (i = 0; i < tr.length; i++) {
                                td = tr[i].getElementsByTagName("td")[1]; // Index 1 corresponds to the "Nome" column
                                if (td) {
                                    txtValue = td.textContent || td.innerText;
                                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                        tr[i].style.display = "";
                                    } else {
                                        tr[i].style.display = "none";
                                    }
                                }
                            }
                        }
                    }

                    function abrirNovaJanela(id, nome, avaliacao, descricao, preco, qtdEstoque, status, imagemPrincipal) {
                                            var url = "editProd.jsp?id=" + encodeURIComponent(id) +
                                                      "&nome=" + encodeURIComponent(nome) +
                                                      "&avaliacao=" + encodeURIComponent(avaliacao) +
                                                      "&descricao=" + encodeURIComponent(descricao) +
                                                      "&preco=" + encodeURIComponent(preco)+
                                                      "&qtdEstoque=" + encodeURIComponent(qtdEstoque) +
                                                      "&status=" + encodeURIComponent(status) +
                                                      "&imagemPrincipal=" + encodeURIComponent(imagemPrincipal);

                                            window.open(url, "_blank");
                                        }
            </script>

</body>