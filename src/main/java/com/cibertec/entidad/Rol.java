package com.cibertec.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@ToString
@Getter
@Setter
@Table(name = "rol")
public class Rol {



	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idRol;
	private String nombre;
	private byte estado;

 
	 
}
