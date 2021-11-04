package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Proveedor;

public interface ProveedorRepositorio extends JpaRepository<Proveedor, Integer> {

	@Query("Select a from Proveedor a where razonsocial like :fil")
	public abstract List<Proveedor> listaProveedorPorNombreLike(@Param("fil") String filtro);

	public abstract List<Proveedor> findByRuc(String ruc);

	public abstract List<Proveedor> findByRucAndIdProveedorNot(String ruc, int idProveedor);

	 
	public abstract List<Proveedor> findByRucOrRazonsocial(String ruc, String razonsocial);
}
