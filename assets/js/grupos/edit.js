$(document).ready(function(){
    $("#btnGuardarGrupo").click(function(){
        $.ajax({
            url:$("#frmGrupo").attr('action'),
            type:'post',
            dataType:'json',
            data:$("#frmGrupo").serialize(),
            success:function(rst){
                if(rst.respuesta===true){
                    $("#form-group-grupo").removeClass('has-error');
                    $("#form-msj-grupo").html('');
                    $("#form-group-tabla").removeClass('has-error');
                    $("#form-msj-tabla").html('');
                    $("#mensaje-principal").html(rst.mensaje_principal);
                }else{
                    if(typeof rst.msj.grupo !=='undefined'){
                        $("#form-group-grupo").addClass('has-error');
                        $("#form-msj-grupo").html('<span class="text-danger">'+rst.msj.grupo+'</span>');                        
                    }else{
                        $("#form-group-grupo").removeClass('has-error');
                        $("#form-msj-grupo").html('');                        
                    }
                    if(typeof rst.msj.tabla !=='undefined'){
                        $("#form-group-tabla").addClass('has-error');
                        $("#form-msj-tabla").html('<span class="text-danger">'+rst.msj.tabla+'</span>');
                    }else{
                        $("#form-group-tabla").removeClass('has-error');
                        $("#form-msj-tabla").html('');                                                
                    }
                }
            }
        });
    });
}) 