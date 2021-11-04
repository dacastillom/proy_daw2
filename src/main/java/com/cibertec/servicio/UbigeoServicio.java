package com.cibertec.servicio;

import java.util.List;

import com.cibertec.entidad.Ubigeo;

public interface UbigeoServicio {

	public abstract List<String> listaDepartamentos();
	public abstract List<String> listaProvincias(String departamento);
	public abstract List<Ubigeo> listaDistritos(String departamento, String provincia);
	
		
}
