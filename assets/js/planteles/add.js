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
            error: function(xhr, textStatus, errorThrown) {
                $("#img-loading").css('display', 'none');
                $("#mensaje-principal").html('<div class="alert alert-danger"><strong>' + textStatus.toUpperCase() + ' ' + xhr.status + ':</strong> ' + errorThrown + '</div>');
            },
            beforeSend: function() {
                $("#mensaje-principal").html('');
                $("#img-loading").css('display', 'inline');
            },
            success: function(rst) {
                $("#img-loading").css('display', 'none');
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

                    $("#form-group-cedula-director").removeClass('has-error');
                    $("#form-msj-cedula-director").html('');
                    $("#cedula_director").val('');

                    $("#form-group-titulo-director").removeClass('has-error');
                    $("#form-msj-titulo-director").html('');
                    $("#titulo_director").val('');

                    $("#form-group-nombre-director").removeClass('has-error');
                    $("#form-msj-nombre-director").html('');
                    $("#nombre_director").val('');

                    $("#form-group-telefono-director").removeClass('has-error');
                    $("#form-msj-telefono-director").html('');
                    $("#telefono_director").val('');

                    $("#form-group-email-director").removeClass('has-error');
                    $("#form-msj-email-director").html('');
                    $("#email_director").val('');

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

                    if (typeof rst.msj.cedula_director !== 'undefined') {
                        $("#form-group-cedula-director").addClass('has-error');
                        $("#form-msj-cedula-director").html('<span class="text-danger">' + rst.msj.cedula_director + '</span>');
                    } else {
                        $("#form-group-cedula-director").removeClass('has-error');
                        $("#form-msj-cedula-director").html('');
                    }

                    if (typeof rst.msj.titulo_director !== 'undefined') {
                        $("#form-group-titulo-director").addClass('has-error');
                        $("#form-msj-titulo-director").html('<span class="text-danger">' + rst.msj.titulo_director + '</span>');
                    } else {
                        $("#form-group-titulo-director").removeClass('has-error');
                        $("#form-msj-titulo-director").html('');
                    }

                    if (typeof rst.msj.nombre_director !== 'undefined') {
                        $("#form-group-nombre-director").addClass('has-error');
                        $("#form-msj-nombre-director").html('<span class="text-danger">' + rst.msj.nombre_director + '</span>');
                    } else {
                        $("#form-group-nombre-director").removeClass('has-error');
                        $("#form-msj-nombre-director").html('');
                    }

                    if (typeof rst.msj.telefono_director !== 'undefined') {
                        $("#form-group-telefono-director").addClass('has-error');
                        $("#form-msj-telefono-director").html('<span class="text-danger">' + rst.msj.telefono_director + '</span>');
                    } else {
                        $("#form-group-telefono-director").removeClass('has-error');
                        $("#form-msj-telefono-director").html('');
                    }

                    if (typeof rst.msj.email_director !== 'undefined') {
                        $("#form-group-email-director").addClass('has-error');
                        $("#form-msj-email-director").html('<span class="text-danger">' + rst.msj.email_director + '</span>');
                    } else {
                        $("#form-group-email-director").removeClass('has-error');
                        $("#form-msj-email-director").html('');
                    }
                }
            }
        });
    });
}); 