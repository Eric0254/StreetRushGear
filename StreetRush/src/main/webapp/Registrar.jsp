
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pt-br">
<head>
    <title>StreetRushGear</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Optional: Bootstrap JavaScript and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <title>login page</title>
</head>
<body>
<div class="container" id="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-md-6">
            <div class="form-container sign-up">
                <form action="/create-user" method="post">
                    <h1 class="mb-4">Criar uma conta</h1>
                    <div class="form-group">
                        <input type="text" class="form-control" name="nome" placeholder="Nome" required>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="email" placeholder="Email" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF" maxlength="14" oninput="formatarCpf(this)" required>
                    </div>
                    <div class="form-group">
                        <label for="cargo">Cargo:</label>
                        <select class="form-control" id="cargo" name="cargo" required>
                            <option value="adm">Administrador</option>
                            <option value="estoquista">Estoquista</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="confirmarSenha" id="confirmarSenha" placeholder="Confirmar Senha" required>
                    </div>
                    <input type="hidden" name="senhaCriptografada" id="senhaCriptografada">
                    <button type="submit" class="btn btn-primary">Inscrever-se</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/sha256.js"></script>
<script>
    function formatarCpf(campo) {
        let valor = campo.value.replace(/\D/g, ''); // Remove caracteres não numéricos
        if (valor.length > 3) {
            valor = valor.substring(0, 3) + '.' + valor.substring(3);
        }
        if (valor.length > 7) {
            valor = valor.substring(0, 7) + '.' + valor.substring(7);
        }
        if (valor.length > 11) {
            valor = valor.substring(0, 11) + '-' + valor.substring(11);
        }
        campo.value = valor;
    }

    function validarFormulario() {
        var senha = document.getElementById('senha').value;
        var confirmarSenha = document.getElementById('confirmarSenha').value;

        // Verificar se as senhas são iguais
        if (senha !== confirmarSenha) {
            alert("As senhas não coincidem. Por favor, verifique.");
            return false;
        }

        // Criptografar a senha
        var senhaCriptografada = CryptoJS.SHA256(senha).toString(CryptoJS.enc.Hex);

        // Atualizar o valor da senha criptografada no campo oculto
        document.getElementById('senhaCriptografada').value = senhaCriptografada;

        return true;
    }
</script>

</body>
</html>
