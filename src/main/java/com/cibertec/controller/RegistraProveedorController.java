package com.cibertec.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Proveedor;
import com.cibertec.servicio.ProveedorServicio;
/**
 * 
 * @author Luciano Rocca Talavera
 * 
 * 
 * */

@Controller
public class RegistraProveedorController {

		@Autowired
		private ProveedorServicio servicio;
		
		@ResponseBody
		@RequestMapping("/registroProveedor")
		public HashMap<String,Object> registrar(Proveedor obj){
			HashMap<String, Object> salida = new HashMap<>();
			Proveedor objSalida= servicio.insertaActualizaCrudProveedor(obj);
			if(objSalida == null) {
				salida.put("Mensaje","Registro erróneo");
			}else {
				salida.put("Mensaje","Registro exitoso");
			}
			return salida;
		}

	
}
