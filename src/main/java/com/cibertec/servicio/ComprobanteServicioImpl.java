package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Comprobante;
import com.cibertec.repositorio.ComprobanteRepositorio;

@Service
public class ComprobanteServicioImpl implements ComprobanteServicio {

	@Autowired
	private ComprobanteRepositorio repositorio;
	


	@Override
	public List<Comprobante> listaComprobantePorCodigoCliente(int idCliente) {
		
		return repositorio.findAll();
	}



	@Override
	public List<Comprobante> listaComprobante() {
		return repositorio.findAll();
	}

}
