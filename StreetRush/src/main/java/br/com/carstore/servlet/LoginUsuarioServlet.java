package br.com.carstore.servlet;

import dao.usuarioDao;
import model.usuario;
import dao.ClienteDao;
import model.Cliente;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginUsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        ClienteDao clienteDao = new ClienteDao();
        Cliente cliente = clienteDao.obterClientePorEmailSenha(email,senha);

        usuarioDao usuarioDao = new usuarioDao();
        usuario usuario = usuarioDao.obterusuarioPorEmailSenha(email, senha);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuario);
            System.out.println("Sessão criada com sucesso. Usuário logado: " + usuario.getEmail()+usuario.getCargo());


            response.sendRedirect("ADM.jsp");

        } else if(cliente != null){
            HttpSession session = request.getSession();
            session.setAttribute("clienteLogado", cliente);
            System.out.println("Sessão criada com sucesso. Cliente logado: " + cliente.getEmail()+cliente.getNome());


            response.sendRedirect("index.jsp");
        }
        else {
            response.sendRedirect("loginErro.jsp");
        }
    }
}