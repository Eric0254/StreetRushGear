package br.com.carstore.servlet;
import model.usuario;
import dao.usuarioDao;
import security.Password;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-user")
public class CadastroUsuarioServlet extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = 0;
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        String confirmarSenha = request.getParameter("confirmarSenha");
        String cargo = request.getParameter("cargo");
        String status = "Ativo";

         if (!senha.equals(confirmarSenha)) {
             response.sendRedirect("cadastroErro.jsp");
             return;
         }

         String senhaCriptografada = Password.hashPassword(senha);

        usuario usuario = new usuario(id, nome, email, cpf, senhaCriptografada, confirmarSenha, cargo, status);

        usuarioDao  usuarioDao = new usuarioDao();
        boolean sucesso = usuarioDao.inserirUsuario(usuario);


        if (sucesso) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("cadastroErro.jsp");
        }
    }
}
