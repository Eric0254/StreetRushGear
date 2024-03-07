package com.example.streetrushgear.Controller;
import com.example.streetrushgear.Dao.UsuarioDao;
import com.example.streetrushgear.Model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
public class UsuarioController {
    private final UsuarioDao usuarioDao;

    @Autowired
    public UsuarioController(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    @PostMapping("/inserir")
    public String inserirUsuario(@RequestBody Usuario usuario) {
        if (usuarioDao.inserirUsuario(usuario)) {
            return "Usuário inserido com sucesso!";
        } else {
            return "Erro ao inserir usuário.";
        }
    }

    @PostMapping("/login")
    public String loginUsuario(@RequestBody Usuario usuario) {
        Usuario usuarioAutenticado = usuarioDao.obterusuarioPorEmailSenha(usuario.getEmail(), usuario.getSenha());

        if (usuarioAutenticado != null) {
            return "Login bem-sucedido!";
        } else {
            return "Credenciais inválidas. Tente novamente.";
        }
    }
}
