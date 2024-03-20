package br.com.carstore.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import dao.ProdutoDAO;
import model.Produto;

@WebServlet("/produto")
@MultipartConfig
public class ProdutoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        double avaliacao = Double.parseDouble(request.getParameter("avaliacao"));
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int qtdEstoque = Integer.parseInt(request.getParameter("qtdEstoque"));
        String imagemPrincipal = request.getParameter("imagemPrincipal");
        List<Part> parts = (List<Part>) request.getParts();
        List<String> images = uploadImages(request, parts);

        Produto product = new Produto();
        product.setNome(nome);
        product.setAvaliacao(avaliacao);
        product.setDescricao(descricao);
        product.setPreco(preco);
        product.setQtdEstoque(qtdEstoque);
        product.setImagemPrincipal(imagemPrincipal);
        product.setImagens(images);

        // Salvar no banco de dados
        ProdutoDAO.addProduct(product);

        response.sendRedirect("lista-produto");
    }

    private List<String> uploadImages(HttpServletRequest request, List<Part> parts) throws IOException, ServletException {
        List<String> imagens = new ArrayList<>();
        String uploadDir = "C:\\Users\\Gabriel\\Desktop\\teste"; // Diretório onde as imagens serão salvas

        for (Part part : parts) {
            String fileName = getFileName(part);
            if (fileName != null && !fileName.isEmpty()) {
                // Salvando a imagem no diretório
                String filePath = uploadDir + File.separator + fileName;
                part.write(filePath);
                imagens.add(filePath);
            }
        }
        return imagens;
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
