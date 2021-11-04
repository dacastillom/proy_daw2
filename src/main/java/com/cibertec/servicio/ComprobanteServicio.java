package com.cibertec.servicio;

import java.util.List;


import com.cibertec.entidad.Comprobante;

public interface ComprobanteServicio {

	
	public List<Comprobante> listaComprobantePorCodigoCliente(int idCliente);
	
	public abstract List<Comprobante> listaComprobante();
}
