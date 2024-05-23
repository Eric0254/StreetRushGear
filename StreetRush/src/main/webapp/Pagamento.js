document.addEventListener("DOMContentLoaded", function () {
    const resumoCompraElement = document.getElementById("resumo-compra");
    const formaPagamentoElement = document.getElementById("forma-pagamento");
    const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    const opcaoCompra = new URLSearchParams(window.location.search).get('opcao');
    let total = 0;
    let valorFreteAtual = 0;

    if (carrinho.length === 0) {
        resumoCompraElement.innerHTML = "<p>Seu carrinho está vazio.</p>";
    } else {
        carrinho.forEach(item => {
            const itemHTML = `
                <div class="carrinho-item row align-items-center bg-light p-2 mb-3 rounded">
                    <div class="col-md-2">
                        <img src="${item.imageUrl}" alt="${item.name}" class="img-fluid rounded" style="width: 100px; height: 100px;">
                    </div>
                    <div class="col-md-6">
                        <h4>${item.name}</h4>
                        <p>Preço: R$ ${item.price}</p>
                        <p>Quantidade: ${item.quantidade}</p>
                    </div>
                </div>
            `;
            resumoCompraElement.innerHTML += itemHTML;
            total += parseFloat(item.price.replace('R$', '').trim()) * item.quantidade;
        });
    }

    const totalElement = document.createElement('p');
    totalElement.id = 'total-compra';
    totalElement.textContent = `Total: R$ ${total.toFixed(2)}`;
    resumoCompraElement.appendChild(totalElement);

    // Exibir forma de pagamento
    switch (opcaoCompra) {
        case "opcao1":
            formaPagamentoElement.innerHTML = `
                <h4>Pix</h4>
                <p>Chave Pix: streetrushgear@pix.com.br</p>
            `;
            break;
        case "opcao2":
            formaPagamentoElement.innerHTML = `
                <h4>Cartão de Débito</h4>
                <div class="mb-3">
                    <label for="numeroCartao" class="form-label">Número do Cartão</label>
                    <input type="text" class="form-control" id="numeroCartao">
                </div>
                <div class="mb-3">
                    <label for="nomeCartao" class="form-label">Nome no Cartão</label>
                    <input type="text" class="form-control" id="nomeCartao">
                </div>
                <div class="mb-3">
                    <label for="validadeCartao" class="form-label">Validade</label>
                    <input type="text" class="form-control" id="validadeCartao">
                </div>
                <div class="mb-3">
                    <label for="cvvCartao" class="form-label">CVV</label>
                    <input type="text" class="form-control" id="cvvCartao">
                </div>
            `;
            break;
        case "opcao3":
            formaPagamentoElement.innerHTML = `
                <h4>Cartão de Crédito</h4>
                <div class="mb-3">
                    <label for="numeroCartao" class="form-label">Número do Cartão</label>
                    <input type="text" class="form-control" id="numeroCartao">
                </div>
                <div class="mb-3">
                    <label for="nomeCartao" class="form-label">Nome no Cartão</label>
                    <input type="text" class="form-control" id="nomeCartao">
                </div>
                <div class="mb-3">
                    <label for="validadeCartao" class="form-label">Validade</label>
                    <input type="text" class="form-control" id="validadeCartao">
                </div>
                <div class="mb-3">
                    <label for="cvvCartao" class="form-label">CVV</label>
                    <input type="text" class="form-control" id="cvvCartao">
                </div>
            `;
            break;
        default:
            formaPagamentoElement.innerHTML = "<p>Opção de pagamento não selecionada.</p>";
    }

    $('#btnCalcularFrete').click(function() {
        $('#opcoes-frete').show();
    });

    $('#opcoes-frete').change(function() {
        const freteValor = parseFloat($(this).val());
        const totalCompraAtual = parseFloat(totalElement.textContent.replace('Total: R$', ''));

        const novoTotalCompra = totalCompraAtual - valorFreteAtual + freteValor;
        totalElement.textContent = `Total: R$ ${novoTotalCompra.toFixed(2)}`;
        valorFreteAtual = freteValor;
    });

    $("#cep").on("input", function() {
        var cep = $(this).val().replace(/\D/g, '');
        if (cep.length > 8) {
            cep = cep.slice(0, 8);
        }
        cep = cep.replace(/(\d{5})(\d)/, "$1-$2");
        $(this).val(cep);
    });

    $("#cep").on("blur", function() {
        var cep = $(this).val().replace(/\D/g, '');
        if (cep !== "" && cep.length === 8) {
            $.getJSON("https://viacep.com.br/ws/" + cep + "/json/", function(data) {
                if (!("erro" in data)) {
                    $("#endereco-entrega").text(`${data.logradouro}, ${data.bairro}, ${data.localidade} - ${data.uf}`);
                } else {
                    alert("CEP não encontrado.");
                }
            });
        } else {
            alert("CEP inválido.");
        }
    });

    $('#btnFinalizarCompra').click(function() {
        alert('Compra finalizada com sucesso!');
        localStorage.removeItem('carrinho');
        window.location.href = 'index.jsp';
    });

    $('#btnVoltarCarrinho').click(function() {
        window.location.href = 'Carrinho.jsp';
    });
});
