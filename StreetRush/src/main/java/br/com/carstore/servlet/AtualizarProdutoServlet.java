package br.com.carstore.servlet;

import dao.ProdutoDAO;
import model.Produto;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AtualizarProdutoServlet")
public class AtualizarProdutoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        double avaliacao = Double.parseDouble(request.getParameter("avaliacao"));
        String descricao = request.getParameter("descricao");
        String preco = request.getParameter("preco");
        int qtdEstoque = Integer.parseInt(request.getParameter("qtdEstoque"));


        ProdutoDAO produtoDAO = new ProdutoDAO();
        Produto prod = new Produto();
        prod.setId(Integer.parseInt(id));
        prod.setNome(nome);
        prod.setAvaliacao(avaliacao);
        prod.setDescricao(descricao);
        prod.setPreco(Double.parseDouble(preco));
        prod.setQtdEstoque(qtdEstoque);
        produtoDAO.updateProduct(prod);



        // Redirecionar de volta para a lista de usuários após a atualização
        response.sendRedirect("lista-produto");
    }

}
