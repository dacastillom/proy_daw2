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
	
	@RequestMapping("/verCrudMarca")
	public String verCrudMarca() {	return "intranetCrudMarca";	}
	
	@RequestMapping("/verCrudProveedor")
	public String verCrudProveedor() {	return "intranetCrudProveedor";	}
	
	@RequestMapping("/verCrudProducto")
	public String verCrudProducto() {	return "intranetCrudProducto";	}

	//consulta
	@RequestMapping("/verConsultaCliente")
	public String verConsultaCliente() {	return "intranetConsultaCliente";	}
	
	@RequestMapping("/verConsultaMarca")
	public String verConsultaMarca() {	return "intranetConsultaMarca";	}
	
	@RequestMapping("/verConsultaProveedor")
	public String verConsultaProveedor() {	return "intranetConsultaProveedor";	}
	
	@RequestMapping("/verConsultaProducto")
	public String verConsultaProducto() {	return "intranetConsultaProducto";	}

	
	@RequestMapping("/verConsultaUsuario")
	public String verConsultaUsuario() {	return "intranetConsultaUsuario";	}
	
	@RequestMapping("/verConsultaBoleta")
	public String verConsultaBoleta() {	return "intranetConsultaBoleta";	}
	
	@RequestMapping("/verRegistroBoleta")
	public String verRegistroBoleta() {	return "intranetRegistroBoleta";	}

	@RequestMapping("/verRegistroComprobante")
	public String verRegistroComprobante() {	return "intranetRegistroComprobante";	}

}
