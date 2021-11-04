package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import com.cibertec.entidad.Marca;

public interface MarcaServicio {
	
	public abstract List<Marca> listaMarca();
	public abstract Marca insertaActualizaMarca(Marca obj);
	public abstract Optional<Marca> obtienePorId(int idMarca);
	public abstract Marca insertaMarca(Marca obj);
	public abstract void eliminaMarca(int idMarca);
	public abstract List<Marca> listaMarcaPorNombreLike(String filtro);
	public abstract List<Marca> buscaPorId(int idMarca);
	

	
}
