package br.com.carstore.servlet;

import dao.usuarioDao;
import model.usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/lista-usuario")
public class ListaUsuarioServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<usuario> users = new usuarioDao().showUser();

        request.setAttribute("users", users);

        request.getRequestDispatcher("lista.jsp").forward(request,response);
    }



}