<?php echo link_tag('assets/lib/datatables/css/jquery.datatables.bootstrap.css') ?>
<div class="top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="btn-group">
                    <?php echo anchor('permisos/add', '<span class="icon icon-plus-sign"></span> Nuevo', 'class="btn btn-success btn-sm"') ?>
                </div>
                <div class="btn-group">
                    <?php echo anchor_popup('ayuda/view/permisos/main', '<span class="text-success"><span class="icon icon-question-sign"></span></span> Ayuda', array('class' => 'btn btn-default btn-sm')) ?>
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
                    <li><?php echo anchor('users', 'Usuarios') ?></li>
                    <li><?php echo anchor('grupos', 'Grupos') ?></li>
                    <li class="active"><?php echo anchor('permisos', 'Permisos') ?></li>
                    <li><?php echo anchor('modulos', 'Módulos') ?></li>
                </ul>
            </div>
            <div class="col-md-10">
                <ul class="nav nav-tabs" style="margin-bottom:6px;">
                    <li class="pull-right"><a href="#roles" data-toggle="tab">Roles</a></li>
                    <li class="active pull-right"><a href="#permisos" data-toggle="tab">Permisos</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="permisos">
                        <table id="paginado_permisos" class="table table-condensed table-bordered" source="<?php echo site_url() ?>/permisos/paginado">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="tab-pane" id="roles">
                        <table id="paginado_roles" class="table table-condensed table-bordered" source="<?php echo site_url() ?>/permisos/paginado">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th></th>
                                </tr>
                            </thead>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#myTab a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });
</script>
<?php echo script_tag('assets/lib/datatables/js/jquery.datatables.js') ?>
<?php echo script_tag('assets/lib/datatables/js/jquery.datatables.bootstrap.js') ?>
<?php echo script_tag('assets/js/permisos/main.js') ?>
<?php echo script_tag('assets/js/roles/main.js') ?>