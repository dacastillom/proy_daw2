package com.cibertec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.entidad.Marca;
import com.cibertec.entidad.Pais;
import com.cibertec.entidad.TipoReclamo;
import com.cibertec.servicio.ClienteServicio;
import com.cibertec.servicio.MarcaServicio;
import com.cibertec.servicio.PaisServicio;
import com.cibertec.servicio.TipoReclamoServicio;

@Controller
public class ComboController {

	@Autowired
	private PaisServicio paisServicio;

	@Autowired
	private MarcaServicio marcaServicio;
	
	@Autowired
	private ClienteServicio clienteServicio;
	
	@Autowired
	private TipoReclamoServicio tipoReclamoServicio;
	
	@ResponseBody
	@RequestMapping("/listaCliente")
	public List<Cliente> listaCliente() {
		return clienteServicio.listaCliente();
	}

	@ResponseBody
	@RequestMapping("/listaTipoReclamo")
	public List<TipoReclamo> listaTipoReclamo() {
		return tipoReclamoServicio.listaTipoReclamo();
	}
	
	@ResponseBody
	@RequestMapping("/listaPais")
	public List<Pais> listaPais() {
		return paisServicio.listaPais();
	}
	
	@ResponseBody
	@RequestMapping("/listaMarca")
	public List<Marca> listaMarca(){
		return marcaServicio.listaMarca();
	}
	
}
