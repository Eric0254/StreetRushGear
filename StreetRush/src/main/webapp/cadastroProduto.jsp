<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Produto</title>
  <link rel="stylesheet" href="styleCadastroProduto.css">
</head>
<body>
  <div class="container">
    <h1>Cadastro de Produto</h1>
    <form id="productForm" action="/produto" method="post" enctype="multipart/form-data">
      <label for="productName">Nome do Produto:</label>
      <input type="text" id="productName" name="nome" maxlength="200" required>

      <label for="productRating">Avaliação:</label>
      <select id="productRating" name="avaliacao" required>
        <option value="0.5">0.5</option>
        <!-- Restante das opções de avaliação -->
      </select>

      <label for="productDescription">Descrição Detalhada:</label>
      <textarea id="productDescription" name="descricao" maxlength="2000" required></textarea>

      <label for="productPrice">Preço do Produto:</label>
      <input type="text" id="productPrice" name="preco" placeholder="0.00" required>

      <label for="productStock">Quantidade em Estoque:</label>
      <input type="number" id="productStock" name="qtdEstoque" min="0" required>

      <label for="productImages">Imagens do Produto:</label>
      <div class="file-upload-container">
        <input type="file" id="productImages" name="fileParts" multiple accept="image/*" required>
      </div>

      <div id="imagePreview" class="image-preview"></div>

      <label for="mainImageSelect">Imagem Principal:</label>
      <select id="mainImageSelect" name="imagemPrincipal" required>
        <!-- Opções serão preenchidas dinamicamente via JavaScript -->
      </select>

      <button type="submit">Salvar</button>
      <button type="button" onclick="cancel()">Cancelar</button>
    </form>
  </div>
  <script src="scriptCadastroProduto.js"></script>
</body>
</html>
