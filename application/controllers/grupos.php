<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Grupos extends CI_Controller {

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
            $data['titulo'] = 'Agregar Nuevo Grupo';
            $this->tpl->view_basic('grupos/add', $data);
        } else {
            $respuesta = TRUE;
            $grupo = trim($this->input->post('grupo'));
            $tabla = strtolower(str_replace(' ', '', trim($this->input->post('tabla'))));
            $this->load->model('Grupos_model');
            $mensaje_principal = '';
            $msj = array();
            if ($grupo == '') {
                $respuesta = FALSE;
                $msj['grupo'] = 'Este campo es obligatorio';
            } elseif ($this->Grupos_model->existe_grupo(strtolower($grupo))) {
                $respuesta = FALSE;
                $msj['grupo'] = 'El nombre del grupo ya se encuentra registrado';
            }
            if ($tabla == '') {
                $respuesta = FALSE;
                $msj['tabla'] = 'Este campo es obligatorio';
            } elseif (!$this->Grupos_model->esta_tabla_creada(strtolower($tabla))) {
                $respuesta = FALSE;
                $msj['tabla'] = 'Esta tabla no existe';
            } elseif ($this->Grupos_model->esta_tabla_asignada(strtolower($tabla))) {
                $respuesta = FALSE;
                $msj['tabla'] = 'Esta tabla ya ha sido asignada a un grupo';
            }

            if ($respuesta) {
                if ($this->Grupos_model->insertar(array('grupo' => $grupo, 'tabla' => $tabla))) {
                    $mensaje_principal = '<div class="alert alert-success">El grupo se ha registrado con éxito.</div>';
                } else {
                    $respuesta = FALSE;
                }
            }
            echo json_encode(array('respuesta' => $respuesta, 'msj' => $msj, 'mensaje_principal' => $mensaje_principal));
        }
    }

    public function edit() {
        $this->load->model('Grupos_model');
        if (!$this->input->post()) {
            $data['titulo'] = 'Editar Grupo';
            $data['data'] = $this->Grupos_model->obtener_grupo_por_id($this->uri->segment(3));
            $this->tpl->view_basic('grupos/edit', $data);
        } else {
            $respuesta = TRUE;
            $grupo_id = $this->input->post('grupo_id');
            $grupo = $this->input->post('grupo');
            $tabla = $this->input->post('tabla');

            $mensaje_principal = '';
            $msj = array();
            if ($grupo == '') {
                $respuesta = FALSE;
                $msj['grupo'] = 'Este campo es obligatorio';
            } elseif ($this->Grupos_model->existe_grupo_al_editar($grupo, $grupo_id)) {
                $respuesta = FALSE;
                $msj['tabla'] = 'Este grupo ya se encuentra registrado';
            }

            if ($tabla == '') {
                $respuesta = FALSE;
                $msj['tabla'] = 'Este campo es obligatorio';
            } elseif (!$this->Grupos_model->esta_tabla_creada($tabla, $grupo_id)) {
                $respuesta = FALSE;
                $msj['tabla'] = 'Esta tabla no existe';
            } elseif ($this->Grupos_model->esta_tabla_asignada_al_editar($tabla, $grupo_id)) {
                $respuesta = FALSE;
                $msj['tabla'] = 'Esta tabla ya ha sido asignada a un grupo';
            }

            if ($respuesta) {
                if ($this->Grupos_model->editar(array('grupo_id' => $grupo_id, 'grupo' => $grupo, 'tabla' => $tabla))) {
                    $mensaje_principal = '<div class="alert alert-success">El grupo se ha guardado con éxito.</div>';
                } else {
                    $respuesta = FALSE;
                }
            }
            echo json_encode(array('respuesta' => $respuesta, 'msj' => $msj, 'mensaje_principal' => $mensaje_principal));
        }
    }

    public function index() {
        $data['titulo'] = 'Administrador de Grupos';
        $this->tpl->view_basic('grupos/main', $data);
    }

    public function paginado() {
        $this->load->model('Grupos_model');
        echo json_encode($this->Grupos_model->paginado());
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */