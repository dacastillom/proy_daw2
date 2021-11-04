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
	public Cliente insertaCliente(Cliente obj) {
		return repositorio.save(obj);
	}

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
	public Optional<Cliente> obtenerPorId(int idCliente) {
		return repositorio.findById(idCliente);
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

}