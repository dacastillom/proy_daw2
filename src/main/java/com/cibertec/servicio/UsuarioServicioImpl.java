package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Opcion;
import com.cibertec.entidad.Rol;
import com.cibertec.entidad.Usuario;
import com.cibertec.repositorio.UsuarioRepositorio;

@Service
public class UsuarioServicioImpl implements UsuarioServicio{

	@Autowired
	private UsuarioRepositorio repositorio;
	
	@Override
	public Usuario login(Usuario bean) {
		return repositorio.login(bean);
	}

	@Override
	public List<Opcion> traerEnlacesDeUsuario(int idUsuario) {
		return repositorio.traerEnlacesDeUsuario(idUsuario);
	}

	@Override
	public List<Rol> traerRolesDeUsuario(int idUsuario) {
		return repositorio.traerRolesDeUsuario(idUsuario);
	}

	@Override
	public Page<Usuario> findAll(Pageable pageable) {	
		return repositorio.findAll(pageable);
	}

	@Override
	public Usuario findById(int id) {		
		return repositorio.findById(id).orElse(null);
	}

	@Override
	public Usuario save(Usuario bean) {		
		return repositorio.save(bean);
	}

	@Override
	public void delete(int id) {
		repositorio.deleteById(id);		
	}

}
