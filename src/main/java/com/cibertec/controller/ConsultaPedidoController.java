package com.cibertec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.entidad.Pedido;
import com.cibertec.servicio.ClienteServicio;
import com.cibertec.servicio.PedidoServicio;

/**
 * 
 * @author Zapana Lorenzo Kamaly - T5WM
 *
 */

@Controller
public class ConsultaPedidoController {

	@Autowired
	private ClienteServicio clienteServicio;

	@Autowired
	private PedidoServicio pedidoServicio;

		
	@RequestMapping("/cargaClienteCbo")
	@ResponseBody
	public List<Cliente> listaCliente(){
		return clienteServicio.listaCliente();
	}

	@ResponseBody
	@RequestMapping("/consultaPedidos")
	public List<Pedido> listaPorfiltro(String fecharegistro, int idcliente) {
		// return pedidoServicio.pedidosConsultaFiltro(idcliente, fecharegistro);
		return pedidoServicio.pedidosConsultaFiltroCliente(idcliente);

	}

}
