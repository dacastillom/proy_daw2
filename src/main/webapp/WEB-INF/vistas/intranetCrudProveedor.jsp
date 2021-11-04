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

<title>Sistemas - Delivery</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 5%">
<h4>CRUD Proveedor</h4>
</div>



<div class="container" style="margin-top: 1%">

		 <div class="col-md-23" >  
		 
		 
		 
					<div class="row" style="height: 70px">
						<div class="col-md-3" >
								<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese la Razón Social" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
						</div>
					</div>
					
					
					
					
					<div class="row" > 
						<div class="col-md-12" >
								<div class="content" >
						
									<table id="id_table" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="text-align:center; width: 3%">ID</th>
												<th style="text-align:center; width: 18%">Razón Social</th>
												<th style="text-align:center; width: 12%">RUC</th>
												<th style="text-align:center; width: 15%">Dirección</th>
												<th style="text-align:center; width: 10%">Teléfono</th>
												<th style="text-align:center; width: 10%">Celular</th>
												<th style="text-align:center; width: 10%">Contacto</th>
												<th style="text-align:center; width: 12%">Cod. Ubigeo</th>
												<th style="text-align:center; width: 5%">Actualiza </th>
												<th style="text-align:center; width: 5%">Elimina </th>
												
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
			<div class="modal-dialog" style="width: 80%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Proveedor</h4>
				</div>
				
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal" method="post">  <!-- action="registraActualizaCrudProveedor" -->
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Proveedor</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                            
		                                <div class="panel-body">
		                                
		                                	<div class="form-group">
			                                       <label class="col-lg-3 control-label" for="id_reg_razonsocial" style="text-align: right;">RAZÓN SOCIAL</label> <!-- El registro no lleva ID -->
			                                        <div class="col-lg-6">
														<input class="form-control" id="id_reg_razonsocial" name="razonsocial" placeholder="Ingrese la Razón Social" type="text" maxlength="25"/>
			                                        </div>
			                                   </div>     
			                                   
			                                   
			                                   <div class="form-group">     
			                                        <label class="col-lg-3 control-label" for="id_reg_ruc" style="text-align: right;">RUC</label>
			                                        <div class="col-lg-4">
														<input class="form-control" id="id_reg_ruc" name="ruc" placeholder="Ingrese el RUC" maxlength="11"/>
			                                        </div>
			                              	  </div>
			                                
			                               
			                                
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion" style="text-align: right;">DIRECCIÓN</label>
		                                        <div class="col-lg-6">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese el correo" type="text" maxlength="25" />
		                                      	</div>   
		                                   </div>
		                                  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono" style="text-align: right;">TELÉFONO</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el teléfono" type="text" maxlength="9" />
		                                     	 </div>
		                                   </div>   
		                                      
		                              		<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_celular" style="text-align: right;">CELULAR</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_reg_celular" name="celular" placeholder="Ingrese el celular" type="text" maxlength="9" />
		                                   	    </div>   
		                                    </div>
		                                      
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_contacto" style="text-align: right;">CONTACTO</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_reg_contacto" name="contacto" placeholder="Ingrese el contacto" type="text" maxlength="25" />
		                                      	</div>  
		                                     </div>  
		                                      
		                                     
		                                    <div class="form-group">
		                            
												 <label class="col-lg-3 control-label" for="id_reg_departamento" style="text-align: right;" >DEPARTAMENTO</label>
												<div class="col-lg-5">
													<select id="id_reg_departamento" class='form-control'> 	<!-- name="departamento" -->
													<option value=" ">[Seleccione Departamento]</option>    
												</select>
												</div>
										    </div>
										    
										   	<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_provincia" style="text-align: right;">PROVINCIA</label>
												<div class="col-lg-5">
												<select id="id_reg_provincia"  class='form-control'>  <!-- name="provincia" -->
													<option value=" ">[Seleccione Provincia]</option>    
												</select>
												</div>
										    </div>
										   <div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_distrito" style="text-align: right;">DISTRITO</label>
												<div class="col-lg-5">
												<select id="id_reg_distrito" name="ubigeo.idUbigeo" class='form-control'>
													<option value=" ">[Seleccione Distrito]</option>    
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
			<div class="modal-dialog" style="width: 80%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Proveedor</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8" class="form-horizontal" method="post">  <!-- action="registraActualizaCrudProveedor" -->
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Proveedor</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                
		                               		 <div class="form-group">
			                                       <label class="col-lg-3 control-label" for="id_ID" style="text-align: right;">ID</label>
			                                        <div class="col-lg-2">
														<input class="form-control" id="id_ID" readonly="readonly" name="idProveedor" type="text" maxlength="4"/>
			                                        </div>
			                                   </div>     
		                                
		                                   <div class="form-group">
			                                       <label class="col-lg-3 control-label" for="id_act_razonsocial" style="text-align: right;">RAZÓN SOCIAL</label>
			                                        <div class="col-lg-6">
														<input class="form-control" id="id_act_razonsocial" name="razonsocial" placeholder="Ingrese la Razón Social" type="text" maxlength="25"/>
			                                        </div>
			                                   </div>     
                                   
			                                   <div class="form-group">     
			                                        <label class="col-lg-3 control-label" for="id_act_ruc" style="text-align: right;">RUC</label>
			                                        <div class="col-lg-4">
														<input class="form-control" id="id_act_ruc" name="ruc" placeholder="Ingrese el RUC" maxlength="11"/>
			                                        </div>
			                              	  </div>
			                                
			                                
			                                
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_direccion" style="text-align: right;">DIRECCIÓN</label>
		                                        <div class="col-lg-6">
													<input class="form-control" id="id_act_direccion" name="direccion" placeholder="Ingrese el correo" type="text" maxlength="25" />
		                                      	</div>   
		                                   </div>
		                                  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono" style="text-align: right;">TELÉFONO</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese el teléfono" type="text" maxlength="9" />
		                                     	 </div>
		                                   </div>   
		                                      
		                              		<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_celular" style="text-align: right;">CELULAR</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_act_celular" name="celular" placeholder="Ingrese el celular" type="text" maxlength="9" />
		                                   	    </div>   
		                                    </div>
		                                      
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_contacto" style="text-align: right;">CONTACTO</label>
		                                        <div class="col-lg-4">
													<input class="form-control" id="id_act_contacto" name="contacto" placeholder="Ingrese el contacto" type="text" maxlength="25" />
		                                      	</div>  
		                                     </div>  
		                                      
		                                     
		                                    <div class="form-group">
		                            
												 <label class="col-lg-3 control-label" for="id_act_departamento" style="text-align: right;" >DEPARTAMENTO</label>
												<div class="col-lg-5">
													<select id="id_act_departamento" class='form-control'>   <!--name="departamento" -->
													<option value=" ">[Seleccione Departamento]</option>    
												</select>
												</div>
										    </div>
										    
										   	<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_provincia" style="text-align: right;">PROVINCIA</label>
												<div class="col-lg-5">
												<select id="id_act_provincia"  class='form-control'>  <!--name="provincia"   -->
													<option value=" ">[Seleccione Provincia]</option>    
												</select>
												</div>
										    </div>
										   <div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_distrito" style="text-align: right;">DISTRITO</label>
												<div class="col-lg-5">
												<select id="id_act_distrito" name="ubigeo.idUbigeo" class='form-control'>
													<option value=" ">[Seleccione Distrito]</option>    
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
		
		
			
		</div>
		

	






<!-- Para el ComboBox Registro Ubigeo -->
<script type="text/javascript">
<!-- Agregar aquí -->

//Para el Registro - Departamento

	$.getJSON("listaDepartamentos",{},function(data){
	    $.each(data,function(i, obj){
	        $("#id_reg_departamento").append("<option value='" + obj+ "'>"+obj+"</option>");
	   });
	});


//Para el Registro - Provincia
	
    	$('#id_reg_departamento').change(function() {  //Función anónima
	    $("#id_reg_provincia").empty(); //Para que se limpie
	    $("#id_reg_distrito").empty();
	    
	    $("#id_reg_provincia").append("<option value=' ' >[Seleccione Provincia]</option>");
	    $("#id_reg_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
	
		var dep = $('#id_reg_departamento').val();
		$.getJSON("listaProvincias",{"departamento":dep},function(data){
				 $.each(data,function(i, obj){
					$("#id_reg_provincia").append("<option value='" + obj+ "'>"+obj+"</option>");
				});
		});
	});
	
	
	
	//Para el Registro - Distrito
	
	$('#id_reg_provincia').change(function(){
	    $("#id_reg_distrito").empty();//Para que se limpie
	    $("#id_reg_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
	    var pro=$('#id_reg_provincia').val();
	    var dep = $('#id_reg_departamento').val();
	    $.getJSON("listaDistritos",{"provincia":pro,"departamento":dep},function(data){
	    		$.each(data,function(index,obj){
			  $("#id_reg_distrito").append("<option value='"+obj.idUbigeo+"'>"+obj.distrito+"</option>")
			 });
	    });
	});

</script>


<!-- Para el ComboBox Actualiza Ubigeo -->
<script type="text/javascript">

	//Para la Actualización- Departamento
	
	 $.getJSON("listaDepartamentos",{},function(data){
		$.each(data,function(i, obj){
	 			 $("#id_act_departamento").append("<option value='" + obj+ "'>"+obj+"</option>");
		});
	 });
	 
	//Para la Actualización- Provincia
	 
	 $('#id_act_departamento').change(function() {
		 $("#id_act_provincia").empty();
		 $("#id_act_distrito").empty();
		 
	 	 $("#id_act_provincia").append("<option value=' ' >[Seleccione Provincia]</option>");
	 	 $("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
	
		 var dep = $('#id_act_departamento').val();
		 $.getJSON("listaProvincias",{"departamento":dep},function(data){
			 $.each(data,function(i, obj){
		     	$("#id_act_provincia").append("<option value='" + obj+ "'>"+obj+"</option>");
	  	 	});
	     });
	 });
	
	//Para la Actualización- Distrito
	
	 $('#id_act_provincia').change(function(){
		 $("#id_act_distrito").empty();
		 $("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		 var pro=$('#id_act_provincia').val();
		 var dep = $('#id_act_departamento').val();
			$.getJSON("listaDistritos",{"provincia":pro,"departamento":dep},function(data){
				  $.each(data,function(index,obj){
	   				$("#id_act_distrito").append("<option value='"+obj.idUbigeo+"'>"+obj.distrito+"</option>")
	  			 });
		 });
	 });
 
</script>



<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#id_div_modal_registra').modal("show");
}








function editar(id,razonsocial,ruc,direccion,telefono, celular,contacto,departamento, provincia, distrito){           
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_razonsocial]').val(razonsocial);
	$('input[id=id_act_ruc]').val(ruc);
	$('input[id=id_act_direccion]').val(direccion);
	$('input[id=id_act_telefono]').val(telefono);
	$('input[id=id_act_celular]').val(celular);
	$('input[id=id_act_contacto]').val(contacto)
    
    $("#id_act_provincia").empty();
    $("#id_act_distrito").empty();

    $("#id_act_provincia").append("<option value=' ' >[Seleccione Provincia]</option>");
    $("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");

    //Seleccionar departamento
    $('#id_act_departamento').val(departamento);
    
    $.getJSON("listaProvincias",{"departamento":departamento},function(data){
    $.each(data,function(i, obj){
        if(obj ==  provincia){
              $("#id_act_provincia").append("<option selected value='" + obj+ "'>"+obj+"</option>");
        }else{
             $("#id_act_provincia").append("<option value='" + obj+ "'>"+obj+"</option>");
        }
    });
    });

    
    $.getJSON("listaDistritos",{"provincia":provincia,"departamento":departamento},function(data){
    $.each(data,function(index,obj){
       if(obj.distrito ==  distrito){
							$("#id_act_distrito").append("<option selected value='"+obj.idUbigeo+"'>"+obj.distrito+"</option>")
					  }else{
							$("#id_act_distrito").append("<option value='"+obj.idUbigeo+"'>"+obj.distrito+"</option>")
       }
    });

    });

  
    $('#id_div_modal_actualiza').modal("show");

}

$(document).ready(function() {
    $('#tableCliente').DataTable();
} );
</script> 



<script type="text/javascript">

$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudProveedor",{"filtro":fil}, function (lista){
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
				{data: "idProveedor"},
				{data: "razonsocial"},
				{data: "ruc"},
				{data: "direccion"},
				{data: "telefono"},
				{data: "celular"},
				{data: "contacto"},
				{data: "ubigeo.idUbigeo"},	
				
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idProveedor + '\',\'' + row.razonsocial +'\',\'' + row.ruc  + '\',\'' + row.direccion + '\',\'' + row.telefono + '\',\'' + row.celular +'\',\'' + row.contacto +'\',\'' + row.ubigeo.departamento + '\',\'' + row.ubigeo.provincia + '\',\'' + row.ubigeo.distrito + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="eliminar(\'' + row.idProveedor + '\')">Eliminar</button>';
					return salida;
				},className:'text-center'
				
				},													
			]                                     
	    });
}

function eliminar(id){	
	mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminar,null,id);
}

function accionEliminar(id, estado){	
	$('#id_elimina').val(id);
    $.ajax({
          type: "POST",
          url: "eliminaCrudProveedor", 
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


function limpiarFormulario(){	
	$('#id_reg_razonsocial').val('');
	$('#id_reg_direccion').val('');
	$('#id_reg_telefono').val('');
	$('#id_reg_celular').val('');
	$('#id_reg_contacto').val('');
	$('#id_reg_departamento').val('');
	$('#id_reg_provincia').val('');
	$('#id_reg_distrito').val('');
	  

}



$("#id_btn_registra").click(function () {
    var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();


    if (validator.isValid()) {
        $.ajax({
            type: "POST",
            url: "registroCrudProveedor",
            data: $("#id_form_registra").serialize(),
            success: function (data) {
                agregarGrilla(data.lista);
                $('#id_div_modal_registra').modal("hide");
                mostrarMensaje(data.mensaje);
                limpiarFormulario();
                validator.resetForm();
            },
            error: function () {
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
          url: "actualizaCrudProveedor", 
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
    	"razonsocial":{
            selector: "#id_reg_razonsocial",
            validators:{
                notEmpty: {
                     message: 'La Razón Social es obligatoria'
                },
                stringLength: {
                    min: 3,
                    max: 40,
                    message: 'El Razón Social es de 3 a 40 caracteres'
                },
            }
        },
        "ruc":{
            selector: "#id_reg_ruc",
            validators:{
                notEmpty: {
                     message: 'El RUC es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{11}$/,
                    message: 'El RUC tiene 11 dígitos'
                },
            }
        },
        "direccion":{
            selector: "#id_reg_direccion",
            validators:{
                notEmpty: {
                     message: 'La dirección es obligatoria'
                },
                stringLength: {
                    min: 3,
                    max: 40,
                    message: 'La dirección debe ser de 3 a 40 caracteres'
                }
            }
        },
        "telefono":{
        	 selector: "#id_reg_telefono",
             validators:{
            	 notEmpty: {
                     message: 'El teléfono es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{9}$/,
                    message: 'El teléfono tiene 9 dígitos'
                },
             }
        },
        
        "celular":{
       	 selector: "#id_reg_celular",
            validators:{
           	 notEmpty: {
                    message: 'El celular es obligatorio'
               },
               regexp: {
                   regexp: /^[0-9]{9}$/,
                   message: 'El celular tiene 9 dígitos'
               },
            }
       },
       
        "contacto":{
          	 selector: "#id_reg_contacto",
               validators:{
              	   notEmpty: {
                       message: 'Indique un contacto'
                   },
               }
         }
      
    }   
});




$('#id_form_actualiza').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"razonsocial":{
            selector: "#id_act_razonsocial",
            validators:{
                notEmpty: {
                     message: 'La Razón Social es obligatoria'
                },
                stringLength: {
                    min: 3,
                    max: 40,
                    message: 'El Razón Social es de 3 a 40 caracteres'
                },
            }
        },
        "ruc":{
            selector: "#id_act_ruc",
            validators:{
                notEmpty: {
                     message: 'El RUC es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{11}$/,
                    message: 'El RUC tiene 11 dígitos'
                },
            }
        },
        "direccion":{
            selector: "#id_act_direccion",
            validators:{
                notEmpty: {
                     message: 'La dirección es obligatoria'
                },
                stringLength: {
                    min: 3,
                    max: 40,
                    message: 'La dirección debe ser de 3 a 40 caracteres'
                }
            }
        },
        "telefono":{
        	 selector: "#id_act_telefono",
             validators:{
            	 notEmpty: {
                     message: 'El teléfono es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{9}$/,
                    message: 'El teléfono tiene 9 dígitos'
                },
             }
        },
        
        "celular":{
       	 selector: "#id_act_celular",
            validators:{
           	 notEmpty: {
                    message: 'El celular es obligatorio'
               },
               regexp: {
                   regexp: /^[0-9]{9}$/,
                   message: 'El celular tiene 9 dígitos'
               },
            }
       },
       
        "contacto":{
          	 selector: "#id_act_contacto",
               validators:{
              	   notEmpty: {
                       message: 'Indique un contacto'
                   },
               }
         }
      
    }   
});





</script>   		


  
  
</body>
</html>