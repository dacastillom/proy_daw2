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
<div class="container" style="margin-top: 5%"><h4>Registro Cliente</h4>



</div>



<div class="container" style="margin-top: 1%">
<form  id="id_form" method="post"> 
	 <div class="col-md-12" style="margin-top: 2%">
			<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label" for="id_nombre">Nombre</label>
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese su nombre">
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_apellido"> apelliedo</label>
					<input class="form-control" id="id_apelliedo" name="apellidos" placeholder="Ingrese su apellido" type="text" maxlength="2"/>
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_correo"> correo</label>
					<input class="form-control" id="id_correo" name="correo" placeholder="Ingrese su correo" type="text" maxlength="2"/>
				</div>
				
				
			</div>
			<div class="row">
			
			 <div class="form-group col-md-9">
					<label class="control-label" for="id_direccion">Direccio�n</label>
					<input class="form-control" id="id_direccion" name="direccion" placeholder="Ingrese su direcci�n" type="text" maxlength="20"/>
				</div>
				<div class="form-group col-md-3">
					<label class="control-label" for="id_estado">Estado</label>
					<select id=id_estado name="estado" class='form-control'>
						<option value=" ">[Seleccione Estado]</option>
						<option value="1">[Activo]</option>
						<option value="2">[Inactivo]</option>    
					</select>
			    </div>
			
	       </div>
	       
	       <div class="row">
			
			
				<div class="form-group col-md-4">
					<label class="control-label" for="id_departamento">Departamento</label>
					<select  class='form-control' id="id_departamento">
						<option value=" ">[Seleccione Departamento]</option>    
					</select>
			    </div>
			    
			    <div class="form-group col-md-4">
					<label class="control-label" for="id_provincia">Provincia</label>
					<select  class='form-control' id="id_provincia">
						<option value=" ">[Seleccione Provincia]</option>    
					</select>
			    </div>
			    
			   <div class="form-group col-md-4">
					<label class="control-label" for="id_distrito">Distrito</label>
					<select  class='form-control' id="id_distrito" name="ubigeo.idUbigeo">
						<option value=" ">[Seleccione Distrito]</option>    
					</select>
			    </div>
			
	       </div>
		    <div class="row">
				<div class="form-group col-md-12" align="center">
					<button id="id_registrar" type="button" class="btn btn-primary" >Registrar</button>
				</div>
			</div>
			
			</div>
	</form>

	</div>


<script type="text/javascript">

$.getJSON("listaDepartamentos", {}, function(data){
	$.each(data, function(index,item){
		$("#id_departamento").append("<option value="+item+">"+ item +"</option>");
	});
});

$("#id_registrar").click(function (){ 

	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()){
		$.ajax({
			type: 'POST',  
			data: $("#id_form").serialize(),
			url: 'registroCliente',
			success: function(data){
				mostrarMensaje(data.MENSAJE);
				limpiar();
				validator.resetForm();
			},
			error: function(){
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
});


$.getJSON("listaDepartamentos",{}, function(data){
	$.each(data, function(i, item){
		$("#id_departamento").append("<option value='"+ item +"'>"+ item+"</option>");
	});
});
$("#id_departamento").change(function(){
	var var_dep = $("#id_departamento").val();

	$("#id_provincia").empty();
	$("#id_provincia").append("<option value=' '>[Seleccione Provincia]</option>");

	$("#id_distrito").empty();
	$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");
	
	$.getJSON("listaProvincias",{"departamento":var_dep}, function(data){
		$.each(data, function(i, item){
			$("#id_provincia").append("<option value='"+ item +"'>"+ item+"</option>");
		});
	});
});

$("#id_provincia").change(function(){
	var var_dep = $("#id_departamento").val();
	var var_pro = $("#id_provincia").val();

	$("#id_distrito").empty();
	$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");
	
	$.getJSON("listaDistritos",{"departamento":var_dep,"provincia":var_pro}, function(data){
		$.each(data, function(i, item){
			$("#id_distrito").append("<option value='"+ item.idUbigeo +"'>"+ item.distrito+"</option>");
		});
	});
});


function limpiar(){
	$("id_nombre").val(' ');
	$("id_apellido").val(' ');
	$("id_correo").val(' ');
	$("id_direccion").val(' ');
	$("id_estado").val(' ');
	$("id_ubigeo").val(' ');
}

$('#id_form').bootstrapValidator({
    message: 'Este valor no es v�lido',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    
    fields: {
    	
    }
});


</script>   		
</body>
</html>