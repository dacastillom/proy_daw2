package com.cibertec.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.servicio.ClienteServicio;
import com.empresa.util.Constantes;

/**
 * 
 * @author Kamaly
 **/
@Controller
public class CrudClienteController {

	@Autowired
	private ClienteServicio clienteServicio;

	@ResponseBody
	@RequestMapping("/consultaCrudCliente")
	public List<Cliente> lista(String filtro) {
		return clienteServicio.listaClientePorNombres(filtro.trim() + "%");
	}

	@RequestMapping("/registroCrudCliente")
	@ResponseBody
	public Map<String, Object> insertaCliente(Cliente obj) {
		Map<String, Object> salida = new HashMap<String, Object>();

		try {
			obj.setFechaRegistro(new Date());
			Cliente objsalida = clienteServicio.insertaActualizaCliente(obj);
			if (objsalida == null) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			} else {
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
		} finally {
			List<Cliente> lista = clienteServicio.listaCliente();
			salida.put("lista", lista);
		}
		return salida;

	}

	@ResponseBody
	@RequestMapping("/eliminaCrudCliente")
	public Map<String, Object> elimina(String id) {
		Map<String, Object> salida = new HashMap<>();
		try {
			int idCliente = Integer.parseInt(id);
			Optional<Cliente> optCliente = clienteServicio.obtenerPorId(idCliente);
			if (optCliente.isPresent()) {
				clienteServicio.eliminarCliente(idCliente);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			} else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		} finally {
			List<Cliente> lista = clienteServicio.listaCliente();
			salida.put("lista", lista);
		}
		return salida;
	}

	@ResponseBody
	@RequestMapping("/actualizaCrudCliente")
	public Map<String, Object> actualiza(Cliente obj) {
		Map<String,Object> salida = new HashMap<String,Object>();
		try {
			
			List<Cliente> lista = clienteServicio.obtienePorDni(obj.getDni(), obj.getIdCliente());
			if (CollectionUtils.isEmpty(lista)) {
				Cliente objSalida = clienteServicio.insertaActualizaCliente(obj);
				if(objSalida == null) {    
					
					salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
				}else {
				salida.put("mensaje", Constantes.MENSAJE_ACT_EXITOSO);
			}
				} else {
					salida.put("mensaje", Constantes.MENSAJE_ACT_YA_EXISTE); 
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
		} finally {
			List<Cliente> lista = clienteServicio.listaCliente();
			salida.put("lista", lista);
		}
		return salida;
	}

}
