package com.cibertec.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "opcion")
public class Opcion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idOpcion;
	private String nombre;
	private String ruta;
	private byte estado;
	private byte tipo;
	
	public int getIdOpcion() {
		return idOpcion;
	}
	public void setIdOpcion(int idOpcion) {
		this.idOpcion = idOpcion;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getRuta() {
		return ruta;
	}
	public void setRuta(String ruta) {
		this.ruta = ruta;
	}
	public byte getEstado() {
		return estado;
	}
	public void setEstado(byte estado) {
		this.estado = estado;
	}
	public byte getTipo() {
		return tipo;
	}
	public void setTipo(byte tipo) {
		this.tipo = tipo;
	}
	
	
	
	
}
