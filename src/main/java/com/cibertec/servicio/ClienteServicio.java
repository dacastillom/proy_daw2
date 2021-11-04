package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;

import com.cibertec.entidad.Cliente;

public interface ClienteServicio {

	public abstract Cliente insertaCliente(Cliente obj);

	public abstract List<Cliente> listaCliente();

	public abstract List<Cliente> listaClientePorNombres(String filtro);

	public abstract void eliminarCliente(int idCliente);

	public abstract Optional<Cliente> obtenerPorId(int idCliente);

	public abstract Cliente insertaActualizaCliente(Cliente obj);
	
	
	//adicionado 10 Junio - David Castillo
	public abstract List<Cliente> listaCliente(String filtro , Pageable pageable) ;

}