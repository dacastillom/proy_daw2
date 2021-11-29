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

    <title>La Calera</title>
</head>

<body>
    <jsp:include page="intranetCabecera.jsp" />
    <div class="container" style="margin-top: 5%">
        <h4>Crud Cliente</h4>


        <div class="col-md-23">

            <div class="row" style="height: 70px">
                <div class="col-md-2">
                    <input class="form-control" id="id_txt_filtro" name="filtro" placeholder="Ingrese el nombre"
                        type="text" maxlength="30" />
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" id="id_btn_filtrar"
                        style="width: 150px">FILTRA</button>
                </div>
                <div class="col-md-2">
                    <button type="button" id="id_ver_registra" data-toggle='modal' data-target="#id_div_modal_registra"
                        class='btn btn-success' style="width: 150px">REGISTRA</button>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="content">

                        <table id="id_table" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 5%">ID</th>
                                    <th style="width: 12%">Nombres</th>
                                    <th style="width: 12%">DNI</th>
                                    <th style="width: 15%">Correo</th>
                                    <th style="width: 12%">Fec de registro.</th>
                                    <th style="width: 8%">Direcci髇</th>
                                    <th style="width: 8%">Estado </th>
                                    <th style="width: 12%">ID de ubigeo </th>
                                    <th style="width: 8%"> Actualiza </th>
                                    <th style="width: 8%"> Elimina </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="id_div_modal_registra">
            <div class="modal-dialog" style="width: 80%">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding: 35px 50px">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4><span class="glyphicon glyphicon-ok-sign"></span> Registro Cliente</h4>
                    </div>
                    <div class="modal-body" style="padding: 20px 10px;">
                        <form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal" method="post">
                            <div class="panel-group" id="steps">
                                <!-- Step 1 -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps"
                                                href="#stepOne">Datos del Cliente</a></h4>
                                    </div>
                                    <div id="stepOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_reg_nombre"
                                                    style="text-align: left;">Nombres</label>
                                                <div class="col-lg-5">
                                                    <input class="form-control" id="id_reg_nombres" name="nombres"
                                                        placeholder="Ingrese los nombres" type="text" maxlength="40" />
                                                </div>
                                                <label class="col-lg-2 control-label" for="id_reg_dni"
                                                    style="text-align: left;">DNI</label>
                                                <div class="col-lg-4">
                                                    <input class="form-control" id="id_reg_dni" name="dni"
                                                        placeholder="Ingrese el DNI " type="text" maxlength="40" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_reg_correo"
                                                    style="text-align: left;">Correo</label>
                                                <div class="col-lg-5">
                                                    <input class="form-control" id="id_reg_correo" name="correo"
                                                        placeholder="Ingrese el correo" type="text" />
                                                </div>
                                                <label class="col-lg-2 control-label" for="id_reg_direccion"
                                                    style="text-align: left;">Direcci髇</label>
                                                <div class="col-lg-4">
                                                    <input class="form-control" id="id_reg_direccion" name="direccion"
                                                        placeholder="Ingrese su direcci贸n" type="text" maxlength="40" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_reg_estado"
                                                    style="text-align: left;">Estado</label>
                                                <div class="col-lg-3">
                                                    <select id=id_reg_estado name="estado" class='form-control'>
                                                        <option value=" ">[Seleccione Estado]</option>
                                                        <option value="1">[Activo]</option>
                                                        <option value="0">[Inactivo]</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_departamento"
                                                    style="text-align: left;">Departamento</label>
                                                <div class="col-lg-3">
                                                    <select class='form-control' id="id_departamento">
                                                        <option value=" ">[Seleccione Departamento]</option>
                                                    </select>
                                                </div>
                                                <label class="col-lg-1 control-label" for="id_provincia"
                                                    style="text-align: left;">Provincia</label>
                                                <div class="col-lg-3">
                                                    <select class='form-control' id="id_provincia">
                                                        <option value=" ">[Seleccione Provincia]</option>
                                                    </select>
                                                </div>
                                                <label class="col-lg-1 control-label" for="id_distrito"
                                                    style="text-align: left;">Distrito</label>
                                                <div class="col-lg-3">
                                                    <select class='form-control' id="id_distrito"
                                                        name="ubigeo.idUbigeo">
                                                        <option value=" ">[Seleccione Distrito]</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-9">
                                                    <button type="button" class="btn btn-primary"
                                                        id="id_btn_registra">REGISTRA</button>
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

        <div class="modal fade" id="id_div_modal_actualiza">
            <div class="modal-dialog" style="width: 80%">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding: 35px 50px">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Cliente</h4>
                    </div>
                    <div class="modal-body" style="padding: 20px 10px;">
                        <form id="id_form_actualiza" accept-charset="UTF-8" class="form-horizontal" method="post">
                            <div class="panel-group" id="steps">
                                <!-- Step 1 -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps"
                                                href="#stepOne">Datos del Cliente</a></h4>
                                    </div>
                                    <div id="stepOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_ID"
                                                    style="text-align: left;">ID</label>
                                                <div class="col-lg-2">
                                                    <input class="form-control" id="id_ID" readonly="readonly"
                                                        name="idCliente" type="text" maxlength="8" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_act_nombres"
                                                    style="text-align: left;">Nombres</label>
                                                <div class="col-lg-5">
                                                    <input class="form-control" id="id_act_nombres" name="nombres"
                                                        placeholder="Ingrese los nombres" type="text" maxlength="40" />
                                                </div>
                                                <label class="col-lg-2 control-label" for="id_act_dni"
                                                    style="text-align: left;">DNI</label>
                                                <div class="col-lg-4">
                                                    <input class="form-control" id="id_act_dni" name="dni"
                                                        placeholder="Ingrese el DNI" type="text" maxlength="40" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_act_correo"
                                                    style="text-align: left;">Correo</label>
                                                <div class="col-lg-5">
                                                    <input class="form-control" id="id_act_correo" name="correo"
                                                        placeholder="Ingrese el correo" type="text" />
                                                </div>
                                                <label class="col-lg-2 control-label" for="id_act_direccion"
                                                    style="text-align: left;">Direcci贸n</label>
                                                <div class="col-lg-4">
                                                    <input class="form-control" id="id_act_direccion" name="direccion"
                                                        placeholder="Ingrese su direcci贸n" type="text" maxlength="40" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_act_estado"
                                                    style="text-align: left;">Estado</label>
                                                <div class="col-lg-3">
                                                    <select id=id_act_estado name="estado" class='form-control'>
                                                        <option value=" ">[Seleccione Estado]</option>
                                                        <option value="1">[Activo]</option>
                                                        <option value="0">[Inactivo]</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-1 control-label" for="id_act_departamento"
                                                    style="text-align: left;">Departamento</label>
                                                <div class="col-lg-3">
                                                    <select class='form-control' id="id_act_departamento">
                                                        <option value=" ">[Seleccione Departamento]</option>
                                                    </select>
                                                </div>
                                                <label class="col-lg-1 control-label" for="id_act_provincia"
                                                    style="text-align: left;">Provincia</label>
                                                <div class="col-lg-3">
                                                    <select class='form-control' id="id_act_provincia">
                                                        <option value=" ">[Seleccione Provincia]</option>
                                                    </select>
                                                </div>
                                                <label class="col-lg-1 control-label" for="id_act_distrito"
                                                    style="text-align: left;">Distrito</label>
                                                <div class="col-lg-3">
                                                    <select class='form-control' id="id_act_distrito"
                                                        name="ubigeo.idUbigeo">
                                                        <option value=" ">[Seleccione Distrito]</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-9">
                                                    <button type="button" class="btn btn-primary"
                                                        id="id_btn_actualiza">ACTUALIZAR</button>
                                                </div>
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


    <div class="modal fade" id="idModalElimina">
        <div class="modal-dialog" style="width: 60%">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Cliente</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    </div>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script> -->
    <script type="text/javascript">
        $.getJSON("listaDepartamentos", {}, function (data) {
            $.each(data, function (i, item) {
                $("#id_departamento").append("<option value='" + item + "'>" + item + "</option>");
                $("#id_act_departamento").append("<option value='" + item + "'>" + item + "</option>");
            });
        });

        // para el registrar provincia
        $("#id_departamento").change(function () {
            var var_dep = $("#id_departamento").val();

            $("#id_provincia").empty();
            $("#id_provincia").append("<option value=' '>[Seleccione Provincia]</option>");

            $("#id_distrito").empty();
            $("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");

            $.getJSON("listaProvincias", { "departamento": var_dep }, function (data) {
                $.each(data, function (i, item) {
                    $("#id_provincia").append("<option value='" + item + "'>" + item + "</option>");
                });
            });
        });

        // para el actualizar provincia
        $("#id_act_departamento").change(function () {
            var var_dep = $("#id_act_departamento").val();

            $("#id_act_provincia").empty();
            $("#id_act_provincia").append("<option value=' '>[Seleccione Provincia]</option>");

            $("#id_act_distrito").empty();
            $("#id_act_distrito").append("<option value=' '>[Seleccione Distrito]</option>");

            $.getJSON("listaProvincias", { "departamento": var_dep }, function (data) {
                $.each(data, function (i, item) {
                    $("#id_act_provincia").append("<option value='" + item + "'>" + item + "</option>");
                });
            });
        });

        // para registrar distrito
        $("#id_provincia").change(function () {
            var var_dep = $("#id_departamento").val();
            var var_pro = $("#id_provincia").val();

            $("#id_distrito").empty();
            $("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");

            $.getJSON("listaDistritos", { "departamento": var_dep, "provincia": var_pro }, function (data) {
                $.each(data, function (i, item) {
                    $("#id_distrito").append("<option value='" + item.idUbigeo + "'>" + item.distrito + "</option>");
                });
            });
        });

        // para actualizar distrito
        $("#id_act_provincia").change(function () {
            var var_dep = $("#id_act_departamento").val();
            var var_pro = $("#id_act_provincia").val();

            $("#id_act_distrito").empty();
            $("#id_act_distrito").append("<option value=' '>[Seleccione Distrito]</option>");

            $.getJSON("listaDistritos", { "departamento": var_dep, "provincia": var_pro }, function (data) {
                $.each(data, function (i, item) {
                    $("#id_act_distrito").append("<option value='" + item.idUbigeo + "'>" + item.distrito + "</option>");
                });
            });
        });

        $("#id_btn_registra").click(function () {
            var validator = $('#id_form_registra').data('bootstrapValidator');
            validator.validate();

            if (validator.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "registroCrudCliente",
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

        $("#id_btn_filtrar").click(function () {
            var fil = $("#id_txt_filtro").val();
            $.getJSON("consultaCrudCliente", { "filtro": fil }, function (lista) {
                agregarGrilla(lista);
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
                    { data: "idCliente" },
                    { data: "nombres" },
                    { data: "dni" },
                    { data: "correo" },
                    {
                        data: (row, type, val, meta) => new Date(row.fechaRegistro).toLocaleString('es-PE'), className: 'text-center'
                    },
                    { data: "direccion" },
                    {
                        data: (row, type, val, meta) => row.estado === 1 ? '<p>Activo</p>' : '<p>Inactivo</p>', className: 'text-center'
                    },
                    { data: "ubigeo.idUbigeo" },
                    {
                        data: function (row, type, val, meta) {
                            const salida = '<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\'' + row.idCliente + '\',\'' + row.nombres + '\',\'' + row.dni + '\',\'' + row.correo + '\',\'' + row.direccion + '\',\'' + row.estado + '\',\'' + row.ubigeo.departamento + '\',\'' + row.ubigeo.provincia + '\',\'' + row.ubigeo.distrito + '\')">Editar</button>';
                            return salida;
                        }, className: 'text-center'
                    },
                    {
                        data: function (row, type, val, meta) {
                            return '<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="eliminar(\'' + row.idCliente + '\')">Eliminar</button>';
                        }, className: 'text-center'
                    },
                ]
            });
        }

        function eliminar(id) {
            $('input[id=id_elimina]').val(id);
            $('#idFormElimina').submit();
        }

        function eliminar(id) {
            mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminar, null, id);
        }

        function accionEliminar(id, estado) {
            $('#id_elimina').val(id);
            $.ajax({
                type: "POST",
                url: "eliminaCrudCliente",
                data: { "id": id },
                success: function (data) {
                    agregarGrilla(data.lista);
                    mostrarMensaje(data.mensaje);

                },
                error: function () {
                    mostrarMensaje(MSG_ERROR);
                }
            });
        }

        function editar(idCliente, nombres, dni, correo, direccion, estado, departamento, provincia, distrito) {
            $('#id_ID').val(idCliente);
            $('#id_act_nombres').val(nombres);
            $('#id_act_dni').val(dni);
            $('#id_act_correo').val(correo);
            $('#id_act_direccion').val(direccion);
            $('#id_act_estado').val(estado);
            $("#id_act_provincia").empty();
            $("#id_act_distrito").empty();

            $("#id_act_provincia").append("<option value=' ' >[Seleccione Provincia]</option>");
            $("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");


            $('#id_act_departamento').val(departamento);



            $.getJSON("listaProvincias", { "departamento": departamento }, function (data) {
                $.each(data, function (i, obj) {
                    if (obj == provincia) {
                        $("#id_act_provincia").append("<option selected value='" + obj + "'>" + obj + "</option>");
                    } else {
                        $("#id_act_provincia").append("<option value='" + obj + "'>" + obj + "</option>");
                    }
                });
            });

            $.getJSON("listaDistritos", { "provincia": provincia, "departamento": departamento }, function (data) {
                $.each(data, function (index, obj) {
                    if (obj.distrito == distrito) {
                        $("#id_act_distrito").append("<option selected value='" + obj.idUbigeo + "'>" + obj.distrito + "</option>")
                    } else {
                        $("#id_act_distrito").append("<option value='" + obj.idUbigeo + "'>" + obj.distrito + "</option>")
                    }
                });

            });



            $('#id_div_modal_actualiza').modal("show");
        }

        function limpiarFormulario() {
            $('#id_reg_nombres').val('');
            $('#id_reg_dni').val('');
            $('#id_reg_correo').val('');
            $('#id_reg_direccion').val('');
            $('#id_estado').val('');
            $('#id_ubigeo').val('');
        }

        $("#id_btn_actualiza").click(function () {
            var validator = $('#id_form_actualiza').data('bootstrapValidator');
            validator.validate();
            if (validator.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "actualizaCrudCliente",
                    data: $('#id_form_actualiza').serialize(),
                    success: function (data) {
                        agregarGrilla(data.lista);
                        $('#id_div_modal_actualiza').modal("hide");
                        mostrarMensaje(data.mensaje);
                    },
                    error: function () {
                        mostrarMensaje(MSG_ERROR);
                    }
                });
            }
        });

        $('#id_form_registra').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                "nombres": {
                    selector: "#id_reg_nombres",
                    validators: {
                        notEmpty: {
                            message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                "dni": {
                    selector: "#id_reg_dni",
                    validators: {
                        notEmpty: {
                            message: 'El DNI es obligatorio'
                        },
                        stringLength: {
                            min: 8,
                            max: 8,
                            message: 'El DNI debe ser de 8 caracteres'
                        },
                    }
                },
                "correo": {
                    selector: "#id_reg_correo",
                    validators: {
                        notEmpty: {
                            message: 'El correo es obligatorio'
                        },
                        emailAddress: {
                            message: 'El correo no es valido'
                        }
                    }
                },
                "direccion": {
                    selector: "#id_reg_direccion",
                    validators: {
                        notEmpty: {
                            message: 'La direccion es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'La direcci贸n debe ser de 3 a 40 caracteres'
                        },
                    }
                },
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
                "nombres": {
                    selector: "#id_act_nombres",
                    validators: {
                        notEmpty: {
                            message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                "dni": {
                    selector: "#id_act_dni",
                    validators: {
                        notEmpty: {
                            message: 'El DNI es obligatorio'
                        },
                        stringLength: {
                            min: 8,
                            max: 8,
                            message: 'El DNI debe ser de 8 caracteres'
                        },
                    }
                },
                "correo": {
                    selector: "#id_act_correo",
                    validators: {
                        notEmpty: {
                            message: 'El correo es obligatorio'
                        },
                        emailAddress: {
                            message: 'El correo no es valido'
                        }
                    }
                },
                "direccion": {
                    selector: "#id_act_direccion",
                    validators: {
                        notEmpty: {
                            message: 'La direccion es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'La direcci贸n debe ser de 3 a 40 caracteres'
                        },
                    }
                },
            }
        });

    </script>
</body>

</html>