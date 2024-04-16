package br.com.carstore.servlet;
import dao.ClienteDao;
import model.Cliente;
import model.EnderecoFaturamento;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet("/cadastrarCliente")
public class CadastrarClienteServlet extends HttpServlet {
    private ClienteDao clienteDao;

    @Override
    public void init() throws ServletException {
        super.init();
        clienteDao = new ClienteDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 0;
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        String nascimento = request.getParameter("nascimento");
        String genero = request.getParameter("genero");
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");


        Cliente cliente = new Cliente(nome, email, cpf, senha, nascimento, genero);
        String Cep = request.getParameter("cep");
        EnderecoFaturamento enderecoFaturamento = new EnderecoFaturamento(cep, "", "", "", "", "", "");


        boolean sucesso = clienteDao.inserirCliente(cliente, enderecoFaturamento);
        if (sucesso) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("erro.jsp");
        }
    }
}
