<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 5%"><h4>Consulta Comprobante</h4></div>

<div class="container" style="margin-top: 1%">
<form id="id_form"> 
		<div class="row">
		 	<div class="col-md-3">
		 		<div class="form-group">
		 			<input type="text" id="id_cliente" name="idCliente" placeholder="Id Cliente" class="form-control">
		 		</div>
		 	</div>

		 	<div class="col-md-3">
		 		<div class="form-group">
		 			<button id="id_filtrar"   type="button" class="btn btn-primary" >Filtrar</button>
		 		</div>
		 	</div>
		 </div>   
		 <div class="row">
		 	<div class="col-md-12">
				<div class="content" >
						<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>Codigo Comprobante</th>
												<th>Codigo Pedido</th>
												<th>Codigo Cliente</th>
												<th>Codigo Usuario</th>
												<th>Fecha Registro</th>
												<th>Fecha Pago</th>
												<th>Estado</th>
												
											</tr>
										</thead>
										<tbody>
												   

										</tbody>
							</table>	
					</div>	
				</div>
		 </div>
		    
	</form>
	
</div>

<script type="text/javascript">
$("#id_filtrar").click(function(){ 
	var idCliente = $("#id_cliente").val();

	var param = {"idCliente":idCliente};
	console.log(param);
	
	$.getJSON("consultaComprobantePor",param, function(data){
		console.log(data)
		agregarGrilla(data);
	});

});
function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 5,
			lengthChange: false,
			columns:[
				{data: "idComprobante"},
				{data: "pedido.idPedido"},
				{data: "cliente.idCliente"},
				{data: "usuario.idUsuario"},
				{data: "fechaRegistro"},
				{data: "fechaPago"},
				{data: "estado"},

			]                 
	    });
}



</script>   		
</body>
</html>