document.getElementById('enderecoEntregaBtn').addEventListener('click', function() {
    const enderecoEntregaContainer = document.getElementById('enderecoEntregaContainer');
    enderecoEntregaContainer.classList.remove('hidden');
    enderecoEntregaContainer.innerHTML = ''; // Limpa o conteúdo anterior

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

        enderecoEntregaContainer.appendChild(novoCampo);
    });
});

document.getElementById('cadastroForm').addEventListener('submit', function(event) {
    event.preventDefault();
    // Lógica de envio do formulário
    console.log('Formulário enviado!');
});
