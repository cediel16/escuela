<?php

class Municipios_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function opt_municipios($estado_fkey = 0) {
        if (!is_numeric($estado_fkey)) {
            $estado_fkey = 0;
        }
        $r = Array();
        $qry = "select id, municipio from municipios where estado_fkey=$estado_fkey order by municipio";
        $rst = $this->db->query($qry);
        if ($rst->num_rows() > 0) {
            foreach ($rst->result() as $row) {
                $r[$row->id] = $row->municipio;
            }
        }
        return $r;
    }

}

?>