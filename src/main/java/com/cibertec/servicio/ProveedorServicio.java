package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import com.cibertec.entidad.Proveedor;


public interface ProveedorServicio {
	
	public abstract List<Proveedor> listaProveedor();
	public abstract Proveedor insertaActualizaCrudProveedor(Proveedor obj);
	public abstract Optional<Proveedor> obtienePorId(int idProveedor);
	public abstract void eliminaAlumno(int id);
	public abstract List<Proveedor> listaProveedorPorNombreLike(String filtro);
	
	public abstract List<Proveedor> obtienePorRuc(String ruc);
	public abstract List<Proveedor> obtienePorRuc(String ruc, int idProveedor);

	public List<Proveedor> listaPorRucAndRazonSocial(String ruc, String razonsocial);

	
	
}
