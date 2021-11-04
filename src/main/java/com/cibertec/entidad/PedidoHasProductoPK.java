package com.cibertec.entidad;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PedidoHasProductoPK  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Column(name = "idpedido") /*Adicionado 15 Junio David Castillo*/
	private int idPedido;
	
	@Column(name = "idproducto") /*Adicionado 15 Junio David Castillo*/
	private int idProducto;

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idPedido;
		result = prime * result + idProducto;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PedidoHasProductoPK other = (PedidoHasProductoPK) obj;
		if (idPedido != other.idPedido)
			return false;
		if (idProducto != other.idProducto)
			return false;
		return true;
	}

	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}

	public int getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

}
