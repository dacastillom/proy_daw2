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
<div class="container" style="margin-top: 5%"><h4>Registro Proveedor</h4></div>

<div class="container" style="margin-top: 1%">
	<form id="id_form" method="post">
		<div class="col-md-12" style="margin-top: 2%">
			<div class="row">
				<div class="from-group col-md-9">
					<label class="control-label" for="id_razonsocial">Raz�n Social</label>
					<input class="form-control" type="text" id="id_razonsocial" name="razonsocial" placeholder="Ingrese la Raz�n Social">
				</div>
				<div class="from-group col-md-3">
					<label class="control-label" for="id_ruc">Ruc</label>
					<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese su RUC">
				</div>
			</div>
			<div class="row">
				<div class="from-group col-md-6">
					<label class="control-label" for="id_direccion">Direcci�n</label>
					<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese su Direcci�n">
				</div>
				<div class="from-group col-md-3">
					<label class="control-label" for="id_telefono">Tel�fono</label>
					<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese su Tel�fono">
				</div>
				<div class="from-group col-md-3">
					<label class="control-label" for="id_celular">Celular</label>
					<input class="form-control" type="text" id="id_celular" name="celular" placeholder="Ingrese su Celular">
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4">
					<label class="control-label" for="id_departamento">DEPARTAMENTO</label>
					<select id="id_departamento" class='form-control'>
						<option value=" ">[Seleccione Departamento]</option>    
					</select>
			    </div>
			   	<div class="form-group col-md-4">
					<label class="control-label" for="id_provincia">PROVINCIA</label>
					<select id="id_provincia" class='form-control'>
						<option value=" ">[Seleccione Provincia]</option>    
					</select>
			    </div>
			   <div class="form-group col-md-4">
					<label class="control-label" for="id_distrito">DISTRITO</label>
					<select id="id_distrito" name="ubigeo.idUbigeo" class='form-control'>
						<option value=" ">[Seleccione Distrito]</option>    
					</select>
			    </div>
			</div>
			<div class="row">
				<div class="form-group col-md-12" align="center">
					<button id="id_registrar" type="button" class="btn btn-primary">Registrar</button>
				</div>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript">

$("#id_registrar").click(function (){ 
	
	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()){
		$.ajax({
			type: 'POST',  
			data: $("#id_form").serialize(),
			url: 'registroProveedor',
			success: function(data){
				mostrarMensaje(data.Mensaje);
				limpiar();
				validator.resetForm();
			},
			error: function(){
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
}); 


$.getJSON("listaDepartamentos", {}, function(data){ 
	$.each(data, function(i, item){
		$("#id_departamento").append("<option value='"+ item +"'>"+ item +"</option>"); 
	});
});

$("#id_departamento").change(function(){
	var val_dep = $("#id_departamento").val();

	$("#id_provincia").empty();
	$("#id_provincia").append("<option value=' '>[Seleccione Provincia]</option>");

	$("#id_distrito").empty();
	$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");

	$.getJSON("listaProvincias", {"departamento":val_dep}, function(data){ 
		$.each(data, function(i, item){
			$("#id_provincia").append("<option value='"+ item +"'>"+ item +"</option>"); 
		});
	});
	
 });

$("#id_provincia").change(function(){
	var val_dep = $("#id_departamento").val();
	var val_pro = $("#id_provincia").val();

	$("#id_distrito").empty();
	$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");
	
	$.getJSON("listaDistritos", {"departamento":val_dep,"provincia":val_pro}, function(data){ 
		$.each(data, function(i, item){
			$("#id_distrito").append("<option value='"+ item.idUbigeo +"'>"+ item.distrito +"</option>"); 
		});
	});
	
 });




function limpiar(){
	$("id_razonsocial").val(' ');
	$("id_ruc").val(' ');
	$("id_direccion").val(' ');
	$("id_telefono").val(' ');
	$("id_celular").val(' ');
	$("id_ubigeo").val(' ');
}



$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	razonsocial: {
    		selector : '#id_razonsocial',
            validators: {
                notEmpty: {
                    message: 'La Raz�n social es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        ruc: {
    		selector : '#id_ruc',
            validators: {
                notEmpty: {
                    message: 'El Ruc un campo obligatorio'
                },
                stringLength :{
                	message:'El Ruc es de 11 caracteres',
                	min : 11,
                	max : 11
                }
            }
        },
        direccion: {
    		selector : '#id_direccion',
            validators: {
                notEmpty: {
                    message: 'La Direcci�n es un campo obligatorio'
                },
                stringLength :{
                	message:'La Direcci�n es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        telefono: {
    		selector : '#id_telefono',
            validators: {
                notEmpty: {
                    message: 'El Tel�fono es un campo obligatorio'
                },
                stringLength :{
                	message:'El Tel�fono es de 7 a 100 caracteres',
                	min : 7,
                	max : 100
                }
            }
        },
        celular: {
    		selector : '#id_celular',
            validators: {
                notEmpty: {
                    message: 'El celular es un campo obligatorio'
                },
                stringLength :{
                	message:'El celular es de 9 a 100 caracteres',
                	min : 9,
                	max : 100
                }
            }
        },
        ubigeo: {
    		selector : '#id_ubigeo',
            validators: {
            	notEmpty: {
                    message: 'El Ubigeo es un campo obligatorio'
                },
            }
        },
    

    }   
});



</script>   		
</body>
</html>