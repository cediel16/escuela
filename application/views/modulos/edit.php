<?php
$id = array(
    'name' => 'modulo_id',
    'id' => 'modulo_id',
    'value' => $data['id']
);

$modulo = array(
    'type' => 'input',
    'id' => 'modulo',
    'name' => 'modulo',
    'class' => 'form-control',
    'value' => $data['modulo']
);

$alias = array(
    'type' => 'input',
    'id' => 'alias',
    'name' => 'alias',
    'class' => 'form-control',
    'value' => $data['alias']
);

$descripcion = array(
    'id' => 'descripcion',
    'name' => 'descripcion',
    'class' => 'form-control',
    'rows' => '5',
    'value' => $data['descripcion']
);

$btnGuardarModulo = array(
    'name' => 'btnGuardarModulo',
    'id' => 'btnGuardarModulo',
    'content' => '<span class="icon icon-save"></span> Guardar',
    'class' => 'btn btn-success btn-sm'
);
?>
<div class="top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group">
                    <?php echo form_button($btnGuardarModulo) ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor('modulos', '<span class="text-danger"><span class="icon icon-remove-sign"></span></span> Cancelar', 'class="btn btn-default btn-sm"') ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor_popup('ayuda/view/users/edit', '<span class="text-success"><span class="icon icon-question-sign"></span></span> Ayuda', array('class' => 'btn btn-default btn-sm')) ?>
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
                <input type="hidden" id="<?php echo $id['id'] ?>" name="<?php echo $id['name'] ?>" value="<?php echo $id['value'] ?>" />
                <div class="form-group" id="form-group-modulo">
                    <label for="<?php echo $modulo['id'] ?>" class="col-md-1 control-label">Módulo</label>
                    <div class="col-md-4">
                        <?php echo form_input($modulo) ?>
                        <div id="form-msj-modulo"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-alias">
                    <label for="<?php echo $alias['id'] ?>" class="col-md-1 control-label">Alias</label>
                    <div class="col-lg-4">
                        <?php echo form_input($alias) ?>
                        <div id="form-msj-alias"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-descripcion">
                    <label for="inputPassword1" class="col-md-1 control-label">Descripción</label>
                    <div class="col-lg-4">
                        <?php echo form_textarea($descripcion) ?>
                        <div id="form-msj-descripcion"></div>
                    </div>
                </div>
                <?php echo form_close() ?>
            </div>
        </div>
    </div>
</div>
<?php echo script_tag('assets/js/modulos/edit.js') ?>