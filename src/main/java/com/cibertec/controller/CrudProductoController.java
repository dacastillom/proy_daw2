package com.cibertec.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Producto;
import com.cibertec.servicio.ProductoServicio;
import com.empresa.util.Constantes;
/**import com.empresa.util.Constantes;

/**
 * 
 * @author Kamaly Zapana Lorenzo
 *
 */

@Controller
public class CrudProductoController {
	
	@Autowired
	private ProductoServicio productoServicio;

	
	
	@RequestMapping("/consultaCrudProducto")
	@ResponseBody
	public List<Producto> lisaProductos(String filtro){
		return productoServicio.listaProductoPorNombreLike("%"+filtro+"%");
	}
	

	@RequestMapping("/registraCrudProducto")
	@ResponseBody
	public Map<String, Object> registral(Producto obj){
		Map<String, Object> salida = new HashMap<String, Object>();
				
		try {
			Producto objsalida = productoServicio.insertaActualizaProducto(obj);
			if (objsalida==null) {
				salida.put("MENSAJE", Constantes.MENSAJE_REG_ERROR);
			}else {
				salida.put("MENSAJE", Constantes.MENSAJE_REG_EXITOSO);
			}
			
		} catch (Exception e) {
			salida.put("MENSAJE", Constantes.MENSAJE_REG_ERROR);
			e.printStackTrace();
		} finally {
			List<Producto> lst = productoServicio.listaProducto();
			salida.put("lista", lst);
		}
				
		return salida;
	}
	
	@RequestMapping("/actualizaCrudProducto")
	@ResponseBody
	public Map<String, Object> actualiza(Producto obj){
		Map<String, Object> salida = new HashMap<String, Object>();
				
		try {
			Producto objsalida = productoServicio.insertaActualizaProducto(obj);
			if (objsalida==null) {
				salida.put("MENSAJE", "Registro act  erroneo");
			}else {
				salida.put("MENSAJE", "Registro act exitoso");
			}
			
		} catch (Exception e) {
			salida.put("MENSAJE", "Registro act exitoso");
			e.printStackTrace();
		} finally {
			List<Producto> lst = productoServicio.listaProducto();
			salida.put("lista", lst);
		}
				
		return salida;
	}
	
	@RequestMapping("/eliminarCrudProducto")
	@ResponseBody
	public Map<String, Object> elimina(int id){
		Map<String, Object> salida = new HashMap<String, Object>();
				
		try {
			Optional<Producto> opt = productoServicio.obtienePorId(id);
			if(opt.isPresent()) {
				productoServicio.eliminaProducto(id);
				salida.put("MENSAJE", "Registro eli exitoso");
			}else {
				salida.put("MENSAJE", "Registro eli  erroneo");
			}
			
		} catch (Exception e) {
			salida.put("MENSAJE", "Registro reg  erroneo");
			e.printStackTrace();
		} finally {
			List<Producto> lst = productoServicio.listaProducto();
			salida.put("lista", lst);
		}
				
		return salida;
	}
}
