package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Producto;

public interface ProductoRepositorio extends JpaRepository<Producto, Integer>{
	
	@Query("select a from Producto a where nombre like :fil")
	public abstract List<Producto> listaProductoPorNombreLike(@Param("fil") String filtro);
	
	
	@Query("Select x from Producto x where x.nombre like :var_fil")
	public List<Producto> listaproducto(@Param("var_fil") String filtro, Pageable pageable);

	
	public abstract List<Producto> findByNombre(String nombre);
	
	public abstract List<Producto> findByNombreAndIdProducto(String nombre, int idProducto);
	
	public abstract List<Producto> findByNombreOrIdProducto(String nombre, int idProducto);
	
}
