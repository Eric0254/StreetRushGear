<!-- nova_pagina.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuário</title>
    <style>

        form div {
            margin-bottom: 10px; /* Adicione a margem desejada entre as divs */
        }
    </style>
</head>
<body>

    <h1>Editar Dados do Usuário</h1>



        <form action="AtualizarUsuarioServlet" method="post" onsubmit="return validarFormulario()">
            <div>
                <input type="hidden" name="id" value="${param.id}">
            </div>
            <div>
                Nome: <input type="text" name="nome" value="${param.nome}">
            </div>
            <div>
                Email: <input type="text" name="email" value="${param.email}" readonly>
            </div>
            <div>
                CPF: <input type="text" name="cpf" value="${param.cpf}">
            </div>
            <div>
                Cargo: <input type="text" name="cargo" id="cargo" value="${param.cargo}">
                </div>
            <div>
                Senha: <input type="text" name="senha" value="${param.senha}">
            </div>
            <div>
                Confirmar Senha: <input type="text" name="confirmarSenha" value="${param.confirmarSenha}">
            </div>
            <div>
                <input type="submit" value="Salvar">
            </div>
        </form>

        <script>
            function validarFormulario() {
                var cargoInput = document.getElementById("cargo");
                var cargoValue = cargoInput.value.toUpperCase();

                // Verificar se o valor do cargo é válido
                if (cargoValue !== "ADMINISTRADOR" && cargoValue !== "ESTOQUISTA") {
                    alert("Insira um cargo válido (Administrador ou Estoquista).");
                    return false; // Impede o envio do formulário
                }

                return true; // Permite o envio do formulário
            }
        </script>

</body>
</html>
