package org.com.proyecto.geekmitive.controller;

import org.com.proyecto.geekmitive.entity.Usuario;
import org.com.proyecto.geekmitive.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RequestMapping("/geekmitive")
@RestController
public class UsuarioController {

    @Autowired
    UsuarioRepository usuarioRepository;

    @GetMapping("/usuarios/getAll")
    public List<Usuario> getUsuarios(){
        return usuarioRepository.findAll();
    }
    @CrossOrigin(maxAge = 3600)
    @GetMapping("/usuarios/getByNickPass")
    public Usuario getUsuarios(@RequestParam String nickName, @RequestParam String password){
        Usuario usuario = usuarioRepository.findAll()
                .stream()
                .filter(u-> u.getNickname().equals(nickName) && u.getPassword().equals(password))
                .findFirst()
                .orElse(null);
        if (usuario == null){
            throw new NoSuchElementException();
        } else {
            return usuario;
        }
    }
}