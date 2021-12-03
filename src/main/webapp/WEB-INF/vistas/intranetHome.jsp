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

    <title>PROYECTO - La Calera</title>
</head>

<body>
    <jsp:include page="intranetCabecera.jsp" />

    <div class="container" style="margin-top: 5%">
        <h3>Resumen Pedidos</h3>
        <br /><br />
        <!-- <c:forEach var="x" items="${sessionScope.objRoles}">
            <h4>Bienvenido Sr(a): ${sessionScope.objUsuario.nombreCompleto} - ${x.nombre} </h4>
        </c:forEach> -->
        <br />
        <!-- <h4>DNI: ${sessionScope.objUsuario.dni}</h4><br> -->
        <br />
    </div>
    <div class="container">
        <div class="row" style="height: 70px">
            <!-- <div class="col-md-2">
                <input class="form-control" id="id_txt_filtro" name="filtro" placeholder="Ingrese el nombre" type="text"
                    maxlength="30" />
            </div> -->

            <div class="form-group  col-md-4" >
                <label class="col-lg-2 control-label">Estado</label>
                <div class="col-lg-8" >
                    <select name="estado"  id="id_estado">
                        <option >Pendiente</option>
                        <option >Aprobado</option>										
                        <option >Reprogramado</option>										
                        <option >Anulado</option>
                    </select>
                </div>
            </div>

            
            <div class="col-md-2">
                <button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">
                    FILTRA
                </button>
            </div>
            <!-- <div class="col-md-2">
                <button type="button" data-toggle="modal" data-target="#id_div_modal_registra" class="btn btn-success" id="btnRegistrar"
                    style="width: 150px">
                    REGISTRA
                </button>
            </div> -->
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="content">
                    <table id="id_table" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 10%">ID</th>
                                <th style="width: 30%">Fecha de registro</th>
                                <th style="width: 10%">Fecha de entrega</th>
                                <th style="width: 20%">Estado</th>
                                <th style="width: 10%">Lugar de entrega</th>
                                <th style="width: 10%">Cliente</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- <div class="col-md-12" align="center" style="width: 50px; height: 150px" > 
</div> -->
    </div>

    <script type="text/javascript">
        $.getJSON("consultaCrudPedido", function (lista) {
            agregarGrilla(lista);
        });

        $("#id_btn_filtrar").click(function () {
            // var fil = 'En espera';
            var fil = $("#id_estado").val();
            console.info('--valor del filtro->', fil)
            $.getJSON("filtroCrudPedido", { filtro: fil }, function (lista) {
                agregarGrilla(lista);
            });
        });


        // function limpiarFormulario() {
        //     $('#id_reg_nombres').val('');
        //     $('#id_reg_dni').val('');
        //     $('#id_reg_correo').val('');
        //     $('#id_reg_direccion').val('');
        //     $('#id_estado').val('');
        //     $('#id_ubigeo').val('');
        // }

        function agregarGrilla(lista) {
            console.info("lista-->", lista);
            $("#id_table").DataTable().clear();
            $("#id_table").DataTable().destroy();
            $("#id_table").DataTable({
                data: lista,
                searching: false,
                ordering: true,
                processing: true,
                pageLength: 5,
                lengthChange: false,
                columns: [
                    { data: "idPedido" },
                    { data: "fechaRegistro" },
                    { data: "fechaEntrega" },
                    { data: "estado" },
                    { data: "lugarEntrega" },
                    { data: "cliente.nombres" },
                    // {
                    //     data: function (row, type, val, meta) {
                    //         const salida = '<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\'' + row.idPedido + '\',\'' + row.fechaRegistro + '\',\'' + row.fechaEntrega + '\',\'' + row.estado + '\',\'' + row.lugarEntrega + '\',\'' + row.estado + '\',\'' + row.cliente.nombres + '\')">Editar</button>';
                    //         return salida;
                    //     }, className: 'text-center'
                    // },
                    // {
                    //     data: function (row, type, val, meta) {
                    //         return (
                    //             '<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="eliminar(\'' +
                    //             row.idPedido +
                    //             "')\">Eliminar</button>"
                    //         );
                    //     },
                    //     className: "text-center",
                    // },
                ],
            });
        }
    </script>
</body>

</html>