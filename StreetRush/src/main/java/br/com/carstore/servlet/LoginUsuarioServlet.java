package br.com.carstore.servlet;

import dao.usuarioDao; // Certifique-se de importar a classe correta
import model.usuario; // Certifique-se de importar a classe correta

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
        // Obtenha os parâmetros do formulário
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Verifique se o usuário existe no banco de dados
        usuarioDao usuarioDao = new usuarioDao(); // Certifique-se de ter a lógica para obter a conexão
        usuario usuario = usuarioDao.obterusuarioPorEmailSenha(email, senha);

        // Verifique se o usuário foi encontrado
        if (usuario != null) {
            // Se o usuário existe, crie uma sessão e armazene informações do usuário nela
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuario);

            // Redirecione para a página principal ou alguma outra página de boas-vindas
            response.sendRedirect("dashboard.jsp");
        } else {
            // Se o usuário não foi encontrado, redirecione para uma página de erro de login
            response.sendRedirect("loginErro.jsp");
        }
    }
}