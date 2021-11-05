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
		return productoServicio.listaProductoPorNombreLike(filtro.trim() + "%");
	}
	

	@RequestMapping("/registraCrudProducto")
	@ResponseBody
	public Map<String, Object> insertaProducto(Producto obj){
		Map<String, Object> salida = new HashMap<String, Object>();
				
		try {
			Producto objsalida = productoServicio.insertaActualizaProducto(obj);
			if (objsalida==null) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
			}
			
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
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
			List<Producto> lista = productoServicio.obtienePorNombre(obj.getNombre(), obj.getIdProducto());
			if (CollectionUtils.isEmpty(lista)) {
				Producto objSalida = productoServicio.insertaActualizaProducto(obj);
				if(objSalida == null) {
				 salida.put("mensaje", "Proceso erroneo");					
				
			}else {
				salida.put("mensaje", "Proceso exitoso");
			}
			
		} else {
			salida.put("mensaje", Constantes.MENSAJE_ACT_YA_EXISTE); 
		 }
		}
		
		catch (Exception e) {
			salida.put("mensaje", "Registro act exitoso");
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
		Map<String, Object> salida = new HashMap<>();
		try {
			Optional<Producto> optProducto = productoServicio.obtienePorId(id);
			System.out.println("optProducto" + optProducto);
			if(optProducto.isPresent()) {
				System.out.println("true");
				productoServicio.eliminaProducto(id);
				salida.put("mensaje", "Producto eliminado exitosamente");
			}else {
				salida.put("mensaje", "Producto a eliminar incorrecto");
			}
			
		} catch (Exception e) {
			salida.put("mensaje", "Error al eliminar un producto");
			e.printStackTrace();
		} finally {
			List<Producto> lista = productoServicio.listaProducto();
			salida.put("lista", lista);
		}
				
		return salida;
	}
}
