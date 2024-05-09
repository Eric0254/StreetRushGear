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
@WebServlet("/AtualizarClienteServlet")
public class AtualizarClienteServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        ClienteDao clienteDao = new ClienteDao();
        Cliente cli = new Cliente();
        cli.setNome(nome);
        cli.setEmail(email);
        cli.setCpf(cpf);
        cli.setSenha(senha);
        cli.setNascimento(nascimento);
        cli.setGenero(genero);

        EnderecoFaturamento fatu = new EnderecoFaturamento();
        fatu.setCep(cep);
        fatu.setLogradouro(logradouro);
        fatu.setNumero(numero);
        fatu.setComplemento(complemento);
        fatu.setBairro(bairro);
        fatu.setCidade(cidade);
        fatu.setUF(uf);

        clienteDao.atualizarCliente(cli, fatu);
        response.sendRedirect("Perfil.jsp");
    }
}
