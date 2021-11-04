package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.TipoReclamo;
import com.cibertec.repositorio.TipoReclamoRepositorio;
@Service
public class TipoReclamoServiceImpl implements TipoReclamoServicio {

	@Autowired
	private TipoReclamoRepositorio repositorio;
	
	@Override
	public List<TipoReclamo> listaTipoReclamo() {
		return repositorio.findAll();
	}

}
