package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Cliente;

public interface ClienteRepositorio extends JpaRepository<Cliente, Integer> {

	@Query("Select a from Cliente a where nombres like :fil")
	public abstract List<Cliente> listaPorNombres(@Param("fil") String filtro);
	
	@Query("Select x from Cliente x where nombres like :var_filtro or apellidos like :var_filtro")
	public abstract List<Cliente> listaCliente(@Param("var_filtro") String filtro, Pageable pageable);

	
}
