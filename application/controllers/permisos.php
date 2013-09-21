<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Permisos extends CI_Controller {

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     * 		http://example.com/index.php/welcome
     * 	- or -  
     * 		http://example.com/index.php/welcome/index
     * 	- or -
     * Since this controller is set as the default controller in 
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */
    public function __construct() {
        parent::__construct();
        //$this->output->enable_profiler(TRUE);
    }

    public function add() {
        $data['titulo'] = 'Agregar Nuevo Usuario';
        $this->tpl->view_basic('permisos/main', $data);
    }

    public function index() {
        $this->load->model('Roles_model');
        $this->load->model('Modulos_model');
        $this->load->model('Permisos_model');
        $data['titulo'] = 'Administrador de Permisos';
        $data['lista_roles'] = $this->Roles_model->lista_roles();
        $data['lista_modulos'] = $this->Modulos_model->lista_modulos();
        $this->tpl->view_basic('permisos/main', $data);
    }

    public function paginado_roles() {
        $this->load->model('Roles_model');
        echo json_encode($this->Roles_model->paginado());
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */