<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Planteles extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function add() {
        if (!$this->input->post()) {
            $this->load->model('Estados_model');
            $this->load->model('Municipios_model');
            $this->load->model('Parroquias_model');

            $data['titulo'] = 'Agregar Nuevo Plantel';
            $data['opt_estados'] = $this->Estados_model->opt_estados();
            $data['opt_municipios'] = $this->Municipios_model->opt_municipios();
            $data['opt_parroquias'] = $this->Parroquias_model->opt_parroquias();
            $this->tpl->view_basic('planteles/add', $data);
        } else {
            $respuesta = TRUE;
            $dea = trim(strtoupper($this->input->post('dea')));
            $rif = trim(strtoupper($this->input->post('rif')));
            $nombre_plantel = trim(strtoupper($this->input->post('nombre_plantel')));
            $direccion = trim(strtoupper($this->input->post('direccion')));
            $estado = trim($this->input->post('estado'));
            $municipio = trim($this->input->post('municipio'));
            $parroquia = trim($this->input->post('parroquia'));
            $telefono_plantel = trim($this->input->post('telefono_plantel'));
            $email_plantel = trim($this->input->post('email_plantel'));

            $cedula_director = trim(strtoupper($this->input->post('cedula_director')));
            $titulo_director = trim(strtoupper($this->input->post('titulo_director')));
            $nombre_director = trim(strtoupper($this->input->post('nombre_director')));
            $telefono_director = trim(strtoupper($this->input->post('telefono_director')));
            $email_director = trim(strtoupper($this->input->post('email_director')));

            $this->load->model('Planteles_model');
            $mensaje_principal = '';
            $msj = array();

            if ($dea == '') {
                $respuesta = FALSE;
                $msj['dea'] = 'Este campo es obligatorio';
            } elseif (!es_dea($dea)) {
                $respuesta = FALSE;
                $msj['dea'] = 'El código DEA es inválido';
            }

            if ($rif == '') {
                $respuesta = FALSE;
                $msj['rif'] = 'Este campo es obligatorio';
            } elseif (!es_rif($rif)) {
                $respuesta = FALSE;
                $msj['rif'] = 'RIF es inválido';
            }

            if ($nombre_plantel == '') {
                $respuesta = FALSE;
                $msj['nombre_plantel'] = 'Este campo es obligatorio';
            } elseif (!es_nombre_plantel($rif)) {
                $respuesta = FALSE;
                $msj['nombre_plantel'] = 'Nombre del plantel inválido. Asegurese de no usar caracteres especiales';
            }

            if ($direccion == '') {
                $respuesta = FALSE;
                $msj['direccion'] = 'Este campo es obligatorio';
            } elseif (!es_direccion($rif)) {
                $respuesta = FALSE;
                $msj['direccion'] = 'Dirección del plantel inválida. Asegurese de no usar caracteres especiales';
            }

            if (!is_numeric($estado) || $estado == 0) {
                $respuesta = FALSE;
                $msj['estado'] = 'Este campo es obligatorio';
            }

            if (!is_numeric($municipio) || $municipio == 0) {
                $respuesta = FALSE;
                $msj['municipio'] = 'Este campo es obligatorio';
            }

            if (!is_numeric($parroquia) || $parroquia == 0) {
                $respuesta = FALSE;
                $msj['parroquia'] = 'Este campo es obligatorio';
            }

            if ($telefono_plantel == '') {
                $respuesta = FALSE;
                $msj['telefono_plantel'] = 'Este campo es obligatorio';
            } elseif (!es_telefono($telefono_plantel)) {
                $respuesta = FALSE;
                $msj['telefono_plantel'] = 'Teléfono inválido';
            }

            if ($email_plantel == '') {
                $respuesta = FALSE;
                $msj['email_plantel'] = 'Este campo es obligatorio';
            } elseif (!es_email($email_plantel)) {
                $respuesta = FALSE;
                $msj['email_plantel'] = 'Correo electrónico inválido';
            }

            if ($cedula_director == '') {
                $respuesta = FALSE;
                $msj['cedula_director'] = 'Este campo es obligatorio';
            } elseif (!es_cedula($cedula_director)) {
                $respuesta = FALSE;
                $msj['cedula_director'] = 'Cédula inválida';
            }

            if ($titulo_director == '') {
                $respuesta = FALSE;
                $msj['titulo_director'] = 'Este campo es obligatorio';
            } elseif (!es_nombre($titulo_director)) {
                $respuesta = FALSE;
                $msj['titulo_director'] = 'Título inválido';
            }

            if ($nombre_director == '') {
                $respuesta = FALSE;
                $msj['nombre_director'] = 'Este campo es obligatorio';
            } elseif (!es_nombre($nombre_director)) {
                $respuesta = FALSE;
                $msj['nombre_director'] = 'Nombre inválido';
            }

            if ($telefono_director == '') {
                $respuesta = FALSE;
                $msj['telefono_director'] = 'Este campo es obligatorio';
            } elseif (!es_telefono($telefono_director)) {
                $respuesta = FALSE;
                $msj['telefono_director'] = 'Teléfono inválido';
            }

            if ($email_director == '') {
                $respuesta = FALSE;
                $msj['email_director'] = 'Este campo es obligatorio';
            } elseif (!es_email($email_director)) {
                $respuesta = FALSE;
                $msj['email_director'] = 'Correo electrónico inválido';
            }

            if ($respuesta) {
                $dea = trim(strtoupper($this->input->post('dea')));
                $rif = trim(strtoupper($this->input->post('rif')));
                $nombre_plantel = trim(strtoupper($this->input->post('nombre_plantel')));
                $direccion = trim(strtoupper($this->input->post('direccion')));
                $estado = trim($this->input->post('estado'));
                $municipio = trim($this->input->post('municipio'));
                $parroquia = trim($this->input->post('parroquia'));
                $telefono_plantel = trim($this->input->post('telefono_plantel'));
                $email_plantel = trim($this->input->post('email_plantel'));

                $cedula_director = trim(strtoupper($this->input->post('cedula_director')));
                $titulo_director = trim(strtoupper($this->input->post('titulo_director')));
                $nombre_director = trim(strtoupper($this->input->post('nombre_director')));
                $telefono_director = trim(strtoupper($this->input->post('telefono_director')));
                $email_director = trim(strtoupper($this->input->post('email_director')));
                $d = array(
                    'dea' => $dea,
                    'rif' => $rif,
                    'nombre_plantel' => $nombre_plantel,
                    'direccion' => $direccion,
                    'estado' => $estado,
                    'municipio' => $municipio,
                    'parroquia' => $parroquia,
                    'telefono_plantel' => $telefono_plantel,
                    'email_plantel' => $email_plantel,
                    'cedula_director' => $cedula_director,
                    'titulo_director' => $titulo_director,
                    'nombre_director' => $nombre_director,
                    'telefono_director' => $telefono_director,
                    'email_director' => $email_director
                );
                if ($this->Planteles_model->insertar($d)) {
                    $mensaje_principal = '<div class="alert alert-success">El nuevo plantel se ha registrado con éxito.</div>';
                } else {
                    $respuesta = FALSE;
                }
            }
            echo json_encode(array('respuesta' => $respuesta, 'msj' => $msj, 'mensaje_principal' => $mensaje_principal));
        }
    }

    public function ajax() {
        switch ($this->input->post('switch')) {
            case 'opt_municipios':
                $this->load->model('Municipios_model');
                echo json_encode($this->Municipios_model->opt_municipios($this->input->post('estado')));
                break;
            case 'opt_parroquias':
                $this->load->model('Parroquias_model');
                echo json_encode($this->Parroquias_model->opt_parroquias($this->input->post('municipio')));
                break;
            default:
                break;
        }
    }

    public function edit() {
        $this->load->model('Planteles_model');
        if (!$this->input->post()) {
            $d = $this->Planteles_model->obtener_plantel_por_id($this->uri->segment(3));
            if (!is_array($d)) {
                redirect('errors/error_404');
            }
            $this->load->model('Estados_model');
            $this->load->model('Municipios_model');
            $this->load->model('Parroquias_model');
            $data['titulo'] = 'Editar Plantel';
            $data['opt_estados'] = $this->Estados_model->opt_estados();
            $data['opt_municipios'] = $this->Municipios_model->opt_municipios($d['estado_fkey']);
            $data['opt_parroquias'] = $this->Parroquias_model->opt_parroquias($d['municipio_fkey']);
            $data['data'] = $d;
            $this->tpl->view_basic('planteles/edit', $data);
        } else {
            $respuesta = TRUE;
            $plantel_id = trim($this->input->post('plantel_id'));
            $dea = trim(strtoupper($this->input->post('dea')));
            $rif = trim(strtoupper($this->input->post('rif')));
            $nombre_plantel = trim(strtoupper($this->input->post('nombre_plantel')));
            $direccion = trim(strtoupper($this->input->post('direccion')));
            $estado = trim($this->input->post('estado'));
            $municipio = trim($this->input->post('municipio'));
            $parroquia = trim($this->input->post('parroquia'));
            $telefono_plantel = trim($this->input->post('telefono_plantel'));
            $email_plantel = trim(strtolower($this->input->post('email_plantel')));

            $cedula_director = trim(strtoupper($this->input->post('cedula_director')));
            $titulo_director = trim(strtoupper($this->input->post('titulo_director')));
            $nombre_director = trim(strtoupper($this->input->post('nombre_director')));
            $telefono_director = trim(strtoupper($this->input->post('telefono_director')));
            $email_director = trim(strtolower($this->input->post('email_director')));

            $this->load->model('Planteles_model');
            $mensaje_principal = '';
            $msj = array();

            if ($dea == '') {
                $respuesta = FALSE;
                $msj['dea'] = 'Este campo es obligatorio';
            } elseif (!es_dea($dea)) {
                $respuesta = FALSE;
                $msj['dea'] = 'El código DEA es inválido';
            }

            if ($rif == '') {
                $respuesta = FALSE;
                $msj['rif'] = 'Este campo es obligatorio';
            } elseif (!es_rif($rif)) {
                $respuesta = FALSE;
                $msj['rif'] = 'RIF es inválido';
            }

            if ($nombre_plantel == '') {
                $respuesta = FALSE;
                $msj['nombre_plantel'] = 'Este campo es obligatorio';
            } elseif (!es_nombre_plantel($rif)) {
                $respuesta = FALSE;
                $msj['nombre_plantel'] = 'Nombre del plantel inválido. Asegurese de no usar caracteres especiales';
            }

            if ($direccion == '') {
                $respuesta = FALSE;
                $msj['direccion'] = 'Este campo es obligatorio';
            } elseif (!es_direccion($rif)) {
                $respuesta = FALSE;
                $msj['direccion'] = 'Dirección del plantel inválida. Asegurese de no usar caracteres especiales';
            }

            if (!is_numeric($estado) || $estado == 0) {
                $respuesta = FALSE;
                $msj['estado'] = 'Este campo es obligatorio';
            }

            if (!is_numeric($municipio) || $municipio == 0) {
                $respuesta = FALSE;
                $msj['municipio'] = 'Este campo es obligatorio';
            }

            if (!is_numeric($parroquia) || $parroquia == 0) {
                $respuesta = FALSE;
                $msj['parroquia'] = 'Este campo es obligatorio';
            }

            if ($telefono_plantel == '') {
                $respuesta = FALSE;
                $msj['telefono_plantel'] = 'Este campo es obligatorio';
            } elseif (!es_telefono($telefono_plantel)) {
                $respuesta = FALSE;
                $msj['telefono_plantel'] = 'Teléfono inválido';
            }

            if ($email_plantel == '') {
                $respuesta = FALSE;
                $msj['email_plantel'] = 'Este campo es obligatorio';
            } elseif (!es_email($email_plantel)) {
                $respuesta = FALSE;
                $msj['email_plantel'] = 'Correo electrónico inválido';
            }

            if ($cedula_director == '') {
                $respuesta = FALSE;
                $msj['cedula_director'] = 'Este campo es obligatorio';
            } elseif (!es_cedula($cedula_director)) {
                $respuesta = FALSE;
                $msj['cedula_director'] = 'Cédula inválida';
            }

            if ($titulo_director == '') {
                $respuesta = FALSE;
                $msj['titulo_director'] = 'Este campo es obligatorio';
            } elseif (!es_nombre($titulo_director)) {
                $respuesta = FALSE;
                $msj['titulo_director'] = 'Título inválido';
            }

            if ($nombre_director == '') {
                $respuesta = FALSE;
                $msj['nombre_director'] = 'Este campo es obligatorio';
            } elseif (!es_nombre($nombre_director)) {
                $respuesta = FALSE;
                $msj['nombre_director'] = 'Nombre inválido';
            }

            if ($telefono_director == '') {
                $respuesta = FALSE;
                $msj['telefono_director'] = 'Este campo es obligatorio';
            } elseif (!es_telefono($telefono_director)) {
                $respuesta = FALSE;
                $msj['telefono_director'] = 'Teléfono inválido';
            }

            if ($email_director == '') {
                $respuesta = FALSE;
                $msj['email_director'] = 'Este campo es obligatorio';
            } elseif (!es_email($email_director)) {
                $respuesta = FALSE;
                $msj['email_director'] = 'Correo electrónico inválido';
            }

            if ($respuesta) {
                $dea = trim(strtoupper($this->input->post('dea')));
                $rif = trim(strtoupper($this->input->post('rif')));
                $nombre_plantel = trim(strtoupper($this->input->post('nombre_plantel')));
                $direccion = trim(strtoupper($this->input->post('direccion')));
                $estado = trim($this->input->post('estado'));
                $municipio = trim($this->input->post('municipio'));
                $parroquia = trim($this->input->post('parroquia'));
                $telefono_plantel = trim($this->input->post('telefono_plantel'));
                $email_plantel = trim($this->input->post('email_plantel'));

                $cedula_director = trim(strtoupper($this->input->post('cedula_director')));
                $titulo_director = trim(strtoupper($this->input->post('titulo_director')));
                $nombre_director = trim(strtoupper($this->input->post('nombre_director')));
                $telefono_director = trim(strtoupper($this->input->post('telefono_director')));
                $email_director = trim(strtoupper($this->input->post('email_director')));
                $d = array(
                    'plantel_id' => $plantel_id,
                    'dea' => $dea,
                    'rif' => $rif,
                    'nombre_plantel' => $nombre_plantel,
                    'direccion' => $direccion,
                    'estado' => $estado,
                    'municipio' => $municipio,
                    'parroquia' => $parroquia,
                    'telefono_plantel' => $telefono_plantel,
                    'email_plantel' => $email_plantel,
                    'cedula_director' => $cedula_director,
                    'titulo_director' => $titulo_director,
                    'nombre_director' => $nombre_director,
                    'telefono_director' => $telefono_director,
                    'email_director' => $email_director
                );
                if ($this->Planteles_model->editar($d)) {
                    $mensaje_principal = '<div class="alert alert-success">Los datos del plantel se han guardado con éxito.</div>';
                } else {
                    $respuesta = FALSE;
                }
            }
            echo json_encode(array('respuesta' => $respuesta, 'msj' => $msj, 'mensaje_principal' => $mensaje_principal));
        }
    }

    public function index() {
        $data['titulo'] = 'Administrador de Planteles';
        $this->tpl->view_basic('planteles/main', $data);
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
        $this->load->model('Planteles_model');
        echo json_encode($this->Planteles_model->paginado());
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */