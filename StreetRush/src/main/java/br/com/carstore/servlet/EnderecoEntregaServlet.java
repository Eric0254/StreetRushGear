package br.com.carstore.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

import dao.ClienteDao;
import model.EnderecoEntrega;

public class EnderecoEntregaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer clienteId = (Integer) request.getSession().getAttribute("clienteId");

        if (clienteId != null) {
            String cep = request.getParameter("cep");
            String logradouro = request.getParameter("logradouro");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("cidade");
            String uf = request.getParameter("uf");

            EnderecoEntrega enderecoEntrega = new EnderecoEntrega(cep, logradouro, numero, complemento, bairro, cidade, uf);

            ClienteDao clienteDao = new ClienteDao();
            boolean inserido = clienteDao.adicionarEnderecoEntrega(clienteId, enderecoEntrega);

            if (inserido) {
                response.sendRedirect("Perfil.jsp");
            } else {
                response.sendRedirect("erro.jsp");
            }
        } else {
            response.sendRedirect("pagina-de-login.jsp");
        }
    }

}
