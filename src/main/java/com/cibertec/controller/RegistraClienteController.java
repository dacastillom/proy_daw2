package com.cibertec.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.servicio.ClienteServicio;

/**
 * 
 * @author LENIN
 * **/
@Controller
public class RegistraClienteController {
	

	@Autowired
	private ClienteServicio clienteServicio;
	
	
	@RequestMapping("/registroCliente")
	@ResponseBody
	public Map<String,Object> insertaCliente(Cliente obj){
		Map<String,Object> salida = new HashMap<String, Object>();
		Cliente objsalida = clienteServicio.insertaActualizaCliente(obj);
		if(objsalida ==null) {
			salida.put("MENSAJE", "registro erroneo");
		}else {
			salida.put("MENSAJE","registro exitoso");
		}
		return salida;
		
	}
	
	
}
