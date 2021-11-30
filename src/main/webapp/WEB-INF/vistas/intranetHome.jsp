<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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

    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrapValidator.css" />

    <title>PROYECTO - La Calera</title>
</head>
<body>

    <jsp:include page="intranetCabecera.jsp" />

    <div class="container" style="margin-top: 5%">
        <h3>Resumen Pedidos  - SE DEBE REALIZAR EL LISTADO DE LOS PEDIDOS</h3>
        <br><br>
        
        	<c:forEach var="x" items="${sessionScope.objRoles}">
		      	<h4>Bienvenido Sr(a): ${sessionScope.objUsuario.nombreCompleto} - ${x.nombre} </h4>	          
		</c:forEach>        	
        	
        <br>
	    
        <!-- <h4>DNI: ${sessionScope.objUsuario.dni}</h4><br> -->

		<br>
		
		
		</div> 

        <div class="container">
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

            <div class="row">
                <div class="col-md-12">
                    <div class="content">

                        <table id="id_table" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 10%">ID</th>
                                    <th style="width: 30%">Nombre</th>
                                    <th style="width: 10%">Estado</th>
                                    <th style="width: 20%">Fec.Reg.</th>
                                    <th style="width: 10%">Actualiza </th>
                                    <th style="width: 10%">Elimina </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <!-- <div class="col-md-12" align="center" style="width: 50px; height: 150px" > 
</div> -->
        </div>



</body>

</html>