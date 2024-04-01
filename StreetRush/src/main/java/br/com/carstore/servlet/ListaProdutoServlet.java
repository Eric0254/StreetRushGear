package br.com.carstore.servlet;

import dao.ProdutoDAO;
import model.Produto;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

    @WebServlet("/lista-produto")
    public class ListaProdutoServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("usuarioLogado") == null) {
                // Redireciona para a página de acesso negado se o usuário não estiver autorizado
                response.sendRedirect("accessDenied.jsp");
                return;
            }

            List<Produto> prods = new ProdutoDAO().ShowProduct();


            Collections.sort(prods,(p1, p2) -> p2.getId() - p1.getId());

            request.setAttribute("prods", prods);

            request.getRequestDispatcher("listaProdutos.jsp").forward(request,response);
        }



}