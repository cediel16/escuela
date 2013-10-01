<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Errors extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('html');
    }

    function error_404() {
        $this->load->view('errors/404');
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/errors.php */
?>