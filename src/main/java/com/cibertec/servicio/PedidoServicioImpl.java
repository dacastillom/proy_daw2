package com.cibertec.servicio;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Pedido;
import com.cibertec.entidad.PedidoHasProducto;
import com.cibertec.repositorio.PedidoHasProductoRepositorio;
import com.cibertec.repositorio.PedidoRepositorio;

@Service
public class PedidoServicioImpl implements PedidoServicio {

	@Autowired
	private PedidoRepositorio pedidoRepositorio;

	@Autowired
	private PedidoHasProductoRepositorio detalleRepositorio;

	@Override
	@Transactional
	public Pedido insertaPedido(Pedido obj) {
		Pedido cabecera = pedidoRepositorio.save(obj);
	
		for (PedidoHasProducto d : cabecera.getDetallesPedido()) {
			d.getPedidoHasProductoPK().setIdPedido(cabecera.getIdPedido());
			
			detalleRepositorio.actualizaStock(d.getCantidad(), d.getPedidoHasProductoPK().getIdProducto());
			detalleRepositorio.save(d);	
		}

			
		return cabecera;
	}

	@Override
	public List<Pedido> listaPedido() {
		return pedidoRepositorio.findAll();
	}

	@Override
	public List<Pedido> pedidosConsultaFiltroCliente(int idCliente) {
		return pedidoRepositorio.pedidosConsultaFiltroCliente(idCliente);
	}

	@Override
	public List<Pedido> pedidosConsultaFiltro(int idCliente, String fechaRegistro) {
		return pedidoRepositorio.pedidosConsultaFiltro(idCliente, fechaRegistro);
	}

}
