<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Modulos extends CI_Controller {

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
    }

    public function add() {
        if (!$this->input->post()) {
            //$this->output->enable_profiler(TRUE);
            $data['titulo'] = 'Administrador de Módulos: Agregar Nuevo Módulo ';
            $this->tpl->view_basic('modulos/add', $data);
        } else {
            $respuesta = TRUE;
            $modulo = trim($this->input->post('modulo'));
            $alias = strtolower(str_replace(' ', '', $this->input->post('alias')));
            $descripcion = trim($this->input->post('descripcion'));
            $this->load->model('Modulos_model');
            $mensaje_principal = '';
            $msj = array();
            if ($modulo == '') {
                $respuesta = FALSE;
                $msj['modulo'] = 'Este campo es obligatorio';
            } elseif ($this->Modulos_model->existe_modulo($modulo)) {
                $respuesta = FALSE;
                $msj['modulo'] = 'El nombre del módulo ya se encuentra registrado';
            }

            if ($alias == '') {
                $respuesta = FALSE;
                $msj['alias'] = 'Este campo es obligatorio';
            } elseif ($this->Modulos_model->existe_alias($alias)) {
                $respuesta = FALSE;
                $msj['alias'] = 'El alias del módulo ya se encuentra registrado';
            }

            if ($descripcion == '') {
                $respuesta = FALSE;
                $msj['descripcion'] = 'Este campo es obligatorio';
            }
            if ($respuesta) {
                if ($this->Modulos_model->insertar(array('modulo' => $modulo, 'alias' => $alias, 'descripcion' => $descripcion))) {
                    $mensaje_principal = '<div class="alert alert-success">El módulo se ha registrado con éxito.</div>';
                } else {
                    $respuesta = FALSE;
                }
            }
            echo json_encode(array('respuesta' => $respuesta, 'msj' => $msj, 'mensaje_principal' => $mensaje_principal));
        }
    }

    public function edit() {
        $this->load->model('Modulos_model');
        if (!$this->input->post()) {
            //$this->output->enable_profiler(TRUE);
            $data['titulo'] = 'Administrador de Módulos: Editar Módulo ';
            $data['data'] = $this->Modulos_model->obtener_modulo_por_id($this->uri->segment(3));
            $this->tpl->view_basic('modulos/edit', $data);
        } else {
            $respuesta = TRUE;
            $modulo_id = trim($this->input->post('modulo_id'));
            $modulo = trim($this->input->post('modulo'));
            $alias = strtolower(str_replace(' ', '', $this->input->post('alias')));
            $descripcion = trim($this->input->post('descripcion'));

            $mensaje_principal = '';
            $msj = array();
            if ($modulo == '') {
                $respuesta = FALSE;
                $msj['modulo'] = 'Este campo es obligatorio';
            } elseif ($this->Modulos_model->existe_modulo_al_editar($modulo, $modulo_id)) {
                $respuesta = FALSE;
                $msj['modulo'] = 'El nombre del módulo ya se encuentra registrado';
            }

            if ($alias == '') {
                $respuesta = FALSE;
                $msj['alias'] = 'Este campo es obligatorio';
            } elseif ($this->Modulos_model->existe_alias_al_editar($alias,$modulo_id)) {
                $respuesta = FALSE;
                $msj['alias'] = 'El alias del módulo ya se encuentra registrado';
            }

            if ($descripcion == '') {
                $respuesta = FALSE;
                $msj['descripcion'] = 'Este campo es obligatorio';
            }
            if ($respuesta) {
                if ($this->Modulos_model->editar(array('modulo_id' => $modulo_id,'modulo' => $modulo, 'alias' => $alias, 'descripcion' => $descripcion))) {
                    $mensaje_principal = '<div class="alert alert-success">El módulo se ha guardado con éxito.</div>';
                } else {
                    $respuesta = FALSE;
                }
            }
            echo json_encode(array('respuesta' => $respuesta, 'msj' => $msj, 'mensaje_principal' => $mensaje_principal));
        }
    }

    public function index() {
        $data['titulo'] = 'Administrador de Módulos';
        $this->tpl->view_basic('modulos/main', $data);
    }

    public function paginado() {
        $this->load->model('Modulos_model');
        echo json_encode($this->Modulos_model->paginado());
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */