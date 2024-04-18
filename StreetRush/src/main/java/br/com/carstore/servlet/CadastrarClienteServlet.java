package br.com.carstore.servlet;

import dao.ClienteDao;
import model.Cliente;
import model.EnderecoFaturamento;
import security.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/cadastrarCliente")
public class CadastrarClienteServlet extends HttpServlet {
    private ClienteDao clienteDao;

    @Override
    public void init() throws ServletException {
        super.init();
        clienteDao = new ClienteDao();
    }

    private String formatarData(String data) {
        try {
            SimpleDateFormat sdfEntrada = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdfSaida = new SimpleDateFormat("yyyy-MM-dd");

            Date date = sdfEntrada.parse(data);

            return sdfSaida.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
            System.err.println("Erro ao formatar data: " + e.getMessage());
            return null;
        }
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

        String senhaCriptografada = Password.hashPassword(senha);

        Cliente cliente = new Cliente(id, nome, email, cpf, senhaCriptografada, nascimento, genero);
        EnderecoFaturamento enderecoFaturamento = new EnderecoFaturamento(cep, logradouro, numero, complemento, bairro, cidade, uf);

        boolean sucesso = clienteDao.inserirCliente(cliente, enderecoFaturamento);
        if (sucesso) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("erro.jsp");
        }
    }
}
