package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Comprobante;


public interface ComprobanteRepositorio extends JpaRepository<Comprobante, Integer> {

	@Query("Select c from Comprobante c where c.cliente.idCliente = :fil")
	public abstract List<Comprobante> listaComprobantePorCodigoCliente(@Param("fil") int idCliente);
}
