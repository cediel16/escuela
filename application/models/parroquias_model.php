<?php

class Parroquias_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function opt_parroquias($municipio_fkey = 0) {
        $r = Array();
        $qry = "select id, parroquia from parroquias where municipio_fkey=$municipio_fkey order by parroquia";
        $rst = $this->db->query($qry);
        if ($rst->num_rows() > 0) {
            foreach ($rst->result() as $row) {
                $r[$row->id] = $row->parroquia;
            }
        }
        return $r;
    }

}

?>