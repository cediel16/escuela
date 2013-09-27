$(document).ready(function() {
    $("#estado").change(function() {
        $.ajax({
            url: 'ajax',
            type: 'post',
            dataType: 'json',
            data: {
                'switch': 'opt_municipios',
                'estado': $(this).val()
            },
            success: function(rst) {
                $('#municipio').empty();
                $('#parroquia').empty();
                if (rst !== null) {
                    $('#municipio')
                            .append('<option value="0">- Seleccione -</option>')
                            .find('option:first')
                            .attr("selected", "selected");
                    $.each(rst, function(i, value) {
                        $('#municipio').append('<option value=' + i + '>' + value + '</option>');
                    });
                }
            }
        });
    });

    $("#municipio").change(function() {
        $.ajax({
            url: 'ajax',
            type: 'post',
            dataType: 'json',
            data: {
                'switch': 'opt_parroquias',
                'municipio': $(this).val()
            },
            success: function(rst) {
                $('#parroquia').empty();
                if (rst !== null) {
                    $('#parroquia')
                            .append('<option value="0">- Seleccione -</option>')
                            .find('option:first')
                            .attr("selected", "selected");
                    $.each(rst, function(i, value) {
                        $('#parroquia').append('<option value=' + i + '>' + value + '</option>');
                    });
                }
            }
        });
    });


    $("#btnGuardarPlantel").click(function() {
        $.ajax({
            url: $("#frmPlantel").attr('action'),
            type: 'post',
            dataType: 'json',
            data: $("#frmPlantel").serialize(),
            success: function(rst) {
                if (rst.respuesta === true) {
                    $("#form-group-dea").removeClass('has-error');
                    $("#form-msj-dea").html('');
                    $("#dea").val('');

                    $("#form-group-rif").removeClass('has-error');
                    $("#form-msj-rif").html('');
                    $("#rif").val('');

                    $("#form-group-nombre-plantel").removeClass('has-error');
                    $("#form-msj-nombre-plantel").html('');
                    $("#nombre_plantel").val('');

                    $("#form-group-direccion").removeClass('has-error');
                    $("#form-msj-direccion").html('');
                    $("#direccion").val('');

                    $("#form-group-estado").removeClass('has-error');
                    $("#form-msj-estado").html('');
                    $("#estado").val('');

                    $("#form-group-municipio").removeClass('has-error');
                    $("#form-msj-municipio").html('');
                    $("#municipio").val('');

                    $("#form-group-parroquia").removeClass('has-error');
                    $("#form-msj-parroquia").html('');
                    $("#parroquia").val('');

                    $("#form-group-telefono-plantel").removeClass('has-error');
                    $("#form-msj-telefono-plantel").html('');
                    $("#telefono_plantel").val('');

                    $("#form-group-email-plantel").removeClass('has-error');
                    $("#form-msj-email-plantel").html('');
                    $("#email_plantel").val('');



                    //

//                    $("#form-group-email").removeClass('has-error');
//                    $("#form-msj-email").html('');
//                    $("#email").val('');
//
//                    $("#form-group-clave").removeClass('has-error');
//                    $("#form-msj-clave").html('');
//                    $("#form-group-conf-clave").removeClass('has-error');
//                    $("#clave").val('');
//                    $("#conf_clave").val('');
//
//                    $("#form-group-grupo").removeClass('has-error');
//                    $("#form-msj-grupo").html('');
//                    $("#grupo").val('');
//
//                    $("#form-group-rol").removeClass('has-error');
//                    $("#form-msj-rol").html('');
//                    $("#rol").val('');
//
                    $("#mensaje-principal").html(rst.mensaje_principal);
                } else {
                    if (typeof rst.msj.dea !== 'undefined') {
                        $("#form-group-dea").addClass('has-error');
                        $("#form-msj-dea").html('<span class="text-danger">' + rst.msj.dea + '</span>');
                    } else {
                        $("#form-group-dea").removeClass('has-error');
                        $("#form-msj-dea").html('');
                    }
                    if (typeof rst.msj.rif !== 'undefined') {
                        $("#form-group-rif").addClass('has-error');
                        $("#form-msj-rif").html('<span class="text-danger">' + rst.msj.rif + '</span>');
                    } else {
                        $("#form-group-rif").removeClass('has-error');
                        $("#form-msj-rif").html('');
                    }
                    if (typeof rst.msj.nombre_plantel !== 'undefined') {
                        $("#form-group-nombre-plantel").addClass('has-error');
                        $("#form-msj-nombre-plantel").html('<span class="text-danger">' + rst.msj.nombre_plantel + '</span>');
                    } else {
                        $("#form-group-nombre-plantel").removeClass('has-error');
                        $("#form-msj-nombre-plantel").html('');
                    }
                    if (typeof rst.msj.direccion !== 'undefined') {
                        $("#form-group-direccion").addClass('has-error');
                        $("#form-msj-direccion").html('<span class="text-danger">' + rst.msj.direccion + '</span>');
                    } else {
                        $("#form-group-direccion").removeClass('has-error');
                        $("#form-msj-direccion").html('');
                    }

                    if (typeof rst.msj.estado !== 'undefined') {
                        $("#form-group-estado").addClass('has-error');
                        $("#form-msj-estado").html('<span class="text-danger">' + rst.msj.estado + '</span>');
                    } else {
                        $("#form-group-estado").removeClass('has-error');
                        $("#form-msj-estado").html('');
                    }

                    if (typeof rst.msj.municipio !== 'undefined') {
                        $("#form-group-municipio").addClass('has-error');
                        $("#form-msj-municipio").html('<span class="text-danger">' + rst.msj.municipio + '</span>');
                    } else {
                        $("#form-group-municipio").removeClass('has-error');
                        $("#form-msj-municipio").html('');
                    }

                    if (typeof rst.msj.parroquia !== 'undefined') {
                        $("#form-group-parroquia").addClass('has-error');
                        $("#form-msj-parroquia").html('<span class="text-danger">' + rst.msj.parroquia + '</span>');
                    } else {
                        $("#form-group-parroquia").removeClass('has-error');
                        $("#form-msj-parroquia").html('');
                    }

                    if (typeof rst.msj.telefono_plantel !== 'undefined') {
                        $("#form-group-telefono-plantel").addClass('has-error');
                        $("#form-msj-telefono-plantel").html('<span class="text-danger">' + rst.msj.telefono_plantel + '</span>');
                    } else {
                        $("#form-group-telefono-plantel").removeClass('has-error');
                        $("#form-msj-telefono-plantel").html('');
                    }

                    if (typeof rst.msj.email_plantel !== 'undefined') {
                        $("#form-group-email-plantel").addClass('has-error');
                        $("#form-msj-email-plantel").html('<span class="text-danger">' + rst.msj.email_plantel + '</span>');
                    } else {
                        $("#form-group-email-plantel").removeClass('has-error');
                        $("#form-msj-email-plantel").html('');
                    }
                }
            }
        });
    });
}); 