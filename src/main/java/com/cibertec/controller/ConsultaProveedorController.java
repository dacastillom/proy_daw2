package com.cibertec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Proveedor;
import com.cibertec.servicio.ProveedorServicio;

/**
 * 
 * @author Zapana Lorenzo Kamaly - T5WM
 *
 */

@Controller
public class ConsultaProveedorController {

	@Autowired
	private ProveedorServicio proveedorServicio;

	@ResponseBody
	@RequestMapping("/consultaProveedorPor")
	public List<Proveedor> listaPorRucAndRazonSocial(String ruc, String razonsocial) {
		List<Proveedor> obj = proveedorServicio.listaPorRucAndRazonSocial(ruc, razonsocial);

		System.out.println(obj);
		if (obj.size() == 0) {
			return proveedorServicio.listaProveedor();
		} else {
			return obj;
		}

	}

}
