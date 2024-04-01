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
              <option value="0.5" ${param.avaliacao == '0.5' ? 'selected' : ''}>0.5</option>
              <option value="1" ${param.avaliacao == '1' ? 'selected' : ''}>1</option>
              <option value="1.5" ${param.avaliacao == '1.5' ? 'selected' : ''}>1.5</option>
              <option value="2" ${param.avaliacao == '2' ? 'selected' : ''}>2</option>
              <option value="2.5" ${param.avaliacao == '2.5' ? 'selected' : ''}>2.5</option>
              <option value="3" ${param.avaliacao == '3' ? 'selected' : ''}>3</option>
              <option value="3.5" ${param.avaliacao == '3.5' ? 'selected' : ''}>3.5</option>
              <option value="4" ${param.avaliacao == '4' ? 'selected' : ''}>4</option>
              <option value="4.5" ${param.avaliacao == '4.5' ? 'selected' : ''}>4.5</option>
              <option value="5" ${param.avaliacao == '5' ? 'selected' : ''}>5</option>
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
