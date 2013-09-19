<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Paginado {

    private $modulo;
    private $pagina;
    private $paginador;

    function __construct() {
        $this->CI = & get_instance();
    }

    function set($modulo,$pagina,$por_pagina) {
        $this->modulo = $modulo;

        $this->CI->load->model('modulos_model');
        $d = $this->CI->Modulos_model->data_paginado($pagina,$por_pagina);
        //if(count($d)>0){
        $pagina = '<table class="table table-condensed table-hover">';
        $pagina.='<thead>';
        $pagina.='<tr>';
        $pagina.='<th class="col-md-3">Módulo</th>';
        $pagina.='<th class="col-md-3">Alias</th>';
        $pagina.='<th class="col-md-6">Descripción</th>';
        $pagina.='</tr>';
        $pagina.='</thead>';
        $pagina.='<tbody>';
        foreach ($d as $k => $v) {
            $pagina.='<tr>';
            $pagina.='<td>'.$v['modulo'].'</td>';
            $pagina.='<td>'.$v['alias'].'</td>';
            $pagina.='<td>'.$v['descripcion'].'</td>';
            $pagina.='</tr>';
        }
        $pagina.='</tbody>';
        $pagina.='</table>';
        //}
        $this->pagina = $pagina;
    }

    function pagina() {
        return $this->pagina;
    }

    function paginador() {
        $this->paginador = 'Aqui va el paginador';
        return $this->paginador;
    }

}

// END Tpl class

/* End of file Paginado.php */
/* Location: ./application/libraries/Paginado.php */