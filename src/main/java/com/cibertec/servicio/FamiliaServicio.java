package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import com.cibertec.entidad.Familia;

public interface FamiliaServicio {
	
	public abstract List<Familia> listaFamilia();
	public abstract Familia insertaActualizaFamilia(Familia obj);
	public abstract Optional<Familia> obtienePorId(int idFamilia);
	public abstract Familia insertaFamilia(Familia obj);
	public abstract void eliminaFamilia(int idFamilia);
	public abstract List<Familia> listaFamiliaPorNombreLike(String filtro);
	public abstract List<Familia> buscaPorId(int idFamilia);
	

	
}
