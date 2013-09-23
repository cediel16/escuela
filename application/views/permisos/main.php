<?php
$total_roles = count($lista_roles);
?>
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
                    <li><?php echo anchor('roles', 'Roles') ?></li>
                    <li class="active"><?php echo anchor('permisos', 'Permisos') ?></li>
                    <li><?php echo anchor('modulos', 'Módulos') ?></li>
                    <li><?php echo anchor('grupos', 'Grupos') ?></li>
                </ul>
            </div>
            <div class="col-md-10">
                <table id="lista_permisos" class="table table-condensed table-bordered" source="<?php echo site_url() ?>/permisos/paginado_roles">
                    <thead>
                        <tr >
                            <th>Permiso</th>
                            <?php foreach ($lista_roles as $r) { ?>
                                <td style="text-align:center;"><?php echo $r->rol ?></td>
                            <?php } ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($lista_modulos as $m) { ?>
                            <tr class="success">
                                <th colspan="<?php echo ($total_roles + 1) ?>"><?php echo $m->modulo ?></th>
                            </tr>
                            <?php $lista_permisos = $this->Permisos_model->lista_permisos_por_modulo($m->id) ?>
                            <?php if (count($lista_permisos) > 0) { ?>
                                <?php foreach ($lista_permisos as $p) { ?>
                                    <tr>
                                        <td><?php echo $p->permiso ?></td>
                                        <?php for ($k = 1; $k <= $total_roles; $k++) { ?>
                                            <td align="center"><input type="checkbox" /></td>
                                        <?php } ?>
                                    </tr>
                                <?php } ?>
                            <?php } ?>
                        <?php } ?>
                    </tbody>
                </table>
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