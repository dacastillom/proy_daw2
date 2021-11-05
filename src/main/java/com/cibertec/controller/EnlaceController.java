package com.cibertec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class EnlaceController {

	//Registro
	@RequestMapping("/")
	public String verLogin() {	return "intranetLogin";  }
	
	@RequestMapping("/verIntranetHome")
	public String verIntranetHome() {	return "intranetHome";  }

	@RequestMapping("/verRegistroCliente")
	public String verRegistraCliente() {	return "intranetRegistroCliente";	}
	
	@RequestMapping("/verRegistroMarca")
	public String verRegistraMarca() {	return "intranetRegistroMarca";	}
	
	@RequestMapping("/verRegistroProveedor")
	public String verRegistraProveedor() {	return "intranetRegistroProveedor";	}
	
	@RequestMapping("/verRegistroProducto")
	public String verRegistraProducto() {	return "intranetRegistroProducto";	}

	//cruds
	@RequestMapping("/verCrudCliente")
	public String verCrudCliente() {	return "intranetCrudCliente";	}
	
	@RequestMapping("/verCrudProveedor")
	public String verCrudProveedor() {	return "intranetCrudProveedor";	}
	
	@RequestMapping("/verCrudProducto")
	public String verCrudProducto() {	return "intranetCrudProducto";	}

	//consulta

	@RequestMapping("/verRegistroBoleta")
	public String verRegistroBoleta() {	return "intranetRegistroBoleta";	}

}
