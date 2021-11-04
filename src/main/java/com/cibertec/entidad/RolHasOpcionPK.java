package com.cibertec.entidad;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class RolHasOpcionPK implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int idRol;
	private int idOpcion;
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idOpcion;
		result = prime * result + idRol;
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
		RolHasOpcionPK other = (RolHasOpcionPK) obj;
		if (idOpcion != other.idOpcion)
			return false;
		if (idRol != other.idRol)
			return false;
		return true;
	}
	public int getIdRol() {
		return idRol;
	}
	public int getIdOpcion() {
		return idOpcion;
	}
	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}
	public void setIdOpcion(int idOpcion) {
		this.idOpcion = idOpcion;
	}
	
	
}
