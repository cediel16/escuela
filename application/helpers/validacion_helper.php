<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

if (!function_exists('is_cedula')) {

    function es_cedula($arg) {
        $patron = '/^(V|E)\d{8,8}$/';
        return preg_match($patron, $arg) == 1;
    }

    function es_email($arg) {
        $patron = '/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/';
        return preg_match($patron, $arg) == 1;
    }

}


/* End of file validation_helper.php */
/* Location: ./aplicarion/helpers/validation_helper.php */