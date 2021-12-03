 
package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
 
import com.cibertec.entidad.Rol;

public interface RolRepositorio extends JpaRepository<Rol, Integer>{
	
	public abstract List<Rol> findByIdRol(Integer idRol);
}

 
