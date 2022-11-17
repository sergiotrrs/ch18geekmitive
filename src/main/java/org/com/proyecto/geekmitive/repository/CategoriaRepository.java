package org.com.proyecto.geekmitive.repository;


import org.com.proyecto.geekmitive.entity.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface CategoriaRepository extends JpaRepository<Categoria, Long> {

}
