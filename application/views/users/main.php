<?php echo link_tag('assets/lib/datatables/css/jquery.datatables.bootstrap.css') ?>
<div class="top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group">
                    <?php echo anchor('users/add', '<span class="icon icon-plus-sign"></span> Nuevo', 'class="btn btn-success btn-sm"') ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor_popup('ayuda/view/users/main', '<span class="text-success"><span class="icon icon-question-sign"></span></span> Ayuda', array('class' => 'btn btn-default btn-sm')) ?>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="contenido">
    <div class="container">
        <div class="row">
            <div class="col-md-12" id="mensaje">
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <ul class="nav nav-pills nav-stacked nav-stacked-seguridad">
                    <li class="active"><?php echo anchor('users', 'Usuarios') ?></li>
                    <li><?php echo anchor('grupos', 'Grupos') ?></li>
                    <li><?php echo anchor('permisos', 'Permisos') ?></li>
                    <li><?php echo anchor('modulos', 'Módulos') ?></li>
                </ul>
                <hr>
                <h4>Filtro <span class="text-muted" style="font-size:10px;">(Próximanente)</span></h4>
                <div class="filtro">
                    <div class="form-group">
                        <select class="form-control disabled" disabled>
                            <option> - Status -</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control disabled" disabled >
                            <option> - Grupo -</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control disabled" disabled>
                            <option> - Status -</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-10">
                <table id="paginado" class="table table-condensed table-bordered" source="<?php echo site_url() ?>/users/paginado">
                    <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Grupo</th>
                            <th>Rol</th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<?php echo script_tag('assets/lib/datatables/js/jquery.datatables.js') ?>
<?php echo script_tag('assets/lib/datatables/js/jquery.datatables.bootstrap.js') ?>
<?php echo script_tag('assets/js/users/main.js') ?>