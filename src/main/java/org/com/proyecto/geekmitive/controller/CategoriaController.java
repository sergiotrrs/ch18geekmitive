package org.com.proyecto.geekmitive.controller;

import org.com.proyecto.geekmitive.entity.Categoria;
import org.com.proyecto.geekmitive.repository.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/geekmitive")
public class CategoriaController {

    @Autowired
    CategoriaRepository categoriaRepository;

    @CrossOrigin(maxAge = 3600)
    @GetMapping("categorias/getAll")
    public List<Categoria> getAllCategorias(){
        return categoriaRepository.findAll();
    }
}
