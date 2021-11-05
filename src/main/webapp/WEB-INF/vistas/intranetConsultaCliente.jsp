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

<title>La Calera</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 5%"><h4>Consulta Cliente</h4></div>

<div class="container" style="margin-top: 5%">
<form id="id_form"> 
		<div class="row">
		 	<div class="col-md-3">
		 		<div class="form-group">
		 			<input type="text" id="id_nombres" name="nombres" placeholder="Nombre" class="form-control">
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
												<th>ID</th>
												<th>Nombre</th>
												<th>Apellido</th>
												<th>Correo</th>
												<th>Fecha Registro</th>
												<th>Direccion</th>
												<th>Estado</th>
												<th>Ubigeo</th>
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
	var idNombres = $("#id_nombres").val();

	var param = {"nombres":idNombres};
	console.log(param);
	
	$.getJSON("consultaClientePor",param, function(data){
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
				{data: "idCliente"},
				{data: "nombres"},
				{data: "apellidos"},
				{data: "correo"},
				{data: "fechaRegistro"},
				{data: "direccion"},
				{data: (row, type, val, meta) => row.estado === 1 ? '<p>Activo</p>' : '<p>Inactivo</p>', className: 'text-center'},
				{data: "ubigeo.idUbigeo"}
			]                 
	    });
}


</script>   		
</body>
</html>