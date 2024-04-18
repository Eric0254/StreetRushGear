package br.com.carstore.servlet;

import dao.ClienteDao;
import model.Cliente;
import model.EnderecoFaturamento;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/obterCliente")
public class ObterClienteServlet extends HttpServlet {
    private ClienteDao clienteDao;

    @Override
    public void init() throws ServletException {
        super.init();
        clienteDao = new ClienteDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("cliente") != null) {
            Cliente clienteSession = (Cliente) session.getAttribute("cliente");

            Cliente cliente = clienteDao.obterClientePorEmail(clienteSession.getEmail());


            if (cliente != null) {
                session.setAttribute("cliente", cliente);
                request.getRequestDispatcher("Perfil.jsp").forward(request, response);
                response.sendRedirect("obterCliente");
            } else {
                response.sendRedirect("erro.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

}
