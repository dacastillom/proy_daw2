package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Proveedor;
import com.cibertec.repositorio.ProveedorRepositorio;

@Service
public class ProveedorServicioImpl implements ProveedorServicio {

	
	@Autowired
	private ProveedorRepositorio repositorio;


	@Override
	public List<Proveedor> listaProveedor() {
		return repositorio.findAll();
	}
	
	@Override
	public Proveedor insertaActualizaCrudProveedor(Proveedor obj) {
		return repositorio.save(obj);
	}

	@Override
	public void eliminaAlumno(int id) {
		repositorio.deleteById(id);
	}

	@Override
	public List<Proveedor> listaProveedorPorNombreLike(String filtro) {
		return repositorio.listaProveedorPorNombreLike(filtro);
	}


	@Override
	public Optional<Proveedor> obtienePorId(int idProveedor) {
		return repositorio.findById(idProveedor);
	}	
	


	@Override
	public List<Proveedor> obtienePorRuc(String ruc) {
		return repositorio.findByRuc(ruc);
	}

	@Override
	public List<Proveedor> obtienePorRuc(String ruc, int idProveedor) {
		return repositorio.findByRucAndIdProveedorNot(ruc, idProveedor);
	}

	@Override
	public List<Proveedor> listaPorRucAndRazonSocial(String ruc, String razonsocial) {
		return repositorio.findByRucOrRazonsocial(ruc, razonsocial);
	}
	
}
