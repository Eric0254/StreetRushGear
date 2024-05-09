package br.com.carstore.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDao;
import model.EnderecoEntrega;
import model.Cliente;

@WebServlet("/listarEndereco")
public class ListarEnderecoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClienteDao suaClasseDAO;

    public ListarEnderecoServlet() {
        super();
        this.suaClasseDAO = new ClienteDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cliente clienteLogado = (Cliente) request.getSession().getAttribute("clienteLogado");
        if (clienteLogado != null) {

            List<EnderecoEntrega> enderecosEntrega = suaClasseDAO.listarEnderecosEntrega(clienteLogado.getId());
            request.setAttribute("enderecosEntrega", enderecosEntrega);
            request.getRequestDispatcher("Perfil.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
