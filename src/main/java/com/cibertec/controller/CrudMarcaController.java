package com.cibertec.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Marca;
import com.cibertec.servicio.MarcaServicio;
import com.empresa.util.Constantes;



@Controller
public class CrudMarcaController {

	@Autowired
	private MarcaServicio service;
	
	@ResponseBody
	@RequestMapping("/consultaCrudMarca")
	public List<Marca> lista(String filtro) {
		return service.listaMarcaPorNombreLike(filtro.trim() + "%");
	}
	
	
	@ResponseBody
	@RequestMapping("/registraCrudMarca")
	public Map<String, Object> registra(Marca obj){
		Map<String, Object> salida = new HashMap<>();
		try {
			List<Marca> lstMarca = service.buscaPorId(obj.getIdMarca());
			if (CollectionUtils.isEmpty(lstMarca)) {
				Marca objSalida = service.insertaActualizaMarca(obj);
				if (objSalida  == null) {
					salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
				}else {
					salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
				}
			}else {
				//salida.put("mensaje", Constantes.MENSAJE_ID_YA_EXISTE + obj.getIdMarca()); 
			}
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
		} finally {
			List<Marca> lista = service.listaMarca();
			salida.put("lista", lista);
		}
		return salida;
	}

	
	@ResponseBody
	@RequestMapping("/eliminaCrudMarca")
	public Map<String, Object> elimina(int id){
		Map<String, Object> salida = new HashMap<>();
		try {
			Optional<Marca> optMarca = service.obtienePorId(id);
			if (optMarca.isPresent()) {
				service.eliminaMarca(id);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);	
			}
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		} finally {
			List<Marca> lista = service.listaMarca();
			salida.put("lista", lista);
		}
		return salida;
	}
	
	@ResponseBody
	@RequestMapping("/actualizaCrudMarca")
	public Map<String, Object> actualiza(Marca obj){
		Map<String, Object> salida = new HashMap<>();
		try {
			List<Marca> lstMarca = service.buscaPorId(obj.getIdMarca());
			if (CollectionUtils.isEmpty(lstMarca)) {
				Marca objSalida = service.insertaActualizaMarca(obj);
				if (objSalida  == null) {
					salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
				}else {
					salida.put("mensaje", Constantes.MENSAJE_ACT_EXITOSO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
		} finally {
			List<Marca> lista = service.listaMarca();
			salida.put("lista", lista);
		}
		return salida;
	}
	
	
}
