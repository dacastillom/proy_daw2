package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Familia;
import com.cibertec.repositorio.FamiliaRepositorio;

@Service
public class FamiliaServicioImpl implements FamiliaServicio {

	@Autowired
	private FamiliaRepositorio repositorio;

	@Override
	public Familia insertaFamilia(Familia obj) {

		return repositorio.save(obj);
	}

	@Override
	public List<Familia> listaFamilia() {
		return repositorio.findAll();
	}

	@Override
	public Familia insertaActualizaFamilia(Familia obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminaFamilia(int idFamilia) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Familia> listaFamiliaPorNombreLike(String filtro) {
		return repositorio.listaFamiliaPorNombreLike(filtro);
	}

	@Override
	public List<Familia> buscaPorId(int idFamilia) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public Optional<Familia> obtienePorId(int idFamilia) {
		// TODO Auto-generated method stub
		return repositorio.findById(idFamilia);
	}

}
