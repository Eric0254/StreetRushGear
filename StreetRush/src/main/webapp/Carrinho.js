document.addEventListener("DOMContentLoaded", function () {
    const carrinhoItemsElement = document.getElementById("carrinho-items");
    const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    let total = 0;
    let valorFreteAtual = 0;

    if (carrinho.length === 0) {
        carrinhoItemsElement.innerHTML = "<p>Seu carrinho está vazio.</p>";
    } else {
        carrinho.forEach((item, index) => {
            const itemHTML = `
                <div class="carrinho-item row align-items-center bg-light p-2 mb-3 rounded">
                    <div class="col-md-2">
                        <img src="${item.imageUrl}" alt="${item.name}" class="img-fluid rounded" style="width: 100px; height: 100px;">
                    </div>
                    <div class="col-md-6">
                        <h4>${item.name}</h4>
                        <p>Preço: R$ ${item.price}</p>
                        <div class="input-group mb-3">
                            <button class="btn btn-outline-secondary diminuir-quantidade" data-index="${index}">-</button>
                            <input type="text" class="form-control quantidade" value="${item.quantidade}" readonly>
                            <button class="btn btn-outline-secondary aumentar-quantidade" data-index="${index}">+</button>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-sm btn-danger remover-item" data-index="${index}">Remover</button>
                    </div>
                </div>
            `;
            carrinhoItemsElement.innerHTML += itemHTML;
            total += parseFloat(item.price.replace('R$', '').trim()) * item.quantidade;
        });
    }

    const totalElement = document.createElement('p');
    totalElement.id = 'total-compra';
    totalElement.textContent = `Total: R$ ${total.toFixed(2)}`;
    carrinhoItemsElement.appendChild(totalElement);

    const botoesRemover = document.querySelectorAll(".remover-item");
    botoesRemover.forEach(botao => {
        botao.addEventListener("click", removerItemDoCarrinho);
    });

    const botoesAumentar = document.querySelectorAll(".aumentar-quantidade");
    botoesAumentar.forEach(botao => {
        botao.addEventListener("click", aumentarQuantidade);
    });

    const botoesDiminuir = document.querySelectorAll(".diminuir-quantidade");
    botoesDiminuir.forEach(botao => {
        botao.addEventListener("click", diminuirQuantidade);
    });

    // Calcular frete
    $('#btnCalcularFrete').click(function() {
        $('#opcoes-frete').show();
    });

    $('#opcoes-frete').change(function() {
        const freteValor = parseFloat($(this).val());
        const totalCompraAtual = parseFloat(totalElement.textContent.replace('Total: R$ ', ''));

        // Atualiza o total da compra subtraindo o frete anterior e adicionando o novo valor de frete
        const novoTotalCompra = totalCompraAtual - valorFreteAtual + freteValor;
        totalElement.textContent = `Total: R$ ${novoTotalCompra.toFixed(2)}`;
        valorFreteAtual = freteValor;
    });
});

function adicionarItemAoCarrinho(item) {
    let carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    const itemNoCarrinho = carrinho.find(el => el.id === item.id);
    if (itemNoCarrinho) {
        itemNoCarrinho.quantidade++;
    } else {
        item.quantidade = 1;
        carrinho.push(item);
    }
    localStorage.setItem("carrinho", JSON.stringify(carrinho));
}

function removerItemDoCarrinho(event) {
    const index = event.target.dataset.index;
    let carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    carrinho.splice(index, 1);
    localStorage.setItem("carrinho", JSON.stringify(carrinho));
    location.reload(); // Atualiza a página para refletir as alterações no carrinho
}

function aumentarQuantidade(event) {
    const index = event.target.dataset.index;
    let carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    carrinho[index].quantidade++;
    localStorage.setItem("carrinho", JSON.stringify(carrinho));
    location.reload();
}

function diminuirQuantidade(event) {
    const index = event.target.dataset.index;
    let carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    if (carrinho[index].quantidade > 1) {
        carrinho[index].quantidade--;
        localStorage.setItem("carrinho", JSON.stringify(carrinho));
        location.reload();
    } else {
        if (confirm("Deseja remover este item do carrinho?")) {
            carrinho.splice(index, 1);
            localStorage.setItem("carrinho", JSON.stringify(carrinho));
            location.reload();
        }
    }
}

$(document).ready(function() {
    $("#cep").on("input", function() {
        var cep = $(this).val().replace(/\D/g, ''); // Remove todos os caracteres não numéricos
        if (cep.length > 8) {
            cep = cep.slice(0, 8);
        }
        cep = cep.replace(/(\d{5})(\d)/, "$1-$2"); // Aplica a máscara de CEP
        $(this).val(cep);
    });

    $("#cep").on("blur", function() {
        var cep = $(this).val().replace(/\D/g, '');
        if (cep !== "" && cep.length === 8) {
            $.getJSON("https://viacep.com.br/ws/" + cep + "/json/", function(data) {
                if (!("erro" in data)) {
                    $("#logradouro").val(data.logradouro);
                    $("#complemento").val(data.complemento);
                    $("#bairro").val(data.bairro);
                    $("#cidade").val(data.localidade);
                    $("#uf").val(data.uf);
                } else {
                    alert("CEP não encontrado.");
                }
            });
        } else {
            alert("CEP inválido.");
        }
    });

    $('#btnPagar').click(function() {
        const opcaoSelecionada = $('input[name="opcaoCompra"]:checked').val();
        if (opcaoSelecionada) {
            window.location.href = `Pagamento.jsp?opcao=${opcaoSelecionada}`;
        } else {
            alert('Por favor, selecione uma opção de compra.');
        }
    });

});
