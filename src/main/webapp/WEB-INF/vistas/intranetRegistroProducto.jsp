<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
		<h4>Registro Producto</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<form id="id_form" method="post">
			<div class="col-md-12" style="margin-top: 2%">
				<div class="row">

					<div class="form-group col-md-6">
						<label class="control-label" for="id_nombre">Nombre</label> <input
							class="form-control" type="text" id="id_nombre" name="nombre"
							placeholder="Ingrese el nombre del producto" maxlength="40">

					</div>

					<div class="form-group col-md-6">
						<label class="control-label" for="id_serie">serie</label> <input
							class="form-control" type="text" id="id_serie" name="serie"
							placeholder="Ingrese la serie del producto" maxlength="40">

					</div>

					<div class="form-group col-md-6">
						<label class="control-label" for="id_precio">precio</label> <input
							class="form-control" type="text" id="id_precio" name="precio"
							placeholder="Ingrese el precio" maxlength="40">
					</div>

					<div class="form-group col-md-6">
						<label class="control-label" for="id_stock">stock</label> <input
							class="form-control" type="text" id="id_stock" name="stock"
							placeholder="Ingrese el stock actual" maxlength="40">
					</div>

					<div class="form-group col-md-3">
						<label class="control-label" for="id_marca">Marca</label> <select
							class="form-control" id="id_marca" name="marca.idMarca">
							<option value=" ">[Seleccione]</option>
						</select>
					</div>

					<div class="form-group col-md-3">
						<label class="control-label" for="id_pais">Pais</label> <select
							class="form-control" id="id_pais" name="pais.idPais">
							<option value=" ">[Seleccione]</option>
						</select>
					</div>

				</div>
				<div class="row">
					<div class="form-group col-md-12" align="center">
						<button id="id_registrar" type="button" class="btn btn-primary">Registra</button>
					</div>
				</div>
			</div>
		</form>

	</div>

	<script type="text/javascript">
		$.getJSON("listaPais", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_pais").append(
						"<option value="+item.idPais + ">" + item.nombre
								+ "</option>");
			});

		});

		$.getJSON("listaMarca", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_marca").append(
						"<option value="+item.idMarca + ">" + item.nombre
								+ "</option>");
			});
		});

		$("#id_registrar").click(function() {
			var validator = $('#id_form').data('bootstrapValidator');
			validator.validate();
			if (validator.isValid()) {
				console.log($("#id_form"))

				$.ajax({
					type : 'POST',
					data : $("#id_form").serialize(),
					url : 'registraProducto',
					success : function(data) {
						mostrarMensaje(data.MENSAJE);
						limpiar();
						validator.resetForm();
					},
					error : function() {
						mostrarMensaje(MSG_ERROR);
					}
				});
			}
		});

		function limpiar() {
			$("#id_nombre").val('');
			$("#id_serie").val(' ');
			$("#id_precio").val(' ');
			$("#id_stock").val(' ');
			$("#id_marca").val(' ');
			$("#id_pais").val(' ');

		}

		$('#id_form').bootstrapValidator({
			message : 'Este valor no es válido',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				nombre : {
					selector : '#id_nombre',
					validators : {
						notEmpty : {
							message : 'El nombre es obligatorio'
						},
						stringLength : {
							message : 'El nombre es de 2 a 40 caracteres',
							min : 2,
							max : 40

						}
					}
				},
				serie : {
					selector : '#id_serie',
					validators : {
						notEmpty : {
							message : 'La serie es un campo obligatorio'
						},
					}
				},
				precio : {
					selector : '#id_precio',
					validators : {
						notEmpty : {
							message : 'El precio es un campo obligatorio'
						},
					}
				},
				stock : {
					selector : '#id_stock',
					validators : {
						notEmpty : {
							message : 'El stock es un campo obligatorio'
						},
					}
				},
			}
		});
	</script>
</body>
</html>