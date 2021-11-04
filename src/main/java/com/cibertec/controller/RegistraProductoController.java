package com.cibertec.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Producto;
import com.cibertec.servicio.ProductoServicio;

/**
 * 
 * @author Kamaly Zapana Lorenzo
 *
 */

@Controller
public class RegistraProductoController {

	@Autowired
	private ProductoServicio productoServicio;

	@ResponseBody
	@RequestMapping("/registraProducto")
	public Map<String, Object> registra(Producto obj) {
		Map<String, Object> salida = new HashMap<String, Object>();
		Producto objSalida = productoServicio.create(obj);
		if (objSalida == null) {
			salida.put("MENSAJE", "Registro erróneo");
		} else {
			salida.put("MENSAJE", "Registro exitoso");

		}
		return salida;
	}

}
