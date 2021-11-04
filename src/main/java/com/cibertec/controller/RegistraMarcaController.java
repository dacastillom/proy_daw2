package com.cibertec.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Marca;
import com.cibertec.servicio.MarcaServicio;

/**
 * 
 * @author DAVID CASTILLO
 * 
 */
@Controller
public class RegistraMarcaController {
	
	@Autowired
	private MarcaServicio marcaServicio;
	
	@ResponseBody
	@RequestMapping("/registraMarca")
	public Map<String, Object> registra(Marca obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		obj.setFechaRegistro(new Date());
		
		Marca objSalida = marcaServicio.insertaMarca(obj);
		if(objSalida== null) {
			salida.put("MENSAJE","Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
			
		}
		
		return salida;
	}


}
