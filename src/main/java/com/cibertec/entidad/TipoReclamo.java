package com.cibertec.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tiporeclamo")
public class TipoReclamo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idTipoReclamo;
	private String descripcion;
	private byte estado;
	
	
	public int getIdTipoReclamo() {
		return idTipoReclamo;
	}
	public void setIdTipoReclamo(int idTipoReclamo) {
		this.idTipoReclamo = idTipoReclamo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public byte getEstado() {
		return estado;
	}
	public void setEstado(byte estado) {
		this.estado = estado;
	}
	
}
