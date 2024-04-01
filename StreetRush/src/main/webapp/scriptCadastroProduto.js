document.addEventListener("DOMContentLoaded", function() {
  const imageInput = document.getElementById("productImages");
  const imagePreviewContainer = document.getElementById("imagePreview");
  const mainImageSelect = document.getElementById("mainImageSelect");

  // Listener para quando o usuário seleciona imagens
  imageInput.addEventListener("change", function(event) {
    imagePreviewContainer.innerHTML = ""; // Limpa a pré-visualização antes de adicionar novas imagens

    const files = event.target.files; // Obtém os arquivos selecionados

    if (files) {
      for (const file of files) {
        const reader = new FileReader(); // Cria um objeto FileReader para ler os dados da imagem
        reader.onload = function (e) {
          const imageElement = document.createElement("img"); // Cria um elemento <img> para exibir a imagem
          imageElement.src = e.target.result; // Define o src da imagem como o resultado da leitura do arquivo
          imageElement.classList.add("preview-image"); // Adiciona uma classe para estilização opcional

          imagePreviewContainer.appendChild(imageElement); // Adiciona a imagem à pré-visualização
        };
        reader.readAsDataURL(file); // Lê o arquivo como uma URL de dados
      }
    }

    // Atualizar opções do select de imagem principal
    mainImageSelect.innerHTML = ""; // Limpa as opções existentes
    if (files) {
      for (const file of files) {
        const option = document.createElement("option");
        option.value = file.name; // Valor da opção é o nome do arquivo
        option.text = file.name; // Texto da opção é o nome do arquivo
        mainImageSelect.appendChild(option); // Adiciona a opção ao select
      }
    }
  });

  // Ajuste para o formato do preço
  const priceInput = document.getElementById("productPrice");
  priceInput.addEventListener("input", function(event) {
    let value = event.target.value.replace(/[^\d.]/g, ""); // Remove caracteres não numéricos, exceto o ponto
    value = value.replace(/^(\d+\.\d{2}).*$/, "$1"); // Permite apenas duas casas decimais
    event.target.value = value;
  });

  // Função para cancelar o envio do formulário
  function cancel() {
    // Redireciona para a página de lista de produtos (página de destino não implementada neste exemplo)
    window.location.href = "lista-produto";
  }
});
