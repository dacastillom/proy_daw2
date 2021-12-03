<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

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

    <!-- <script src="js/jquery.min.js"></script> -->
    <!-- <script src="js/bootstrap.min.js"></script> -->
    <!-- <script src="js/bootstrapValidator.js"></script> -->

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>PROYECTO - La Calera</title>
</head>

<body>

    <div class="top-content">
        <div class="inner-bg">
            <div class="container">
                <c:if test="${param.error}">
                    <div class="alert alert-danger fade in" id="success-alert">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <strong>Credenciales erroneas</strong>
                    </div>
                </c:if>
                <h1 class="text-center bold" style="margin-bottom: 50px;">La Calera</h1>
                <div class="d-flex flex-column justify-content-center align-items-center">
                        <img class="img-fluid" width="150" alt="la-calera" src="https://ciber-la-calera.web.app/static/media/lacalera.95cc6217.png"/>
                        <form id="id_form" action="login" method="post" class="login-form">
                            <div class="form-group">
                                <label class="sr-only" for="login">Usuario</label>
                                <input type="text" name="login" id="login" placeholder="Ingrese Usuario"
                                    class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">Clave</label>
                                <input type="password" name="password" placeholder="Clave..."
                                    class="form-password form-control" id="password" maxlength="20" value="">
                            </div>
                            <button type="submit" class="btn btn-dark" style="width: 100%;" >Ingresar</button>
                        </form>
                </div>

            </div>
        </div>

    </div>



    <script type="text/javascript">
        // $("#success-alert").fadeTo(1000, 500).slideUp(500, function () {
        //     $("#success-alert").slideUp(500);
        // });
    </script>


    <script type="text/javascript">
        // $(document).ready(function () {
        //     $('#id_form').bootstrapValidator({
        //         message: 'This value is not valid',
        //         feedbackIcons: {
        //             valid: 'glyphicon glyphicon-ok',
        //             invalid: 'glyphicon glyphicon-remove',
        //             validating: 'glyphicon glyphicon-refresh'
        //         },
        //         fields: {
        //             dni: {
        //                 validators: {
        //                     notEmpty: {
        //                         message: 'El usuario es obligatorio'
        //                     },
        //                     stringLength: {
        //                         message: 'El usuario es de 3 a 20 caracteres',
        //                         min: 3,
        //                         max: 20
        //                     }
        //                 }
        //             },
        //             password: {
        //                 validators: {
        //                     notEmpty: {
        //                         message: 'La contrase�a es obligatorio'
        //                     },
        //                     stringLength: {
        //                         message: 'La contrase�a es de 3 a 20 caracteres',
        //                         min: 3,
        //                         max: 20
        //                     }
        //                 }
        //             }
        //         }
        //     });

            // $('#validateBtn').click(function () {
            //     $('#id_form').bootstrapValidator('validate');
            // });
        // });
    </script>

</body>

</html>