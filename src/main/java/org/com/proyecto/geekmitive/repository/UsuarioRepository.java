package org.com.proyecto.geekmitive.repository;

import org.com.proyecto.geekmitive.entity.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
 
}
