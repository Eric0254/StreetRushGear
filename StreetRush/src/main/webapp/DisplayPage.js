document.addEventListener("DOMContentLoaded", function () {
    const itemsPerPage = 20; // Número de cartões a serem carregados por clique no botão "Ver Mais"
    let currentPage = 1; // Número da página atual
    let currentItemsDisplayed = 0; // Número atual de cartões exibidos
    let totalItems = 0; // Número total de cartões
    const loadMoreButton = document.getElementById("load-more");
    const carList = document.getElementById("car-list");

    function fetchItems() {
        fetch('/display-page?page=' + currentPage)
            .then(response => response.json())
            .then(data => {
                totalItems = data.length; // Defina o número total de cartões

                const itemsToDisplay = data.slice(currentItemsDisplayed, currentItemsDisplayed + itemsPerPage);

                if (itemsToDisplay.length === 0) {
                    loadMoreButton.style.display = "none"; // Oculte o botão "Ver Mais" quando todos os cartões forem carregados
                }

                let cardsHTML = '';

                itemsToDisplay.forEach(product => {
                    cardsHTML += `
                                    <div class="col-md-3 test1">
                                        <a href="interno.jsp?id=${product.id}&imgurl=${product.imgurl}&name=${product.name}&description=${product.descricao}&price=${product.price}" class="deco">
                                            <div class="square-image">
                                                <img src="${product.imgurl}" alt="${product.name}" class="img-fluid rounded">
                                            </div>
                                            <p class="text tt1"><strong>${product.name}</strong></p>
                                            <p class="text tt1"><strong>R$ ${product.price}</strong></p>
                                        </a>
                                    </div>
                                `;
                });

                carList.innerHTML += cardsHTML;
                currentItemsDisplayed += itemsToDisplay.length;
                currentPage++;
            })
            .catch(error => console.error(error));
    }

    loadMoreButton.addEventListener("click", () => {
        fetchItems();
    });

    // Carregue os primeiros cartões iniciais
    fetchItems();



});