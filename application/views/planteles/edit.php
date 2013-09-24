<?php
$id = array(
    'name' => 'usuario_id',
    'id' => 'usuario_id',
    'value' => $data['id']
);

$usuario = array(
    'type' => 'input',
    'id' => 'usuario',
    'name' => 'usuario',
    'value' => $data['usuario'],
    'class' => 'form-control'
);

$clave = array(
    'type' => 'password',
    'id' => 'clave',
    'name' => 'clave',
    'value' => '',
    'class' => 'form-control'
);

$conf_clave = array(
    'type' => 'password',
    'id' => 'conf_clave',
    'name' => 'conf_clave',
    'value' => '',
    'class' => 'form-control'
);

$email = array(
    'type' => 'input',
    'id' => 'email',
    'name' => 'email',
    'value' => $data['email'],
    'class' => 'form-control',
);

$grupo = array(
    'id' => 'grupo',
    'name' => 'grupo',
    'options' => $opt_grupos,
    'selected' => $data['grupo_fkey'],
    'class' => "form-control",
    'disabled' => 'disabled'
);

$rol = array(
    'id' => 'rol',
    'name' => 'rol',
    'options' => $opt_roles,
    'selected' => $data['rol_fkey'],
    'class' => "form-control"
);

$status = array(
    'id' => 'status',
    'name' => 'status',
    'options' => array('activo' => 'Activo', 'inactivo' => 'Inactivo'),
    'selected' => $data['status'],
    'class' => "form-control"
);

$btnGuardarUsuario = array(
    'name' => 'btnGuardarUsuario',
    'id' => 'btnGuardarUsuario',
    'content' => '<span class="icon icon-save"></span> Guardar',
    'class' => 'btn btn-success btn-sm'
);
?>
<div class="top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group">
                    <?php echo form_button($btnGuardarUsuario) ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor('users', '<span class="text-danger"><span class="icon icon-remove-sign"></span></span> Cancelar', 'class="btn btn-default btn-sm"') ?>
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
                <?php echo form_open('', array('id' => 'frmUsuario', 'class' => 'form-horizontal', 'role' => 'form')) ?>
                <div class="form-group" id="form-group-usuario">
                    <input type="hidden" id="<?php echo $id['id'] ?>" name="<?php echo $id['name'] ?>" value="<?php echo $id['value'] ?>" />
                    <label for="<?php echo $usuario['id'] ?>" class="col-md-1 control-label">Usuario</label>
                    <div class="col-md-4">
                        <?php echo form_input($usuario) ?>
                        <div id="form-msj-usuario"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-email">
                    <label for="<?php echo $email['id'] ?>" class="col-md-1 control-label">Correo electrónico</label>
                    <div class="col-md-4">
                        <?php echo form_input($email) ?>
                        <div id="form-msj-email"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-clave">
                    <label for="<?php echo $clave['id'] ?>" class="col-md-1 control-label">Contraseña</label>
                    <div class="col-md-4">
                        <?php echo form_input($clave) ?>
                        <div id="form-msj-clave"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-conf-clave">
                    <label for="<?php echo $conf_clave['id'] ?>" class="col-md-1 control-label">Confirmar contraseña</label>
                    <div class="col-md-4">
                        <?php echo form_input($conf_clave) ?>
                        <div id="form-msj-conf-clave"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-grupo">
                    <label for="<?php echo $grupo['id'] ?>" class="col-md-1 control-label">Grupo</label>
                    <div class="col-md-4">
                        <?php echo form_dropdown($grupo['name'], $grupo['options'], $grupo['selected'], 'id="' . $grupo['id'] . '" class="' . $grupo['class'] . '" ' . $grupo['disabled']) ?>
                        <div id="form-msj-grupo"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-rol">
                    <label for="<?php echo $rol['id'] ?>" class="col-md-1 control-label">Rol</label>
                    <div class="col-md-4">
                        <?php echo form_dropdown($rol['name'], $rol['options'], $rol['selected'], 'id="' . $rol['id'] . '" class="' . $rol['class'] . '"') ?>
                        <div id="form-msj-rol"></div>
                    </div>
                </div>
                <div class="form-group" id="form-group-status">
                    <label for="<?php echo $status['id'] ?>" class="col-md-1 control-label">Status</label>
                    <div class="col-md-4">
                        <?php echo form_dropdown($status['name'], $status['options'], $status['selected'], 'id="' . $status['id'] . '" class="' . $status['class'] . '"') ?>
                        <div id="form-msj-status"></div>
                    </div>
                </div>
                <?php echo form_close() ?>
            </div>
        </div>
    </div>
</div>
<?php echo script_tag('assets/js/users/edit.js') ?>