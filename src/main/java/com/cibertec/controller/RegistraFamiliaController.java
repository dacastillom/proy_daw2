package com.cibertec.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Familia;
import com.cibertec.servicio.FamiliaServicio;

/**
 * 
 * @author DAVID CASTILLO
 * 
 */
@Controller
public class RegistraFamiliaController {
	
	@Autowired
	private FamiliaServicio familiaServicio;
	
	@ResponseBody
	@RequestMapping("/registraFamilia")
	public Map<String, Object> registra(Familia obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		obj.setFechaRegistro(new Date());
		
		Familia objSalida = familiaServicio.insertaFamilia(obj);
		if(objSalida== null) {
			salida.put("MENSAJE","Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
			
		}
		
		return salida;
	}


}
