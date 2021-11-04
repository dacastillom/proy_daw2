package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;

import com.cibertec.entidad.Producto;

public interface ProductoServicio {

	public abstract Producto create(Producto obj);
	public abstract List<Producto> listaProducto();
	public abstract Producto insertaActualizaProducto(Producto obj);
	public abstract Optional<Producto> obtienePorId(int idProducto);
	public abstract void eliminaProducto(int id);
	public abstract List<Producto> listaProductoPorNombreLike(String filtro);

	
	public abstract List<Producto> obtienePorNombre(String nombre, int idProducto);
	//adicionado 10 Junio - David Castillo
	public List<Producto> listaproducto(String filtro, Pageable pageable);
}
