<nav role="navigation" class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button data-target=".navbar-ex8-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse navbar-ex8-collapse">
            <ul class="nav navbar-nav">
                <li><?php echo anchor('planteles', 'Planteles') ?></li>
                <li><?php echo anchor('users', 'Usuarios') ?></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo ($this->session->userdata('nombre')=='') ? $this->session->userdata('usuario') : $this->session->userdata('nombre') ?> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><?php echo anchor('users/profile/'.$this->session->userdata('usuario_id'), '<i class="icon icon-user"></i> Ver perfil') ?></li>
                        <li role="presentation" class="divider"></li>
                        <li><?php echo anchor('users/logout', '<i class="icon icon-off"></i> Cerrar sesión') ?></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>