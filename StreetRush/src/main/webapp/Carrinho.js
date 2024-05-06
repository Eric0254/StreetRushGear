document.addEventListener("DOMContentLoaded", function () {
    const carrinhoItemsElement = document.getElementById("carrinho-items");
    const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    let total = 0;

    if (carrinho.length === 0) {
        carrinhoItemsElement.innerHTML = "<p>Seu carrinho está vazio.</p>";
    } else {
        carrinho.forEach((item, index) => {
            const itemHTML = `
                <div class="carrinho-item">
                    <img src="${item.imageUrl}" alt="${item.name}">
                    <div>
                        <h3>${item.name}</h3>
                        <p>${item.description}</p>
                        <p>Preço: R$ ${item.price}</p>
                        <button class="remover-item" data-index="${index}">Remover</button>
                    </div>
                </div>
            `;
            carrinhoItemsElement.innerHTML += itemHTML;
            total += parseFloat(item.price.replace('R$', '').trim());
        });
    }

    const totalElement = document.createElement('p');
    totalElement.textContent = `Total: R$ ${total.toFixed(2)}`;
    carrinhoItemsElement.appendChild(totalElement);

    const botoesRemover = document.querySelectorAll(".remover-item");
    botoesRemover.forEach(botao => {
        botao.addEventListener("click", removerItemDoCarrinho);
    });
});

function removerItemDoCarrinho(event) {
    const index = event.target.dataset.index;
    let carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    carrinho.splice(index, 1);
    localStorage.setItem("carrinho", JSON.stringify(carrinho));
    location.reload(); // Atualiza a página para refletir as alterações no carrinho
}
