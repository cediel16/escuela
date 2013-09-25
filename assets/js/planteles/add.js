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
                        $("#form-msj-nombre-plantel").html('<span class="text-danger">' + rst.msj.rif + '</span>');
                    } else {
                        $("#form-group-nombre-plantel").removeClass('has-error');
                        $("#form-msj-nombre-plantel").html('');
                    }                }
            }
        });
    });
}); 