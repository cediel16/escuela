<?php
$grupo = array(
    'type' => 'input',
    'id' => 'grupo',
    'name' => 'grupo',
    'class' => 'form-control'
);

$tabla = array(
    'type' => 'input',
    'id' => 'tabla',
    'name' => 'tabla',
    'class' => 'form-control'
);

$btnGuardarGrupo = array(
    'name' => 'btnGuardarGrupo',
    'id' => 'btnGuardarGrupo',
    'content' => '<span class="icon icon-save"></span> Guardar',
    'class' => 'btn btn-success btn-sm'
);
?>
<div class="top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group">
                    <?php echo form_button($btnGuardarGrupo) ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor('grupos', '<span class="text-danger"><span class="icon icon-remove-sign"></span></span> Cancelar', 'class="btn btn-default btn-sm"') ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor_popup('ayuda/view/grupos/add', '<span class="text-success"><span class="icon icon-question-sign"></span></span> Ayuda', array('class' => 'btn btn-default btn-sm')) ?>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="contenido">
    <div class="container">
        <div class="row">
            <div class="col-md-12" id="mensaje-principal"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <?php echo form_open('', array('id' => 'frmGrupo', 'class' => 'form-horizontal', 'role' => 'form')) ?>   
                <div class="form-group" id="form-group-grupo">
                    <label for="<?php echo $grupo['id'] ?>" class="col-md-1 control-label">Grupo</label>
                    <div class="col-md-4">
                        <?php echo form_input($grupo) ?>
                        <div id="form-msj-grupo"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-tabla">
                    <label for="<?php echo $tabla['id'] ?>" class="col-md-1 control-label">Tabla</label>
                    <div class="col-lg-4">
                        <?php echo form_input($tabla) ?>
                        <div id="form-msj-tabla"></div>
                    </div>
                </div>
                <?php echo form_close() ?>
            </div>
        </div>
    </div>
</div>
<?php echo script_tag('assets/js/grupos/add.js') ?>