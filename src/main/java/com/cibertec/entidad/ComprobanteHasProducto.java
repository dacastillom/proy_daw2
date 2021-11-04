package com.cibertec.entidad;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comprobante_has_producto")
public class ComprobanteHasProducto {

	@EmbeddedId
	private ComprobanteHasProductoPK comprobanteHasProductoPK;

	@ManyToOne
	@JoinColumn(name = "idComprobante", nullable = false, insertable = false, updatable = false)
	private Comprobante comprobante;

	@ManyToOne
	@JoinColumn(name = "idProducto", nullable = false, insertable = false, updatable = false)
	private Producto producto;

	private double precio;
	private int cantidad;
	
	public ComprobanteHasProductoPK getComprobanteHasProductoPK() {
		return comprobanteHasProductoPK;
	}

	public void setComprobanteHasProductoPK(ComprobanteHasProductoPK comprobanteHasProductoPK) {
		this.comprobanteHasProductoPK = comprobanteHasProductoPK;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public Comprobante getComprobante() {
		return comprobante;
	}

	public void setComprobante(Comprobante comprobante) {
		this.comprobante = comprobante;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

}
