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

import com.cibertec.entidad.Proveedor;
import com.cibertec.servicio.ProveedorServicio;
import com.empresa.util.Constantes;

/**
 * 
 * @author Castillo Monzón David Alfredo WS - T5WM
 *
 */
@Controller
public class CrudProveedorController {

	@Autowired
	private ProveedorServicio proveedorServicio;
	

	
	@ResponseBody
	@RequestMapping("/consultaCrudProveedor")
	public List<Proveedor> lista(String filtro){
		return proveedorServicio.listaProveedorPorNombreLike(filtro.trim() + "%");
	}

	
	
	@ResponseBody
	@RequestMapping("/registroCrudProveedor")
	public Map<String, Object> registra(Proveedor obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		try {
			List<Proveedor> lista = proveedorServicio.obtienePorRuc(obj.getRuc());
			if(CollectionUtils.isEmpty(lista)) {
				Proveedor objSalida = proveedorServicio.insertaActualizaCrudProveedor(obj);
				if(objSalida == null) {
					salida.put("mensaje",Constantes.MENSAJE_REG_ERROR);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
			}
		}else {
			salida.put("mensaje", Constantes.MENSAJE_REG_YA_EXISTE);
			}
		}catch (Exception e) {
			salida.put("mensaje",Constantes.MENSAJE_REG_ERROR);
			
		} finally {
			List<Proveedor> lista = proveedorServicio.listaProveedor();
			salida.put("lista",lista);
			
		}
		return salida;
	}  
	
	
	@ResponseBody
	@RequestMapping("/actualizaCrudProveedor")
	public Map<String, Object> actualiza(Proveedor obj){
		Map<String, Object> salida = new HashMap<String, Object>();
		try {
			List<Proveedor> lista = proveedorServicio.obtienePorRuc(obj.getRuc(),obj.getIdProveedor());
			if(CollectionUtils.isEmpty(lista)) {
				Proveedor objSalida = proveedorServicio.insertaActualizaCrudProveedor(obj);
				if(objSalida == null) {
					salida.put("mensaje",Constantes.MENSAJE_ACT_ERROR);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ACT_EXITOSO);
			}
		}else {
			salida.put("mensaje", Constantes.MENSAJE_ACT_YA_EXISTE +" : " + obj.getRuc());
			}
		}catch (Exception e) {
			salida.put("mensaje",Constantes.MENSAJE_ACT_ERROR);
			e.printStackTrace();
			
		} finally {
			List<Proveedor> lista = proveedorServicio.listaProveedor();
			salida.put("lista",lista);
			
		}
		return salida;
	}  
	
	
	@ResponseBody
	@RequestMapping("/eliminaCrudProveedor")
	public Map<String, Object> elimina(String id){
		Map<String, Object> salida = new HashMap<String, Object>();
		try {
			int idProveedor = Integer.parseInt(id);
			Optional<Proveedor> optProveedor = proveedorServicio.obtienePorId(idProveedor);
			if(optProveedor.isPresent()) {
				proveedorServicio.eliminaAlumno(idProveedor);;
				
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);

			}
			
		}catch (Exception e) {
			salida.put("mensaje",Constantes.MENSAJE_ELI_ERROR);
			e.printStackTrace();
			
		} finally {
			List<Proveedor> lista = proveedorServicio.listaProveedor();
			salida.put("lista",lista);
			
		}
		return salida;
	}  
	

	

	
}
