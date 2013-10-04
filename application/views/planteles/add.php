<?php
$logo = array(
    'type' => 'file',
    'id' => 'logo',
    'name' => 'logo',
    'title' => 'Haz clic para cambiar el logo'
);

$dea = array(
    'type' => 'input',
    'id' => 'dea',
    'name' => 'dea',
    'class' => 'form-control upper',
    'placeholder' => 'Ingrese un código DEA válido',
    'maxlength' => 10
);

$rif = array(
    'type' => 'input',
    'id' => 'rif',
    'name' => 'rif',
    'class' => 'form-control upper',
    'placeholder' => 'Ingrese un RIF válido',
    'maxlength' => 10
);

$nombre_plantel = array(
    'type' => 'input',
    'id' => 'nombre_plantel',
    'name' => 'nombre_plantel',
    'placeholder' => 'Ingrese el nombre del plantel sin caracteres especiales',
    'class' => 'form-control upper'
);

$direccion = array(
    'id' => 'direccion',
    'name' => 'direccion',
    'class' => 'form-control upper',
    'placeholder' => 'Ingrese dirección sin Estado, Municiopio ni Parroquia',
    'rows' => 2
);

$estado = array(
    'id' => 'estado',
    'name' => 'estado',
    'options' => $opt_estados,
    'selected' => 0,
    'class' => "form-control"
);

$municipio = array(
    'id' => 'municipio',
    'name' => 'municipio',
    'options' => $opt_municipios,
    'selected' => '',
    'class' => "form-control"
);

$parroquia = array(
    'id' => 'parroquia',
    'name' => 'parroquia',
    'options' => $opt_parroquias,
    'selected' => '',
    'class' => "form-control"
);

$telefono_plantel = array(
    'type' => 'input',
    'id' => 'telefono_plantel',
    'name' => 'telefono_plantel',
    'class' => 'form-control upper',
    'placeholder' => 'Patrón: 0000-1234567',
    'maxlength' => 12
);

$email_plantel = array(
    'type' => 'input',
    'id' => 'email_plantel',
    'name' => 'email_plantel',
    'placeholder' => 'Ingrese un correo electrónico válido',
    'class' => 'form-control lower'
);

$cedula_director = array(
    'type' => 'input',
    'id' => 'cedula_director',
    'name' => 'cedula_director',
    'placeholder' => 'Patrón: V12345678',
    'maxlength' => 9,
    'class' => 'form-control upper'
);


$titulo_director = array(
    'type' => 'input',
    'id' => 'titulo_director',
    'name' => 'titulo_director',
    'placeholder' => 'Sin caracteres especiales',
    'class' => 'form-control upper'
);

$nombre_director = array(
    'type' => 'input',
    'id' => 'nombre_director',
    'name' => 'nombre_director',
    'placeholder' => 'Sin caracteres especiales',
    'class' => 'form-control upper'
);

$telefono_director = array(
    'type' => 'input',
    'id' => 'telefono_director',
    'name' => 'telefono_director',
    'placeholder' => 'Patrón: 0000-1234567',
    'maxlength' => 12,
    'class' => 'form-control upper'
);

$email_director = array(
    'type' => 'input',
    'id' => 'email_director',
    'name' => 'email_director',
    'placeholder' => 'Ingrese un correo electrónico válido',
    'class' => 'form-control lower'
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
                <div class="btn-group" id="img-loading">
                    <?php echo img(array('src' => 'assets/img/loading.gif', 'alt' => 'Procesando...', 'title' => 'Procesando...')); ?>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="contenido">
    <div class="container">
        <div class="row">
            <div class="col-md-12" id="mensaje-principal"></div>
            <iframe id="frame_upload" name="frame_upload" ></iframe>
        </div>
        <div class="row">
            <div class="col-md-2">
                <legend>Escudo</legend>
                <div class="row">
                    <?php echo form_open('planteles/uplogo', array('id' => 'frmLogo', 'role' => 'form', 'enctype' => 'multipart/form-data', 'target' => 'frame_upload')) ?>
                    <div class="col-md-12">
                        <div class="logo-plantel-wrapper">
                            <div id="logo-plantel">
                                <?php echo img(array('src' => 'assets/img/logo_plantel.png', 'alt' => 'Logo del plantel', 'title' => 'Haz clic para cambiar el logo', 'class' => 'logo-plantel')) ?>
                            </div>
                            <input type="text" id="ok1" name="ok1" value="ok1"/>
                            <?php echo form_upload($logo) ?>
                            <div id="mensaje-logo"></div>
                        </div>
                    </div>
                    <?php echo form_close() ?>
                </div>
            </div>
            <?php echo form_open('', array('id' => 'frmPlantel', 'role' => 'form')) ?>
            <div class="col-md-7">
                <legend>Datos del Plantel</legend>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group" id="form-group-dea">
                            <label for="<?php echo $dea['id'] ?>" class="control-label">Código DEA</label>
                            <?php echo form_input($dea) ?>
                            <div id="form-msj-dea"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group" id="form-group-rif">
                            <label for="<?php echo $rif['id'] ?>" class="control-label">RIF</label>
                            <?php echo form_input($rif) ?>
                            <div id="form-msj-rif"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" id="form-group-nombre-plantel">
                            <label for="<?php echo $nombre_plantel['id'] ?>" class="control-label">Nombre</label>
                            <?php echo form_input($nombre_plantel) ?>
                            <div id="form-msj-nombre-plantel"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group" id="form-group-direccion">
                            <label for="<?php echo $direccion['id'] ?>" class="control-label">Dirección</label>
                            <?php echo form_textarea($direccion) ?>
                            <div id="form-msj-direccion"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group" id="form-group-estado">
                            <label for="<?php echo $estado['id'] ?>" class="control-label">Estado</label>
                            <?php echo form_dropdown($estado['name'], $estado['options'], $estado['selected'], 'id="' . $estado['id'] . '" class="' . $estado['class'] . '"') ?>
                            <div id="form-msj-estado"></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group" id="form-group-municipio">
                            <label for="<?php echo $municipio['id'] ?>" class="control-label">Municipio</label>
                            <?php echo form_dropdown($municipio['name'], $municipio['options'], $municipio['selected'], 'id="' . $municipio['id'] . '" class="' . $municipio['class'] . '"') ?>
                            <div id="form-msj-municipio"></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group" id="form-group-parroquia">
                            <label for="<?php echo $parroquia['id'] ?>" class="control-label">Parroquia</label>
                            <?php echo form_dropdown($parroquia['name'], $parroquia['options'], $parroquia['selected'], 'id="' . $parroquia['id'] . '" class="' . $parroquia['class'] . '"') ?>
                            <div id="form-msj-parroquia"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group" id="form-group-telefono-plantel">
                            <label for="<?php echo $telefono_plantel['id'] ?>" class="control-label">Teléfono</label>
                            <?php echo form_input($telefono_plantel) ?>
                            <div id="form-msj-telefono-plantel"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" id="form-group-email-plantel">
                            <label for="<?php echo $email_plantel['id'] ?>" class="control-label">Correo electrónico</label>
                            <?php echo form_input($email_plantel) ?>
                            <div id="form-msj-email-plantel"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <legend>Datos del Director</legend>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group" id="form-group-cedula-director">
                            <label for="<?php echo $cedula_director['id'] ?>" class="control-label">Cédula</label>
                            <?php echo form_input($cedula_director) ?>
                            <div id="form-msj-cedula-director"></div>
                        </div>
                        <div class="form-group" id="form-group-titulo-director">
                            <label for="<?php echo $titulo_director['id'] ?>" class="control-label">Título</label>
                            <?php echo form_input($titulo_director) ?>
                            <div id="form-msj-titulo-director"></div>
                        </div>
                        <div class="form-group" id="form-group-nombre-director">
                            <label for="<?php echo $nombre_director['id'] ?>" class="control-label">Nombre</label>
                            <?php echo form_input($nombre_director) ?>
                            <div id="form-msj-nombre-director"></div>
                        </div>
                        <div class="form-group" id="form-group-telefono-director">
                            <label for="<?php echo $telefono_director['id'] ?>" class="control-label">Teléfono</label>
                            <?php echo form_input($telefono_director) ?>
                            <div id="form-msj-telefono-director"></div>
                        </div>
                        <div class="form-group" id="form-group-email-director">
                            <label for="<?php echo $email_director['id'] ?>" class="control-label">Correo electrónico</label>
                            <?php echo form_input($email_director) ?>
                            <div id="form-msj-email-director"></div>
                        </div>
                    </div>
                </div>
            </div>
            <?php echo form_close() ?>
        </div>
    </div>
</div>
<?php echo script_tag('assets/js/planteles/add.js') ?>