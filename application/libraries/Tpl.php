<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tpl {

    private $tpl = array(
        "head" => "tpl/head",
        "navbar" => "tpl/navbar",
        "header" => "tpl/header",
        "footer" => "tpl/footer"
    );

////////////////////////////////////////////////////
//Consulta todas las plantillas a mostrar y adapta la solicitada
////////////////////////////////////////////////////
    function __construct() {
        $this->CI = & get_instance();
    }

    function view_basic($con, $data) {
        $this->CI->load->view($this->tpl['head'], $data);
        $this->CI->load->view($this->tpl['navbar'], $data);
        $this->CI->load->view($this->tpl['header'], $data);
        $this->CI->load->view($con, $data);
        $this->CI->load->view($this->tpl["footer"]);
    }

    function view_login($con, $data) {
        $this->CI->load->view($this->tpl['head'], $data);
        $this->CI->load->view($con, $data);
    }

    /*
      function view_login($con, $data) {
      $this->CI->load->view(self::$tpl['header'], $data);
      $this->CI->load->view($con, $data);
      }
     */
}

// END Tpl class

/* End of file Tpl.php */
/* Location: ./application/libraries/Tpl.php */