package br.com.carstore.servlet;

import dao.usuarioDao;
import model.usuario;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AtualizarStatusServlet")
public class AtualizarStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Obter o ID do usuário da solicitação
        int userId = Integer.parseInt(request.getParameter("userId"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String cargo = request.getParameter("cargo");
        String senha = request.getParameter("senha");
        String confirmarSenha = request.getParameter("confirmarSenha");
        String status = request.getParameter("status");

        System.out.println(status);



        usuarioDao usuariodao = new usuarioDao();
        usuario user = new usuario(userId, nome, email, cpf, senha, confirmarSenha, cargo, status);
        if (user != null) {
            System.out.println("Status antes da inversão: " + user.getStatus());
            // Invertendo o status
            if ("Ativo".equals(user.getStatus())) {
                user.setStatus("Inativo");
            } else {
                user.setStatus("Ativo");
            }
            System.out.println("Status após a inversão: " + user.getStatus());

            usuariodao.updateStatus(user);

            response.sendRedirect("lista-usuario");
        }
    }
}
