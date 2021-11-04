package com.cibertec.entidad;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class ComprobanteHasProductoPK implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int idComprobante;
	private int idProducto;
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idComprobante;
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
		ComprobanteHasProductoPK other = (ComprobanteHasProductoPK) obj;
		if (idComprobante != other.idComprobante)
			return false;
		if (idProducto != other.idProducto)
			return false;
		return true;
	}
	
	public int getIdComprobante() {
		return idComprobante;
	}
	public void setIdComprobante(int idComprobante) {
		this.idComprobante = idComprobante;
	}
	public int getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	

}
