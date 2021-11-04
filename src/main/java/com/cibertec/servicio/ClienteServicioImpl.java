package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Cliente;
import com.cibertec.repositorio.ClienteRepositorio;

@Service
public class ClienteServicioImpl implements ClienteServicio {

	@Autowired
	private ClienteRepositorio repositorio;



	@Override
	public List<Cliente> listaCliente() {
		return repositorio.findAll();

	}

	@Override
	public List<Cliente> listaClientePorNombres(String filtro) {
		return repositorio.listaPorNombres(filtro);
	}

	@Override
	public void eliminarCliente(int idCliente) {
		repositorio.deleteById(idCliente);
	}



	@Override
	public Cliente insertaActualizaCliente(Cliente obj) {
		return repositorio.save(obj);
	}

	
	
	
	//Adicionado 10 Junio - David Castillo
	@Override
	public List<Cliente> listaCliente(String filtro, Pageable pageable) {
		return repositorio.listaCliente(filtro, pageable);
	}





	@Override
	public Optional<Cliente> obtenerPorId(int idCliente) {
		return repositorio.findById(idCliente);
	}

	@Override
	public List<Cliente> obtienePorDni(String dni) {
		return repositorio.findByNombres(dni);
	}

	@Override
	public List<Cliente> obtienePorNombre(String nombres, String dni) {

		return repositorio.findByNombresOrDni(nombres, dni);
	}

	@Override
	public List<Cliente> obtienePorDni(String dni, int idCliente) {
		return repositorio.findByNombresAndIdCliente(dni, idCliente);
	}




}