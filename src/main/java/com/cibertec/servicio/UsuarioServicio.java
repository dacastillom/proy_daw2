package com.cibertec.servicio;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

 
import com.cibertec.entidad.Usuario;
import com.cibertec.entidad.UsuarioHasRol;

public interface UsuarioServicio {

	public abstract Usuario login(Usuario bean);

	public abstract Usuario Singin(String login);
	
	// public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	// public abstract List<Rol> traerRolesDeUsuario(int idUsuario);

	public UsuarioHasRol saveHasRol(UsuarioHasRol  bean);
	public Page<Usuario> findAll(Pageable pageable);

	public Usuario findById(int id);

	public Usuario save(Usuario bean);

	public void delete(int id);

}
