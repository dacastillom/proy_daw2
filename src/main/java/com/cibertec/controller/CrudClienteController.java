package com.cibertec.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
			Cliente objsalida = clienteServicio.insertaCliente(obj);
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
	public Map<String, Object> elimina(int id) {
		Map<String, Object> salida = new HashMap<>();
		try {
			Optional<Cliente> optCliente = clienteServicio.obtenerPorId(id);
			if (optCliente.isPresent()) {
				clienteServicio.eliminarCliente(id);
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
	public Map<String, Object> actualizar(Cliente obj) {
		Map<String, Object> salida = new HashMap<>();
		try {
			Cliente optCliente = clienteServicio.insertaActualizaCliente(obj);
			if (optCliente == null) {
				salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
			} else {
				salida.put("mensaje", Constantes.MENSAJE_ACT_EXITOSO);
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
