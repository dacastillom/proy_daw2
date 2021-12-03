package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Producto;
import com.cibertec.repositorio.ProductoRepositorio;

@Service
public class ProductoServicioImpl implements ProductoServicio {

	@Autowired
	private ProductoRepositorio repositorio;

	@Override
	public Producto create(Producto obj) {

		return repositorio.save(obj);
	}

	@Override
	public List<Producto> listaProducto() {
		return repositorio.findAll();
	}

	@Override
	public Producto insertaActualizaProducto(Producto obj) {
		return repositorio.save(obj);
	}

	@Override
	public Optional<Producto> obtienePorId(int idProducto) {
		return repositorio.findById(idProducto);
	}

	@Override
	public void eliminaProducto(int id) {
		repositorio.deleteById(id);
	}

	@Override
	public List<Producto> listaProductoPorNombreLike(String filtro) {
		return repositorio.listaProductoPorNombreLike(filtro);
	}

	
	//adicionado 10 de Junio - David Castillo
	@Override
	public List<Producto> listaPorFiltroproducto(String filtro, Pageable pegable) {
		return repositorio.listaproducto(filtro, pegable);
	}

	@Override
	public List<Producto> obtienePorNombre(String nombre, int idProducto) {
		return repositorio.findByNombreAndIdProducto(nombre, idProducto);
	}
}
