package com.cibertec.servicio;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.cibertec.entidad.Opcion;
import com.cibertec.entidad.Rol;
import com.cibertec.entidad.Usuario;

public interface UsuarioServicio {

	public abstract Usuario login(Usuario bean);

	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);

	public Page<Usuario> findAll(Pageable pageable);

	public Usuario findById(int id);

	public Usuario save(Usuario bean);

	public void delete(int id);

}
