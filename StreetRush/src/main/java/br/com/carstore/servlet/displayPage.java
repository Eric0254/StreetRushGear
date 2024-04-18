package br.com.carstore.servlet;

import dao.ProdutoDAO;
import model.Produto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/display-page")
public class displayPage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Produto> products = new ProdutoDAO().ShowProduct();

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        out.print("[");
        for (int i = 0; i < products.size(); i++) {
            Produto product = products.get(i);
            out.print("{");
            out.print("\"id\":\"" + product.getId() + "\",");
            out.print("\"name\":\"" + product.getNome() + "\",");
            out.print("\"descricao\":\"" + product.getDescricao() + "\",");
            out.print("\"price\":" + product.getPreco() + ",");
            out.print("\"imgurl\":\"" + req.getContextPath() + "/img/" + product.getImagemPrincipal() + "\"");
            out.print("}");
            if (i < products.size() - 1) {
                out.print(",");
            }
        }
        out.print("]");

    }
}
