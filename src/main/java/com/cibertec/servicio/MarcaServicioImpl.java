package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Marca;
import com.cibertec.repositorio.MarcaRepositorio;

@Service
public class MarcaServicioImpl implements MarcaServicio {

	@Autowired
	private MarcaRepositorio repositorio;

	@Override
	public Marca insertaMarca(Marca obj) {

		return repositorio.save(obj);
	}

	@Override
	public List<Marca> listaMarca() {
		return repositorio.findAll();
	}

	@Override
	public Marca insertaActualizaMarca(Marca obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaMarca(int idMarca) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Marca> listaMarcaPorNombreLike(String filtro) {
		return repositorio.listaMarcaPorNombreLike(filtro);
	}

	@Override
	public List<Marca> buscaPorId(int idMarca) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public Optional<Marca> obtienePorId(int idMarca) {
		// TODO Auto-generated method stub
		return repositorio.findById(idMarca);
	}

}
