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

import com.cibertec.entidad.Familia;
import com.cibertec.servicio.FamiliaServicio;
import com.empresa.util.Constantes;



@Controller
public class CrudFamiliaController {

	@Autowired
	private FamiliaServicio service;
	
	@ResponseBody
	@RequestMapping("/consultaCrudFamilia")
	public List<Familia> lista(String filtro) {
		return service.listaFamiliaPorNombreLike(filtro.trim() + "%");
	}
	
	
	@ResponseBody
	@RequestMapping("/registraCrudFamilia")
	public Map<String, Object> registra(Familia obj){
		Map<String, Object> salida = new HashMap<>();
		try {
			List<Familia> lstFamilia = service.buscaPorId(obj.getIdFamilia());
			if (CollectionUtils.isEmpty(lstFamilia)) {
				Familia objSalida = service.insertaActualizaFamilia(obj);
				if (objSalida  == null) {
					salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
				}else {
					salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
				}
			}else {

 
			}
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
		} finally {
			List<Familia> lista = service.listaFamilia();
			salida.put("lista", lista);
		}
		return salida;
	}

	
	@ResponseBody
	@RequestMapping("/eliminaCrudFamilia")
	public Map<String, Object> elimina(int id){
		Map<String, Object> salida = new HashMap<>();
		try {
			Optional<Familia> optFamilia = service.obtienePorId(id);
			if (optFamilia.isPresent()) {
				service.eliminaFamilia(id);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);	
			}
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		} finally {
			List<Familia> lista = service.listaFamilia();
			salida.put("lista", lista);
		}
		return salida;
	}
	
	@ResponseBody
	@RequestMapping("/actualizaCrudFamilia")
	public Map<String, Object> actualiza(Familia obj){
		Map<String, Object> salida = new HashMap<>();
		try {
			List<Familia> lstFamilia = service.buscaPorId(obj.getIdFamilia());
			if (CollectionUtils.isEmpty(lstFamilia)) {
				Familia objSalida = service.insertaActualizaFamilia(obj);
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
			List<Familia> lista = service.listaFamilia();
			salida.put("lista", lista);
		}
		return salida;
	}
	
	
}
