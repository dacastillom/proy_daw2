package com.cibertec.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.entidad.Mensaje;
import com.cibertec.entidad.Pedido;
import com.cibertec.entidad.PedidoHasProducto;
import com.cibertec.entidad.PedidoHasProductoPK;
import com.cibertec.entidad.Producto;
import com.cibertec.entidad.Seleccion;
import com.cibertec.servicio.ClienteServicio;
import com.cibertec.servicio.PedidoServicio;
import com.cibertec.servicio.ProductoServicio;

@Controller
public class PedidoController {
	
	@Autowired
	private ClienteServicio clienteServicio;
	
	@Autowired
	private ProductoServicio productoServicio;
	
	@Autowired
	private PedidoServicio pedidoServicio;
	
	//Se almacenan los productos seleccionados
	private List<Seleccion> seleccionados = new ArrayList<Seleccion>();
	

	@RequestMapping("/cargaCliente")
	@ResponseBody
	public List<Cliente> listaCliente(String filtro){
		int page = 0;
		int size = 5; //La consulta tenga tamaño 5

		Pageable pageable = PageRequest.of(page, size);
		return clienteServicio.listaCliente("%"+filtro+"%", pageable);

	}
	
	
	@RequestMapping("/cargaProducto")
	@ResponseBody
	public List<Producto> listaProducto(String filtro){
		int page = 0;
		int size = 5; //La consulta tenga tamaño 5
		Pageable pageable = PageRequest.of(page, size);
		return productoServicio.listaPorFiltroproducto("%"+filtro+"%", pageable);

	}
	
	@RequestMapping("/agregarSeleccion")
	@ResponseBody
	public List<Seleccion> agregar(Seleccion obj){
		seleccionados.add(obj);
		return seleccionados;
	}

	@RequestMapping("/listaSeleccion")
	@ResponseBody
	public List<Seleccion>listar(){
    	return seleccionados;
	}
	
	
	@RequestMapping("/eliminaSeleccion")
	@ResponseBody
	public List<Seleccion>eliminar(int idProducto){
		for(Seleccion x : seleccionados) {
			if(x.getIdProducto()== idProducto) {
				seleccionados.remove(x);
				break;
			}
		}
    	return seleccionados;
	}	
	
	@RequestMapping("/registraPedido")
	@ResponseBody
	public Mensaje registra(int idCliente, String nomCliente, String dniCliente,String fecEntrega, String lugEntrega,String estado){
	//Los parámetros viajan al .jsp con el mismo valor.
		Mensaje mensaje = new Mensaje();
	
    	List<PedidoHasProducto> detalles = new ArrayList<PedidoHasProducto>();
		for(Seleccion seleccion : seleccionados) {

			PedidoHasProductoPK pk = new PedidoHasProductoPK();
			pk.setIdProducto(seleccion.getIdProducto());
			
			PedidoHasProducto phb = new PedidoHasProducto();
			phb.setPrecio(seleccion.getPrecio());
			phb.setCantidad(seleccion.getCantidad());
			phb.setPedidoHasProductoPK(pk);
	
			detalles.add(phb);
	}

		Cliente objCliente = new Cliente();
		objCliente.setIdCliente(idCliente);
		objCliente.setNombres(nomCliente);
		objCliente.setDni(dniCliente);
		
		
		Pedido obj = new Pedido();
		obj.setCliente(objCliente);
		obj.setDetallesPedido(detalles); 
		obj.setEstado(estado); 
		obj.setFechaRegistro(new Date());
		obj.setFechaEntrega(fecEntrega);
		obj.setLugarEntrega(lugEntrega);
	
		
		Pedido objPedido =  pedidoServicio.insertaPedido(obj);
		
		String salida = "-1";

		if (objPedido != null) {
			salida = "Se generó el Pedido con código N° : " + objPedido.getIdPedido() + "<br><br>";
			salida += "Cliente: " + objPedido.getCliente().getNombres() + "<br><br>";
			salida += "<table class=\"table\"><tr><td>Producto</td><td>Precio</td><td>Cantidad</td><td>Subtotal</td></tr>";
			
			double monto = 0;
			for (Seleccion x : seleccionados) {
				salida += "<tr><td>"  + x.getNombre() + "</td><td>" + x.getPrecio() + "</td><td>" + x.getCantidad()
						+ "</td><td>" + x.getTotalParcial() + "</td></tr>";
				monto += x.getCantidad() * x.getPrecio();
			}
			salida += "</table><br>";
			salida += "Monto a pagar : " + monto;

			seleccionados.clear();
		}
		
		mensaje.setTexto(salida);
		
		return mensaje;
	}
	
	

	
	
	
}
