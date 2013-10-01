<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

if (!function_exists('is_cedula')) {

    function es_cedula($arg) {
        $patron = '/^(V|E)\d{8,8}$/';
        return preg_match($patron, $arg) == 1;
    }

    function es_nombre_plantel($arg) {
        return TRUE;
        $patron = '/^[a-zA-ZÀ-ÖØ-öø-ÿ]+\.?(( |\-)[a-zA-ZÀ-ÖØ-öø-ÿ]+\.?)*$/';
        return preg_match($patron, $arg) == 1;
    }

    function es_nombre($arg) {
        return TRUE;
        $patron = '/^[a-zA-ZÀ-ÖØ-öø-ÿ]+\.?(( |\-)[a-zA-ZÀ-ÖØ-öø-ÿ]+\.?)*$/';
        return preg_match($patron, $arg) == 1;
    }

    function es_direccion($arg) {
        return 1;
        $patron = '/^[a-zA-ZÀ-ÖØ-öø-ÿ]+\.?(( |\-)[a-zA-ZÀ-ÖØ-öø-ÿ]+\.?)*$/';
        return preg_match($patron, $arg) == 1;
    }

    function es_email($arg) {
        $patron = '/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/';
        return preg_match($patron, $arg) == 1;
    }

    function es_dea($arg) {
        $patron = '/^([A-Z])\d{9,9}$/';
        return preg_match($patron, $arg) == 1;
    }

    function es_rif($arg) {
        $patron = '/^(J|E)\d{9,9}$/';
        return preg_match($patron, $arg) == 1;
    }

    function es_telefono($arg) {
        $patron = '/^0(4{1}(1{1}(2{1}|4{1}|6{1})|2{1}(4{1}|6{1}))|2{1}\d{2})-(\d{7})$/';
        return preg_match($patron, $arg) == 1;
    }

}


/* End of file validation_helper.php */
/* Location: ./aplicarion/helpers/validation_helper.php */