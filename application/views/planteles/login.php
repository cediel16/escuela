<?php
$usr = array(
    'id' => 'usr',
    'name' => 'usr',
    'class' => 'form-control'
);


$clv = array(
    'id' => 'clv',
    'name' => 'clv',
    'class' => 'form-control'
);

$iniciar_sesion = array(
    'value' => 'Iniciar sesión',
    'class' => 'btn btn-default'
);
?>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi sitio web</title>
        <?php echo link_tag('assets/css/bootstrap.css') ?>
        <?php echo link_tag('http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css') ?>
        <?php echo link_tag('assets/css/main.css') ?>
        <?php echo script_tag('assets/js/jquery-1.10.2.js') ?>
        <?php echo script_tag('assets/js/bootstrap.js') ?>
    </head>
    <body>
        <header class="header-login">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <?php echo img('assets/img/logo.png') ?>
                    </div>
                    <div class="col-md-10 titulo">
                        <?php echo $titulo ?>
                    </div>
                </div>
            </div>
        </header>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    Explicacion del sistema...
                </div>
                <div class="col-md-4">

                    <?php echo form_open() ?>

                    <div class="form-group">
                        <label for="usr">Usuario</label>
                        <?php echo form_input($usr) ?>
                    </div>
                    <div class="form-group">
                        <label for="clv">Contraseña</label>
                        <?php echo form_password($clv) ?>
                    </div>
                    <div class="form-group">
                        <?php echo form_submit($iniciar_sesion) ?>
                    </div>
                    <div class="form-group">
                        <?php echo $msj_login; ?>
                    </div>
                    <?php echo form_close() ?>
                </div>
            </div>
        </div>
        <footer>
        </footer>
    </body>
</html>