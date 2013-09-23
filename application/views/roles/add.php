<?php
$rol = array(
    'type' => 'input',
    'id' => 'rol',
    'name' => 'rol',
    'class' => 'form-control'
);


$btnGuardarRol = array(
    'name' => 'btnGuardarRol',
    'id' => 'btnGuardarRol',
    'content' => '<span class="icon icon-save"></span> Guardar',
    'class' => 'btn btn-success btn-sm'
);
?>
<div class="top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group">
                    <?php echo form_button($btnGuardarRol) ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor('roles', '<span class="text-danger"><span class="icon icon-remove-sign"></span></span> Cancelar', 'class="btn btn-default btn-sm"') ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor_popup('ayuda/view/users/add', '<span class="text-success"><span class="icon icon-question-sign"></span></span> Ayuda', array('class' => 'btn btn-default btn-sm')) ?>
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
                <?php echo form_open('', array('id' => 'frmModulo', 'class' => 'form-horizontal', 'role' => 'form')) ?>   
                <div class="form-group" id="form-group-modulo">
                    <label for="<?php echo $rol['id'] ?>" class="col-md-1 control-label">Rol</label>
                    <div class="col-md-4">
                        <?php echo form_input($rol) ?>
                        <div id="form-msj-rol"></div>
                    </div>
                </div>
                <?php echo form_close() ?>
            </div>
        </div>
    </div>
</div>
<?php echo script_tag('assets/js/modulos/add.js') ?>