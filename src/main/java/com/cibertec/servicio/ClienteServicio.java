package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;

import com.cibertec.entidad.Cliente;

public interface ClienteServicio {

	
	public abstract List<Cliente> listaCliente();	
	public abstract Cliente insertaActualizaCliente(Cliente obj);
	public abstract Optional<Cliente> obtenerPorId(int idCliente);
	public abstract void eliminarCliente(int idCliente);
	public abstract List<Cliente> listaClientePorNombres(String filtro);
	
		
	public abstract List<Cliente> obtienePorDni(String dni);
	
	public abstract List<Cliente> obtienePorDni(String dni,int idCliente);
	

	
	
	//adicionado 10 Junio - David Castillo
	public abstract List<Cliente> listaCliente(String filtro , Pageable pageable) ;
	List<Cliente> obtienePorNombre(String nombres, String dni);

}