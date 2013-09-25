$(document).ready(function(){
    $("#btnGuardarUsuario").click(function(){
        /*
        $("#form-group-usuario").removeClass('has-error');
        $("#form-msj-usuario").html('');
        $("#form-group-email").removeClass('has-error');
        $("#form-msj-email").html('');
        $("#form-group-clave").removeClass('has-error');
        $("#form-msj-clave").html('');
        $("#form-group-conf-clave").removeClass('has-error');
        $("#form-group-grupo").removeClass('has-error');
        $("#form-msj-grupo").html('');
        $("#form-group-rol").removeClass('has-error');
        $("#form-msj-rol").html('');
        */
        $.ajax({
            url:$("#frmUsuario").attr('action'),
            type:'post',
            dataType:'json',
            data:$("#frmUsuario").serialize(),
            success:function(rst){
                if(rst.respuesta===true){
                    $("#form-group-usuario").removeClass('has-error');
                    $("#form-msj-usuario").html('');
                    
                    $("#form-group-email").removeClass('has-error');
                    $("#form-msj-email").html('');
                    
                    $("#form-group-clave").removeClass('has-error');
                    $("#form-msj-clave").html('');
                    $("#form-group-conf-clave").removeClass('has-error');
                    $("#clave").val('');
                    $("#conf_clave").val('');
                    
                    $("#form-group-grupo").removeClass('has-error');
                    $("#form-msj-grupo").html('');
                    
                    $("#form-group-rol").removeClass('has-error');
                    $("#form-msj-rol").html('');

                    $("#mensaje-principal").html(rst.mensaje_principal);
                }else{
                    if(typeof rst.msj.usuario !=='undefined'){
                        $("#form-group-usuario").addClass('has-error');
                        $("#form-msj-usuario").html('<span class="text-danger">'+rst.msj.usuario+'</span>');
                    }else{
                        $("#form-group-usuario").removeClass('has-error');
                        $("#form-msj-usuario").html('');
                    }
                    if(typeof rst.msj.email !=='undefined'){
                        $("#form-group-email").addClass('has-error');
                        $("#form-msj-email").html('<span class="text-danger">'+rst.msj.email+'</span>');
                    }else{
                        $("#form-group-email").removeClass('has-error');
                        $("#form-msj-email").html('');
                    }
                    if(typeof rst.msj.clave !=='undefined'){
                        $("#form-group-clave").addClass('has-error');
                        $("#form-group-conf-clave").addClass('has-error');
                        $("#form-msj-clave").html('<span class="text-danger">'+rst.msj.clave+'</span>');
                    }else{
                        $("#form-group-clave").removeClass('has-error');
                        $("#form-group-conf-clave").removeClass('has-error');
                        $("#form-msj-clave").html('');
                    }
                    if(typeof rst.msj.grupo !=='undefined'){
                        $("#form-group-grupo").addClass('has-error');
                        $("#form-msj-grupo").html('<span class="text-danger">'+rst.msj.grupo+'</span>');
                    }else{
                        $("#form-group-grupo").removeClass('has-error');
                        $("#form-msj-grupo").html('');
                    }
                    if(typeof rst.msj.rol !=='undefined'){
                        $("#form-group-rol").addClass('has-error');
                        $("#form-msj-rol").html('<span class="text-danger">'+rst.msj.rol+'</span>');
                    }else{
                        $("#form-group-rol").removeClass('has-error');
                        $("#form-msj-rol").html('');
                    }
                }
            }
        });
    });
}) 