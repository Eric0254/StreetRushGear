package br.com.carstore.servlet;

import dao.usuarioDao;
import model.usuario;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


    @WebServlet("/AtualizarUsuarioServlet")
    public class AtualizarUsuarioServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            // Obter parâmetros do formulário
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String cpf = request.getParameter("cpf");
            String cargo = request.getParameter("cargo");
            String senha = request.getParameter("senha");
            String confirmarSenha = request.getParameter("confirmarSenha");
            String status = request.getParameter("status");


            usuarioDao usuariodao = new usuarioDao();
            usuario user = new usuario(id, nome, email,cpf,senha, confirmarSenha, cargo, status);

            usuariodao.updateProfile(user);


            // Redirecionar de volta para a lista de usuários após a atualização
            response.sendRedirect("lista-usuario");
        }
    }

