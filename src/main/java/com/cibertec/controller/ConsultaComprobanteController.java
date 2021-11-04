package com.cibertec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Comprobante;
import com.cibertec.servicio.ComprobanteServicio;

/*
 * @author Luciano Rocca Talavera - T5WM
 * 
 * 
 * */


@Controller
public class ConsultaComprobanteController {

	@Autowired
	private ComprobanteServicio comprobanteServicio;
	
	@ResponseBody
	@RequestMapping("/consultaComprobantePor")
	public List<Comprobante> listaComrpobantePorCodigoCliente(int idCliente) {
		List<Comprobante> obj = comprobanteServicio.listaComprobantePorCodigoCliente(idCliente);

		System.out.println(obj);
		if (obj.size() == 0) {
			return comprobanteServicio.listaComprobante();
		} else {
			return obj;
		}

	}

}
