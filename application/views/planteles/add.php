<?php
$rif = array(
    'type' => 'input',
    'id' => 'rif',
    'name' => 'rif',
    'class' => 'form-control'
);

$nombre_plantel = array(
    'type' => 'input',
    'id' => 'nombre_plantel',
    'name' => 'nombre_plantel',
    'class' => 'form-control'
);

$direccion = array(
    'id' => 'direccion',
    'name' => 'direccion',
    'class' => 'form-control',
    'rows' => 2
);

$estado = array(
    'id' => 'estado',
    'name' => 'estado',
    'options' => array(),
    'selected' => '',
    'class' => "form-control"
);

$municipio = array(
    'id' => 'municipio',
    'name' => 'municipio',
    'options' => array(),
    'selected' => '',
    'class' => "form-control"
);

$parroquia = array(
    'id' => 'parroquia',
    'name' => 'parroquia',
    'options' => array(),
    'selected' => '',
    'class' => "form-control"
);

$telefono_plantel = array(
    'type' => 'input',
    'id' => 'telefono_plantel',
    'name' => 'telefono_plantel',
    'class' => 'form-control'
);

$email_plantel = array(
    'type' => 'input',
    'id' => 'email_plantel',
    'name' => 'email_plantel',
    'class' => 'form-control'
);

$cedula_director = array(
    'type' => 'input',
    'id' => 'cedula_director',
    'name' => 'cedula_director',
    'class' => 'form-control'
);

$nombre_director = array(
    'type' => 'input',
    'id' => 'nombre_director',
    'name' => 'nombre_director',
    'class' => 'form-control'
);

$telefono_director = array(
    'type' => 'input',
    'id' => 'telefono_director',
    'name' => 'telefono_director',
    'class' => 'form-control'
);

$email_director = array(
    'type' => 'input',
    'id' => 'email_director',
    'name' => 'email_director',
    'class' => 'form-control'
);

$btnGuardarPlantel = array(
    'name' => 'btnGuardarPlantel',
    'id' => 'btnGuardarPlantel',
    'content' => '<span class="icon icon-save"></span> Guardar',
    'class' => 'btn btn-success btn-sm'
);
?>
<div class="top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group">
                    <?php echo form_button($btnGuardarPlantel) ?>
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
                        <div class="form-group" id="form-group-rif">
                            <label for="<?php echo $rif['id'] ?>">RIF</label>
                            <?php echo form_input($rif) ?>
                            <div id="form-msj-rif"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" id="form-group-nombre-plantel">
                            <label for="<?php echo $nombre_plantel['id'] ?>">Nombre</label>
                            <?php echo form_input($nombre_plantel) ?>
                            <div id="form-msj-nombre-plantel"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group" id="form-group-direccion">
                            <label for="<?php echo $direccion['id'] ?>">Dirección</label>
                            <?php echo form_textarea($direccion) ?>
                            <div id="form-msj-direccion"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group" id="form-group-estado">
                            <label for="<?php echo $estado['id'] ?>">Estado</label>
                            <?php echo form_dropdown($estado['name'], $estado['options'], $estado['selected'], 'id="' . $estado['id'] . '" class="' . $estado['class'] . '"') ?>
                            <div id="form-msj-estado"></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group" id="form-group-municipio">
                            <label for="<?php echo $municipio['id'] ?>">Municipio</label>
                            <?php echo form_dropdown($municipio['name'], $municipio['options'], $municipio['selected'], 'id="' . $municipio['id'] . '" class="' . $municipio['class'] . '"') ?>
                            <div id="form-msj-municipio"></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group" id="form-group-parroquia">
                            <label for="<?php echo $parroquia['id'] ?>">Parroquia</label>
                            <?php echo form_dropdown($parroquia['name'], $parroquia['options'], $parroquia['selected'], 'id="' . $municipio['id'] . '" class="' . $parroquia['class'] . '"') ?>
                            <div id="form-msj-parroquia"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group" id="form-group-telefono-plantel">
                            <label for="<?php echo $telefono_plantel['id'] ?>">Teléfono</label>
                            <?php echo form_input($telefono_plantel) ?>
                            <div id="form-msj-telefono-plantel"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" id="form-group-email-plantel">
                            <label for="<?php echo $email_plantel['id'] ?>">Correo electrónico</label>
                            <?php echo form_input($email_plantel) ?>
                            <div id="form-msj-email-plantel"></div>
                        </div>
                    </div>
                </div>
                <?php echo form_close() ?>
            </div>
            <div class="col-md-3">
                <legend>Datos del Director</legend>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group" id="form-group-cedula-director">
                            <label for="<?php echo $cedula_director['id'] ?>">Cédula</label>
                            <?php echo form_input($cedula_director) ?>
                            <div id="form-msj-cedula-director"></div>
                        </div>
                        <div class="form-group" id="form-group-nombre-director">
                            <label for="<?php echo $nombre_director['id'] ?>">Teléfono</label>
                            <?php echo form_input($nombre_director) ?>
                            <div id="form-msj-nombre-director"></div>
                        </div>
                        <div class="form-group" id="form-group-telefono-director">
                            <label for="<?php echo $telefono_director['id'] ?>">Teléfono</label>
                            <?php echo form_input($telefono_director) ?>
                            <div id="form-msj-telefono-director"></div>
                        </div>
                        <div class="form-group" id="form-group-email-director">
                            <label for="<?php echo $email_director['id'] ?>">Correo electrónico</label>
                            <?php echo form_input($email_director) ?>
                            <div id="form-msj-email-director"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo script_tag('assets/js/users/add.js') ?>