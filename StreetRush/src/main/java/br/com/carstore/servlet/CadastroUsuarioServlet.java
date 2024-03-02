package br.com.carstore.servlet;
import model.usuario;
import dao.usuarioDao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-user")
public class CadastroUsuarioServlet extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Obtenha os parâmetros do formulário
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        String confirmarSenha = request.getParameter("confirmarSenha");

        // Crie um objeto Usuario com os parâmetros recebidos
        usuario usuario = new usuario(nome, email, cpf, senha, confirmarSenha);

        // Insira o usuário no banco de dados
        usuarioDao  usuarioDao = new usuarioDao(); // Certifique-se de ter a lógica para obter a conexão
        boolean sucesso = usuarioDao.inserirUsuario(usuario);

        // Redirecione para uma página de sucesso ou erro com base no resultado da inserção
        if (sucesso) {
            response.sendRedirect("dashboard.jsp"); // Página de sucesso
        } else {
            response.sendRedirect("cadastroErro.jsp"); // Página de erro
        }
    }
}
