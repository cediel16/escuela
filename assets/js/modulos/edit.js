$(document).ready(function(){
    $("#btnGuardarModulo").click(function(){
        $("#form-group-modulo").removeClass('has-error');
        $("#form-msj-modulo").html('');
        $("#form-group-alias").removeClass('has-error');
        $("#form-msj-alias").html('');
        $("#form-group-descripcion").removeClass('has-error');
        $("#form-msj-descripcion").html('');
        $.ajax({
            url:$("#frmModulo").attr('action'),
            type:'post',
            dataType:'json',
            data:$("#frmModulo").serialize(),
            success:function(rst){
                if(rst.respuesta===true){
                    $("#form-group-modulo").removeClass('has-error');
                    $("#form-msj-modulo").html('');
                    $("#form-group-alias").removeClass('has-error');
                    $("#form-msj-alias").html('');
                    $("#form-group-descripcion").removeClass('has-error');
                    $("#form-msj-descripcion").html('');
                    $("#mensaje-principal").html(rst.mensaje_principal);
                }else{
                    if(typeof rst.msj.modulo !=='undefined'){
                        $("#form-group-modulo").addClass('has-error');
                        $("#form-msj-modulo").html('<span class="text-danger">'+rst.msj.modulo+'</span>');                        
                    }
                    if(typeof rst.msj.alias !=='undefined'){
                        $("#form-group-alias").addClass('has-error');
                        $("#form-msj-alias").html('<span class="text-danger">'+rst.msj.alias+'</span>');
                    }
                    if(typeof rst.msj.descripcion !=='undefined'){
                        $("#form-group-descripcion").addClass('has-error');
                        $("#form-msj-descripcion").html('<span class="text-danger">'+rst.msj.descripcion+'</span>');
                    }
                }
            }
        });
    });
}) 