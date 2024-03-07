<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="StyleLista.css">

    <title>Lista de usuários</title>
</head>

<body>
    <h1>Lista de Usuários</h1>
            <div class="filter-input">
            <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Pesquisar por nome">
            </div>

            <div class="table-container">
            <table border="1" id="userTable">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>CPF</th>
                    <th>Grupo</th>
                    <th>Status</th>
                    <th>Editar</th>
                    <th>Alterar Status<th>
                </tr>

                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.nome}</td>
                        <td>${user.email}</td>
                        <td>${user.cpf}</td>
                        <td>${user.cargo}</td>
                        <td>${user.status}</td>
                        <td><button onclick="abrirNovaJanela('${user.id}', '${user.nome}', '${user.email}', '${user.cpf}', '${user.cargo}', '${user.senha}', '${user.confirmarSenha}')">Editar</button>
                        <td>
                                    <form action="AtualizarStatusServlet" method="post">
                                        <input type="hidden" name="userId" value="${user.id}">
                                        <button type="submit">Ativar/Inativar</button>
                                    </form>
                                </td>

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

                function abrirNovaJanela(id, nome, email, cpf, cargo, senha, confirmarSenha) {
                        var url = "nova_pagina.jsp?id=" + encodeURIComponent(id) +
                                  "&nome=" + encodeURIComponent(nome) +
                                  "&email=" + encodeURIComponent(email) +
                                  "&cpf=" + encodeURIComponent(cpf) +
                                  "&cargo=" + encodeURIComponent(cargo)+
                                  "&senha=" + encodeURIComponent(senha) +
                                  "&confirmarSenha=" + encodeURIComponent(confirmarSenha);

                        window.open(url, "_blank");
                    }
            </script>

</body