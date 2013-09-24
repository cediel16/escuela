<?php
$usuario = array(
    'type' => 'input',
    'id' => 'usuario',
    'name' => 'usuario',
    'class' => 'form-control'
);

$clave = array(
    'type' => 'password',
    'id' => 'clave',
    'name' => 'clave',
    'class' => 'form-control'
);

$conf_clave = array(
    'type' => 'password',
    'id' => 'conf_clave',
    'name' => 'conf_clave',
    'class' => 'form-control'
);

$email = array(
    'type' => 'input',
    'id' => 'email',
    'name' => 'email',
    'class' => 'form-control',
);

$grupo = array(
    'id' => 'grupo',
    'name' => 'grupo',
    'options' => $opt_grupos,
    'selected' => '',
    'class' => "form-control"
);

$rol = array(
    'id' => 'rol',
    'name' => 'rol',
    'options' => $opt_roles,
    'selected' => '',
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
                    <?php echo anchor('planteles', '<span class="text-danger"><span class="icon icon-remove-sign"></span></span> Cancelar', 'class="btn btn-default btn-sm"') ?>
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
            <div class="col-md-9">
                <legend>Datos del Plantel</legend>
                <?php echo form_open('', array('id' => 'frmUsuario', 'role' => 'form')) ?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>RIF</label>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Dirección</label>
                            <textarea class="form-control"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Estado</label>
                            <select class="form-control"></select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Municipio</label>
                            <select class="form-control"></select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Parroquia</label>
                            <select class="form-control"></select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Teléfono</label>
                            <input type="text" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Correo electrónico</label>
                            <input type="text" class="form-control" />
                        </div>
                    </div>
                </div>
                <?php echo form_close() ?>
            </div>
            <div class="col-md-3">
                <legend>Datos del Director</legend>
                <div class="row">

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Cédula</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Teléfono</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Correo electrónico</label>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo script_tag('assets/js/users/add.js') ?>