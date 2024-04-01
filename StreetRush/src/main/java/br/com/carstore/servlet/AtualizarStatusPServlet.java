package br.com.carstore.servlet;

import dao.ProdutoDAO;
import dao.usuarioDao;
import model.Produto;
import model.usuario;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AtualizarStatusPServlet")
public class AtualizarStatusPServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Obter o ID do usuário da solicitação
        String id = request.getParameter("id");
        String status = request.getParameter("status");


        ProdutoDAO produtoDAO = new ProdutoDAO();
        Produto prod = new Produto();
        prod.setId(Integer.parseInt(id));
        prod.setStatus(status);
        if (prod != null) {
            System.out.println("Status antes da inversão: " + prod.getStatus());
            // Invertendo o status
            if ("Ativo".equals(prod.getStatus())) {
                prod.setStatus("Inativo");
            } else {
                prod.setStatus("Ativo");
            }
            System.out.println("Status após a inversão: " + prod.getStatus());

            produtoDAO.updateStatus(prod);

            response.sendRedirect("lista-produto");
        }
    }
}
