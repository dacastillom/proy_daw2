package com.cibertec.servicio;

import java.util.List;

import com.cibertec.entidad.Pedido;

public interface PedidoServicio {

	public Pedido insertaPedido(Pedido obj);

	public List<Pedido> pedidosConsultaFiltroCliente(int idCliente);

	public List<Pedido> pedidosConsultaFiltro(int idCliente, String fechaRegistro);

	public List<Pedido> listaPedido();

	public abstract List<Pedido> listaPorEstado(String filtro);

}
