<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<!-- Autor: Crystal -->
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
<div class="container" style="margin-top: 5%"><h4>Crud Producto</h4></div>

<div class="container" style="margin-top: 1%">

		 <div class="col-md-23" >  

				   <div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th style="width: 5%" >ID</th>
												<th style="width: 35%">Nombre</th>
												<th style="width: 8%">Serie</th>
												<th style="width: 8%">Precio</th>
												<th style="width: 8%">Stock</th>
												<th style="width: 8%">Marca</th>
												<th style="width: 8%">País</th>
												<th style="width: 10%">Actualiza</th>
												<th style="width: 10%">Elimina</th>
											</tr>
										</thead>
											<tbody>
											</tbody>
										</table>
								</div>	
						</div>
					</div>
		  </div>
		  
		  
		 <div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudProducto" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_serie">Serie</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_serie" name="serie" placeholder="Ingrese el número de serie" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_precio">Precio</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_stock">Stock</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_stock" name="stock" placeholder="Ingrese la stock" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>   
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_marca">Marca</label>
		                                        <div class="col-lg-3">
													 <select id="id_reg_marca" name="marca" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">Pais</label>
		                                        <div class="col-lg-3">
													 <select id="id_reg_pais" name="pais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_registra">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		
	    <div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Producto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudModalidad" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Producto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-8">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idModalidad" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_serie">Serie</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_serie" name="serie" placeholder="Ingrese el número de serie" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_precio">Precio</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_stock">Stock</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_stock" name="stock" placeholder="Ingrese la stock" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>  
		                                   
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_marca">Marca</label>
		                                        <div class="col-lg-3">
													<select id="id_act_marca" name="marca" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pais</label>
		                                        <div class="col-lg-3">
													<select id="id_act_pais" name="pais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_actualiza">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
<!-- Agregar aquí -->
	
</div>

<script type="text/javascript">


$.getJSON("listaMarca", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_marca").append("<option value="+item.idMarca +">"+ item.nombre +"</option>");
		$("#id_act_marca").append("<option value="+item.idMarca +">"+ item.nombre +"</option>");
		
	});
});


$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		
	});
});



$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudProducto",{"filtro":fil}, function (lista){
		agregarGrilla(lista);
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
				{data: "idProducto"},
				{data: "nombre"},
				{data: "serie"},
				{data: "precio"},
				{data: "stock"},
				{data: "marca.nombre"},
				{data: "pais.nombre"},
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idProducto + '\',\'' + row.nombre +'\',\'' + row.serie  +'\',\'' + row.precio + '\',\'' + row.stock + '\',\'' +  row.marca.idMarca + '\',\'' + row.pais.idPais + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="eliminar(\'' + row.idProducto + '\')">Eliminar</button>';
					return salida;
				},className:'text-center'},													
			]                                     
	    });
}


function eliminar(id){	
	mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminar,null,id);
}

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudProducto", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
        	  mostrarMensaje(data.mensaje);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}

function editar(id,nombre,serie,precio,stock,idMarca, idPais){	
	$('#id_ID').val(id);
	$('#id_act_nombre').val(nombre);
	$('#id_act_serie').val(serie);
	$('#id_act_precio').val(precio);
	$('#id_act_stock').val(stock);
	$('#id_act_marca').val(idMarca);
	$('#id_act_pais').val(idPais);
	$('#id_div_modal_actualiza').modal("show");
}

function limpiarFormulario(){	
	$('#id_reg_nombre').val('');
	$('#id_reg_serie').val('');
	$('#id_reg_precio').val('');
	$('#id_reg_stock').val('');
	$('#id_reg_marca').val('');
	$('#id_reg_pais').val(' ');
}


$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraCrudProducto", 
          data: $('#id_form_registra').serialize(),
          success: function(data){
        	  agregarGrilla(data.lista);
        	  $('#id_div_modal_registra').modal("hide");
        	  mostrarMensaje(data.mensaje);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});


$("#id_btn_actualiza").click(function(){
	var validator = $('#id_form_actualiza').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "actualizaCrudProducto", 
          data: $('#id_form_actualiza').serialize(),
          success: function(data){
        	  agregarGrilla(data.lista);
        	  $('#id_div_modal_actualiza').modal("hide");
        	  mostrarMensaje(data.mensaje);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
    }
});
<!-- Agregar aquí -->
</script>   


<script type="text/javascript">

$('#id_form_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"nombre": {
    		selector : '#id_reg_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        
        "serie" : {
			selector : '#id_reg_serie',
			validators : {
				notEmpty : {
					message : 'La serie es un campo obligatorio'
				},
			}
		},
        
        "precio": {
    		selector : '#id_reg_precio',
            validators: {
            	notEmpty: {
                    message: 'el precio es un campo obligatorio'
                },
               
            }
        },
        
        "stock": {
    		selector : '#id_reg_stock',
            validators: {
            	notEmpty: {
                    message: 'stock es un campo obligatorio'
                },
                stringLength :{
                	message:'El stock es de 2 a 200',
                	min : 2,
                	max : 200
                }
            }
        },
        "marca.idMarca": {
    		selector : '#id_reg_marca',
            validators: {
            	notEmpty: {
                    message: 'La marca un campo obligatorio'
                },
            }
        },
        "pais.idPais": {
    		selector : '#id_reg_pais',
            validators: {
            	notEmpty: {
                    message: 'El pais es un campo obligatorio'
                },
            }
        },
    }
});

</script>

<script type="text/javascript">


$('#id_form_actualiza').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"nombre": {
    		selector : '#id_act_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        
        "serie": {
    		selector : '#id_act_serie',
            validators: {
            	notEmpty: {
                    message: 'serie es un campo obligatorio'
                },
                stringLength :{
                	message:'La sede es de 2 a 10 caracteres',
                	min : 2,
                	max : 10
                }
            }
        },
        
        "precio": {
    		selector : '#id_act_precio',
            validators: {
            	notEmpty: {
                    message: 'el precio es un campo obligatorio'
                },
                stringLength :{
                	message:'La sede es de 1 a 10 caracteres',
                	min : 1,
                	max : 10
                }
            }
        },
        
        "stock": {
    		selector : '#id_act_stock',
            validators: {
            	notEmpty: {
                    message: 'stock es un campo obligatorio'
                },
                stringLength :{
                	message:'La sede es de 2 a 20 caracteres',
                	min : 2,
                	max : 20
                }
            }
        },
        "marca.idMarca": {
    		selector : '#id_act_marca',
            validators: {
            	notEmpty: {
                    message: 'La marca un campo obligatorio'
                },
            }
        },
        "pais.idPais": {
    		selector : '#id_act_pais',
            validators: {
            	notEmpty: {
                    message: 'El pais un campo obligatorio'
                },
            }
        },
    }
});



</script>

</body>
</html>