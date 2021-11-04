package com.cibertec.entidad;



public class Seleccion {
	
	//Datos obtenido sobre la clase Producto /*Entidad para manejar datos*/
	private int idProducto;
	private String nombre;
	private double precio;
	private int cantidad;
	private double totalParcial;
	
	
	
	public int getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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


	public double getTotalParcial() {
		totalParcial = precio * cantidad;
		return totalParcial;
	}
	
}
