<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    <title>login page</title>
</head>

<body>

<div class="container" id="container">
    <div class="form-container sign-up">
        <form action="/create-user" method="post">
            <h1>Criar uma conta</h1>
            <input type="text" name="nome" placeholder="Nome" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" id="cpf" name="cpf" placeholder="Cpf" maxlength="14" oninput="formatarCpf(this)" required>
            <input type="password" name="senha" placeholder="Senha" required>
            <input type="password" name="confirmarSenha" placeholder="Confirmar Senha" required>
            <button type="submit">Inscrever-se</button>
        </form>
    </div>

    <!-- Parte tela de login -->
    <div class="form-container sign-in">
        <form action="/login" method="post">
            <h1>Entrar</h1>
            <input type="email" name="email" placeholder="Email">
            <input type="password" name="senha" placeholder="Senha">
            <a href="#">Esqueceu sua senha?</a>
            <button type="submit">Entrar</button>
        </form>
    </div>

    <div class="toggle-container">
        <div class="toggle">
            <div class="toggle-panel toggle-left">
                <h1>Bem vindo de volta!</h1>
                <p>Insira seus dados pessoais para usar todos os recursos do site</p>
                <button class="hidden" id="login">Entrar</button>
            </div>
            <div class="toggle-panel toggle-right">
                <h1>Olá amigo!</h1>
                <p>Registre-se com seus dados pessoais para usar todos os recursos do site</p>
                <button class="hidden" id="register">Inscrever-se</button>
            </div>
        </div>
    </div>
</div>

<script src="script.js"></script>

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
</script>
</body>

</html>