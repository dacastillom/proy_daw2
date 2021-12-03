package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;
import com.cibertec.entidad.Pedido;

public interface PedidoRepositorio extends JpaRepository<Pedido, Integer> {

    @Query("Select a from Pedido a where estado like :fil")
	public abstract List<Pedido> listaPorEstado(@Param("fil") String filtro);
    
    
    @Query("select d from Pedido d where "
    + "	(:param_cliente is -1 or d.cliente.idCliente = :param_cliente)"
    )
    public List<Pedido> pedidosConsultaFiltroCliente(@Param("param_cliente") int idCliente);

    @Query("select p from Pedido p where "
    + "	(:param_cliente is -1 or p.cliente.idCliente = :param_cliente) and"
    + " (:param_fecharegistro is '' or p.fechaRegistro = :param_fecharegistro)"
    )
    public List<Pedido> pedidosConsultaFiltro(
        @Param("param_cliente") int idCliente, 
        @Param("param_fecharegistro") String fechaRegistro);

}
