<?php

class Estados_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function opt_estados() {
        $r = Array('' => '- Seleccione -');
        $qry = "select id, estado from estados order by estado";
        $rst = $this->db->query($qry);
        if ($rst->num_rows() > 0) {
            foreach ($rst->result() as $row) {
                $r[$row->id] = $row->estado;
            }
        }
        return $r;
    }

}

?>