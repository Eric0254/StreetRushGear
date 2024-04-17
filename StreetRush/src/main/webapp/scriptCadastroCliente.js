document.getElementById('enderecoEntregaBtn').addEventListener('click', function() {
    const enderecoEntregaContainer = document.getElementById('enderecoEntregaContainer');

    // Cria um novo conjunto de campos de entrega
    const novoConjunto = document.createElement('div');

    const camposEntrega = ['logradouro', 'numero', 'complemento', 'bairro', 'cidade', 'uf'];

    camposEntrega.forEach(function(campo) {
        const novoCampo = document.createElement('div');
        novoCampo.classList.add('form-group');

        const label = document.createElement('label');
        label.textContent = campo.charAt(0).toUpperCase() + campo.slice(1); // Capitaliza a primeira letra
        novoCampo.appendChild(label);

        const input = document.createElement('input');
        input.type = 'text';
        input.id = campo + 'Entrega';
        input.name = campo + 'Entrega';
        input.required = true;
        novoCampo.appendChild(input);

        novoConjunto.appendChild(novoCampo);
    });

    // Adiciona o botão de exclusão ao conjunto
    const botaoExcluir = document.createElement('button');
    botaoExcluir.textContent = 'Excluir';
    botaoExcluir.type = 'button';
    botaoExcluir.classList.add('excluir-campo');
    botaoExcluir.addEventListener('click', function() {
        novoConjunto.remove(); // Remove o conjunto inteiro quando o botão de exclusão é clicado
    });
    novoConjunto.appendChild(botaoExcluir);

    enderecoEntregaContainer.appendChild(novoConjunto);
});

document.getElementById('cadastroForm').addEventListener('submit', function(event) {
    event.preventDefault();

    // Aqui você pode adicionar o código para lidar com a submissão do formulário
    // Por exemplo, você pode coletar os dados do formulário e enviá-los para um servidor

    console.log('Formulário submetido');
});
