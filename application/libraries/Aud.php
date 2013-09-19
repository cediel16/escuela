<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Aud {

    function __construct() {
        $this->CI = & get_instance();
        $this->CI->load->library('session');
        $this->CI->load->database();
    }

    function set_operation($mod, $acc, $op) {
        if ($this->CI->auth->is_logged_in()) {
            $qry = "select fn_insertar_operacion(?,?,?,?)";
            $this->CI->db->query($qry, array($this->CI->session->userdata('usuario_id'), $mod, $acc, $op));
        }
    }

}

/* End of file Aud.php */
/* Location: ./application/libraries/Aud.php */