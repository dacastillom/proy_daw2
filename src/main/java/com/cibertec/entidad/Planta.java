package com.cibertec.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "planta")
public class Planta  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idPlanta;
	private String nombre;
	private String estado;
	
	public int getIdPlanta() {
		return idPlanta;
	}
	public void setIdPlanta(int idPlanta) {
		this.idPlanta = idPlanta;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	

	

}

