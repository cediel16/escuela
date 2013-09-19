<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Users extends CI_Controller {

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
        if (!$this->input->post()) {
            $this->load->model('Users_model');
            $data['titulo'] = 'Agregar Nuevo Usuario';
            $data['opt_grupos'] = $this->Users_model->opt_grupos();
            $data['opt_roles'] = $this->Users_model->opt_roles();
            $this->tpl->view_basic('users/add', $data);
        } else {
            $respuesta = TRUE;
            $usuario = trim($this->input->post('usuario'));
            $email = strtolower(trim($this->input->post('email')));
            $clave = $this->input->post('clave');
            $conf_clave = $this->input->post('conf_clave');
            $grupo = $this->input->post('grupo');
            $rol = $this->input->post('rol');
            $this->load->model('Users_model');
            $mensaje_principal = '';
            $msj = array();
            if ($usuario == '') {
                $respuesta = FALSE;
                $msj['usuario'] = 'Este campo es obligatorio';
            } elseif ($this->Users_model->existe_usuario($usuario)) {
                $respuesta = FALSE;
                $msj['usuario'] = 'El nombre del usuario ya se encuentra registrado';
            }

            if ($email == '') {
                $respuesta = FALSE;
                $msj['email'] = 'Este campo es obligatorio';
            } elseif (!es_email($email)) {
                $respuesta = FALSE;
                $msj['email'] = 'Correo electrónico inválido';
            } elseif ($this->Users_model->existe_email($email)) {
                $respuesta = FALSE;
                $msj['email'] = 'El correo electrónico ya se encuentra en uso';
            }

            if ($clave == '' || $conf_clave == '') {
                $respuesta = FALSE;
                $msj['clave'] = 'Ingrese contraseña y su confirmación';
            } elseif ($clave != $conf_clave) {
                $respuesta = FALSE;
                $msj['clave'] = 'La contraseña y su confirmación no coiciden';
            } elseif ($clave == $conf_clave && strlen($clave) <= 5) {
                $respuesta = FALSE;
                $msj['clave'] = 'La contraseña debe tener mas de 5 caracteres';
            }

            if (!is_numeric($grupo)) {
                $respuesta = FALSE;
                $msj['grupo'] = 'Este campo es obligatorio';
            }

            if (!is_numeric($rol)) {
                $respuesta = FALSE;
                $msj['rol'] = 'Este campo es obligatorio';
            }

            if ($respuesta) {
                if ($this->Users_model->insertar(array(
                            'usuario' => $usuario,
                            'email' => $email,
                            'clave' => md5($clave),
                            'grupo_fkey' => $grupo,
                            'rol_fkey' => $rol
                        ))
                ) {
                    $mensaje_principal = '<div class="alert alert-success">El usuario se ha registrado con éxito.</div>';
                } else {
                    $respuesta = FALSE;
                }
            }
            echo json_encode(array('respuesta' => $respuesta, 'msj' => $msj, 'mensaje_principal' => $mensaje_principal));
        }
    }

    public function edit() {
        $this->load->model('Users_model');
        if (!$this->input->post()) {
            $data['titulo'] = 'Editar Usuario';
            $data['opt_grupos'] = $this->Users_model->opt_grupos();
            $data['opt_roles'] = $this->Users_model->opt_roles();
            $data['data'] = $this->Users_model->obtener_usuario_por_id($this->uri->segment(3));
            $this->tpl->view_basic('users/edit', $data);
        } else {
            $respuesta = TRUE;
            $usuario_id = trim($this->input->post('usuario_id'));
            $usuario = trim($this->input->post('usuario'));
            $email = strtolower(trim($this->input->post('email')));
            $clave = $this->input->post('clave');
            $conf_clave = $this->input->post('conf_clave');
//            $grupo = $this->input->post('grupo');
            $rol = $this->input->post('rol');
            $status = $this->input->post('status');
            $this->load->model('Users_model');
            $mensaje_principal = '';
            $msj = array();
            if ($usuario == '') {
                $respuesta = FALSE;
                $msj['usuario'] = 'Este campo es obligatorio';
            } elseif ($this->Users_model->existe_usuario_al_editar($usuario, $usuario_id)) {
                $respuesta = FALSE;
                $msj['usuario'] = 'El nombre del usuario ya se encuentra registrado';
            }

            if ($email == '') {
                $respuesta = FALSE;
                $msj['email'] = 'Este campo es obligatorio';
            } elseif (!es_email($email)) {
                $respuesta = FALSE;
                $msj['email'] = 'Correo electrónico inválido';
            } elseif ($this->Users_model->existe_email_al_editar($email, $usuario_id)) {
                $respuesta = FALSE;
                $msj['email'] = 'El correo electrónico ya se encuentra en uso';
            }

            if ($clave != $conf_clave) {
                $respuesta = FALSE;
                $msj['clave'] = 'La contraseña y su confirmación no coiciden';
            } elseif ($clave == $conf_clave && strlen($clave) <= 5 && $clave != '' && $conf_clave != '') {
                $respuesta = FALSE;
                $msj['clave'] = 'La contraseña debe tener mas de 5 caracteres';
            }


//            if (!is_numeric($grupo)) {
//                $respuesta = FALSE;
//                $msj['grupo'] = 'Este campo es obligatorio';
//            }

            if (!is_numeric($rol)) {
                $respuesta = FALSE;
                $msj['rol'] = 'Este campo es obligatorio';
            }

            if ($respuesta) {
                if ($this->Users_model->editar(array(
                            'usuario_id' => $usuario_id,
                            'usuario' => $usuario,
                            'email' => $email,
                            'clave' => md5($clave),
//                            'grupo_fkey' => $grupo,
                            'rol_fkey' => $rol,
                            'status' => $status
                        ))
                ) {
                    $mensaje_principal = '<div class="alert alert-success">El usuario se ha guardado con éxito.</div>';
                } else {
                    $respuesta = FALSE;
                }
            }
            echo json_encode(array('respuesta' => $respuesta, 'msj' => $msj, 'mensaje_principal' => $mensaje_principal));
        }
    }

    public function index() {
        $data['titulo'] = 'Administrador de Usuarios';
        $this->tpl->view_basic('users/main', $data);
    }

    public function login() {
        if ($this->auth->is_logged_in()) {
            redirect('.');
        } else {
            $this->form_validation->set_rules('usr', 'Usuario', 'required');
            $this->form_validation->set_rules('clv', 'Contraseña', 'required');
            $data['msj_login'] = '';
            if ($this->form_validation->run()) {
                if ($this->auth->login($this->input->post('usr'), $this->input->post('clv'))) {
                    switch ($this->session->userdata('status')) {
                        case 'inactivo': {
                                $data['msj_login'] = 'Debe activar la cuenta';
                                break;
                            }
                        case 'activo': {
                                $this->aud->set_operation('usuarios', 'login', 'Inicio de sesión');
                                redirect('main');
                                break;
                            }
                    }
                } else {
                    $data['msj_login'] = '<div class="alert alert-danger">Correo electrónico y/o contraseña inválido</div>';
                }
            }
            $data['titulo'] = 'Inicio de sesión';
            $this->tpl->view_login('users/login', $data);
        }
    }

    public function logout() {
        $this->aud->set_operation('usuarios', 'logout', 'Cierre de sesión');
        $this->session->sess_destroy();
        redirect('.');
    }

    public function profile() {
        $this->load->model('Users_model');
        $data['titulo'] = 'Perfil';
        $this->tpl->view_basic('users/profile', $data);
    }

    public function paginado() {
        $this->load->model('Users_model');
        echo json_encode($this->Users_model->paginado());
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */