package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Familia;



public interface FamiliaRepositorio extends JpaRepository<Familia, Integer> {
	@Query("Select a from Familia a where nombre like :fil")
	public abstract List<Familia> listaFamiliaPorNombreLike(@Param("fil") String filtro);

	
}
