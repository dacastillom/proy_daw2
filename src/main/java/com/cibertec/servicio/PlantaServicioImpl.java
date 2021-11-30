package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Planta;
import com.cibertec.repositorio.PlantaRepositorio;

@Service
public class PlantaServicioImpl implements PlantaServicio{

	@Autowired
	private PlantaRepositorio repositorio;
	
	@Override
	public List<Planta> listaPlanta() {
		return repositorio.findAll();
	}

	

	

}
