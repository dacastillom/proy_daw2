package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Opcion;
import com.cibertec.entidad.Rol;
import com.cibertec.entidad.Usuario;

public interface UsuarioRepositorio extends JpaRepository<Usuario, Integer> {

	public abstract List<Usuario> findByLogin(String nombre);


	@Query("Select x from Usuario x where x.login = :#{#usu.login} and x.password = :#{#usu.password}")
	public abstract Usuario login(@Param(value = "usu") Usuario bean);

	@Query("select u from Usuario u where u.login=?1")
	public Usuario singin(String login);

	public Page<Usuario> findAll(Pageable pageable);

	@Query("Select p from Opcion p, RolHasOpcion pr, Rol r, UsuarioHasRol u where "
			+ " p.idOpcion = pr.opcion.idOpcion and " + " pr.rol.idRol = r.idRol and " + " r.idRol = u.rol.idRol and "
			+ " u.usuario.idUsuario = :var_idUsuario")
	public abstract List<Opcion> traerEnlacesDeUsuario(@Param("var_idUsuario") int idUsuario);

	@Query("Select r from Rol r, UsuarioHasRol u where " + " r.idRol = u.rol.idRol and "
			+ " u.usuario.idUsuario = :var_idUsuario")
	public abstract List<Rol> traerRolesDeUsuario(@Param("var_idUsuario") int idUsuario);

}
