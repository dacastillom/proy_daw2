package com.cibertec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cibertec.servicio.ClienteServicio;
import com.cibertec.entidad.Cliente;



@Controller
public class ConsultaClienteController {

	
	@Autowired
	private ClienteServicio clienteServicio;
	
	@ResponseBody
	@RequestMapping("/consultaClientePor")
	public List<Cliente> listaClientePorNombres(String nombres) {
		List<Cliente> obj = clienteServicio.listaClientePorNombres(nombres);

		System.out.println(obj);
		if (obj.size() == 0) {
			return clienteServicio.listaCliente();
		} else {
			return obj;
		}

	}
	
}
