<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS">

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

	<link rel="stylesheet" href="css/bootstrap.css" />
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrapValidator.css" />

	<title>Intranet</title>
</head>

<body>
	<jsp:include page="intranetCabecera.jsp" />
	<div class="container" style="margin-top: 5%">
		<h4>Consulta Proveedor</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<form id="id_form">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<input type="text" id="id_ruc" name="ruc" placeholder="RUC" class="form-control">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<input type="text" id="id_razon_social" name="razon_social" placeholder="Raz&oacute;n social"
							class="form-control">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<button id="id_filtrar" type="button" class="btn btn-primary">Filtrar</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<table id="id_table" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th style="width: 5%">ID</th>
									<th style="width: 20%">Raz&oacute;n Social</th>
									<th style="width: 10%">RUC</th>
									<th style="width: 20%">Direcci&oacute;n</th>
									<th style="width: 10%">Celular</th>
									<th style="width: 10%">Contacto</th>
									<th style="width: 25%">Ubigeo</th>
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
		$("#id_filtrar").click(function () {
			var idRuc = $("#id_ruc").val();
			var idRazonSocial = $("#id_razon_social").val();
			var param = { "ruc": idRuc, "razonsocial": idRazonSocial };

			$.getJSON("consultaProveedorPor", param, function (data) {
				agregarGrilla(data);
			});
		});

		function agregarGrilla(lista) {
			$('#id_table').DataTable().clear();
			$('#id_table').DataTable().destroy();
			$('#id_table').DataTable({
				data: lista,
				searching: false,
				ordering: true,
				processing: true,
				pageLength: 5,
				lengthChange: false,
				columns: [
					{ data: "idProveedor" },
					{ data: "razonsocial" },
					{ data: "ruc" },
					{ data: "direccion" },
					{ data: "celular" },
					{ data: "contacto" },
					{ data: function(row, type, val, meta){
					    var salida = row.ubigeo.departamento+" - "+ row.ubigeo.provincia + " - " + row.ubigeo.distrito;
						return salida;
					},className:'text-left'}
						
				]
			});
		}

	</script>
</body>

</html>