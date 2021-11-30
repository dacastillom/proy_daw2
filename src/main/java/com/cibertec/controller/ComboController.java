package com.cibertec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.entidad.Familia;
import com.cibertec.entidad.Planta;
import com.cibertec.entidad.TipoReclamo;
import com.cibertec.servicio.ClienteServicio;
import com.cibertec.servicio.FamiliaServicio;
import com.cibertec.servicio.PlantaServicio;
import com.cibertec.servicio.TipoReclamoServicio;

@Controller
public class ComboController {

	@Autowired
	private PlantaServicio plantaServicio;

	@Autowired
	private FamiliaServicio familiaServicio;
	
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
	@RequestMapping("/listaPlanta")
	public List<Planta> listaPlanta() {
		return plantaServicio.listaPlanta();
	}
	
	@ResponseBody
	@RequestMapping("/listaFamilia")
	public List<Familia> listaFamilia(){
		return familiaServicio.listaFamilia();
	}
	
}
