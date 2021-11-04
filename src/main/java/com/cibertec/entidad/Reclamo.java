package com.cibertec.entidad;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "reclamo")
public class Reclamo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idReclamo;
	private String descripcion;

	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaRegistro;

	private byte estado;

	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idCliente")
	private Cliente cliente;

	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoReclamo")
	private TipoReclamo tipoReclamo;

	public int getIdReclamo() {
		return idReclamo;
	}

	public void setIdReclamo(int idReclamo) {
		this.idReclamo = idReclamo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public byte getEstado() {
		return estado;
	}

	public void setEstado(byte estado) {
		this.estado = estado;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public TipoReclamo getTipoReclamo() {
		return tipoReclamo;
	}

	public void setTipoReclamo(TipoReclamo tipoReclamo) {
		this.tipoReclamo = tipoReclamo;
	}

}
