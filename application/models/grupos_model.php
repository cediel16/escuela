<?php

class Grupos_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function existe_grupo($dato) {
        $qry = "select 1 from grupos where lower(grupo) = ?";
        $rst = $this->db->query($qry, array($dato));
        return !$rst->num_rows() == 0;
    }

    function existe_grupo_al_editar($dato, $grupo_id) {
        $qry = "select 1 from grupos where grupo = ? and id<>?";
        $rst = $this->db->query($qry, array($dato, $grupo_id));
        return !$rst->num_rows() == 0;
    }

    function esta_tabla_asignada($dato) {
        $qry = "select 1 from grupos where tabla = ?";
        $rst = $this->db->query($qry, array($dato));
        return !$rst->num_rows() == 0;
    }

    function esta_tabla_asignada_al_editar($dato, $grupo_id) {
        $qry = "select 1 from grupos where tabla = ? and id<>?";
        $rst = $this->db->query($qry, array($dato, $grupo_id));
        return !$rst->num_rows() == 0;
    }

    function esta_tabla_creada($dato) {
        $qry = "select 1 
                from information_schema.tables 
                where table_schema='public' 
                and table_name=?";
        $rst = $this->db->query($qry, array($dato));
        return !$rst->num_rows() == 0;
    }

    function existe_alias_al_editar($dato, $modulo_id) {
        $qry = "select 1 from modulos where alias = ? and id<>?";
        $rst = $this->db->query($qry, array($dato, $modulo_id));
        return !$rst->num_rows() == 0;
    }

    function insertar($data) {
        $this->db->trans_start();
        $qry = "insert into grupos(grupo,tabla) values(?,?)";
        $this->db->query($qry, array($data['grupo'], $data['tabla']));
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return FALSE;
        }
        $this->db->trans_commit();
        //$this->aud->set_operation('grupos', 'insertar', '{grupo:' . $data['grupo'] . ', tabla:' . $data['tabla']);
        return TRUE;
    }

    function editar($data) {
        $this->db->trans_start();
        $qry = "update grupos set grupo=?, tabla=? where id=?";
        $this->db->query($qry, array($data['grupo'], $data['tabla'], $data['grupo_id']));
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return FALSE;
        }
        $this->db->trans_commit();
        //$this->aud->set_operation('modulos', 'editar', '{id:' . $data['modulo_id'] . ',modulo:' . $data['modulo'] . ',alias:' . $data['alias'] . ',descripcion:' . $data['descripcion'] . '}');
        return TRUE;
    }

    function paginado() {
        $qry = "select * from grupos where status='activo' order by grupo";
        $rst = $this->db->query($qry);
        $f = Array();
        if ($rst->num_rows() > 0) {
            foreach ($rst->result() as $row) {
                $gear = '<div class = "btn-group">';
                $gear.= '<span class = "btn btn-xs icon icon-gears dropdown-toggle" data-toggle = "dropdown"></span>';
                $gear.= '<ul class = "dropdown-menu pull-right" role = "menu">';
                $gear.= '<li>' . anchor('grupos/edit/' . $row->id, 'Editar') . '</li>';
                $gear.= '<li class = "divider"></li>';
                $gear.= '<li><a href="#">Eliminar</a></li>';
                $gear.= '</ul>';
                $gear.= '</div>';
                $f[] = array(
                    $row->grupo,
                    $row->tabla,
                    $gear
                );
            }
        }
        return Array('aaData' => $f);
    }

    function obtener_grupo_por_id($id) {
        $qry = "select * from grupos where id=$id";
        $rst = $this->db->query($qry);
        if ($rst->num_rows() == 1) {
            return $rst->row_array();
        }
        return NULL;
    }

}

?>