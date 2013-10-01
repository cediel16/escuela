<?php

class Planteles_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function existe_dea($dato) {
        $qry = "select 1 from planteles where dea = ?";
        $rst = $this->db->query($qry, array($dato));
        return !$rst->num_rows() == 0;
    }

    function existe_usuario_al_editar($dato, $usuario_id) {
        $qry = "select 1 from usuarios where usuario = ? and id<>?";
        $rst = $this->db->query($qry, array($dato, $usuario_id));
        return !$rst->num_rows() == 0;
    }

    function existe_email($dato) {
        $qry = "select 1 from usuarios where email = ?";
        $rst = $this->db->query($qry, array($dato));
        return !$rst->num_rows() == 0;
    }

    function existe_email_al_editar($dato, $usuario_id) {
        $qry = "select 1 from usuarios where email = ? and id<>?";
        $rst = $this->db->query($qry, array($dato, $usuario_id));
        return !$rst->num_rows() == 0;
    }

    function existe_alias_al_editar($dato, $modulo_id) {
        $qry = "select 1 from modulos where alias = ? and id<>?";
        $rst = $this->db->query($qry, array($dato, $modulo_id));
        return !$rst->num_rows() == 0;
    }

    function insertar($data) {
        $this->db->trans_start();
        $qry = "insert into planteles(
                dea,
                rif,
                nombre,
                direccion,
                parroquia_fkey,
                telefono_plantel,
                email_plantel,
                cedula_director,
                titulo_director,
                nombre_director,
                telefono_director,
                email_director
                ) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        $this->db->query($qry, array(
            $data['dea'],
            $data['rif'],
            $data['nombre_plantel'],
            $data['direccion'],
            $data['parroquia'],
            $data['telefono_plantel'],
            $data['email_plantel'],
            $data['cedula_director'],
            $data['titulo_director'],
            $data['nombre_director'],
            $data['telefono_director'],
            $data['email_director']
        ));
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return FALSE;
        }
        $this->db->trans_commit();
        $this->aud->set_operation('planteles', 'insertar', json_encode($data));
        return TRUE;
    }

    function editar($data) {
        $this->db->trans_start();
        $qry = "update usuarios set usuario=?, email=?, status=?, rol_fkey=? where id=?";
        $this->db->query($qry, array($data['usuario'],
            $data['email'],
            $data['status'],
            $data['rol_fkey'],
            $data['usuario_id']
        ));
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return FALSE;
        }
        $this->db->trans_commit();
        $this->aud->set_operation('usuarios', 'editar', '{id:' . $data['usuario_id'] . ',usuario:' . $data['usuario'] . ',email:' . $data['email'] . ',status:' . $data['status'] . ', rol_fkey:' . $data['rol_fkey'] . '}');
        return TRUE;
    }

    function paginado() {
        $qry = "select * from planteles order by dea";
        $rst = $this->db->query($qry);
        $f = Array();
        if ($rst->num_rows() > 0) {
            foreach ($rst->result() as $row) {
                $gear = '<div class = "btn-group">';
                $gear.= '<span class = "btn btn-xs icon icon-gears dropdown-toggle" data-toggle = "dropdown"></span>';
                $gear.= '<ul class = "dropdown-menu pull-right" role = "menu">';
                $gear.= '<li>' . anchor('planteles/edit/' . $row->id, 'Editar') . '</li>';
                $gear.= '<li class = "divider"></li>';
                $gear.= '</ul>';
                $gear.= '</div>';
                $f[] = array(
                    $row->dea,
                    $row->rif,
                    $row->nombre,
                    $gear
                );
            }
        }
        return Array('aaData' => $f);
    }

    function opt_roles() {
        $r = Array('' => '- Seleccione -');
        $qry = "select id,rol from roles where status='activo' order by rol";
        $rst = $this->db->query($qry);
        if ($rst->num_rows() > 0) {
            foreach ($rst->result() as $row) {
                $r[$row->id] = $row->rol;
            }
        }
        return $r;
    }

    function obtener_plantel_por_id($id) {
        $qry = "select a.*,
            a.parroquia_fkey,
            b.municipio_fkey,
            c.estado_fkey
            from planteles a 
            inner join parroquias b on b.id=a.parroquia_fkey
            inner join municipios c on c.id=b.municipio_fkey
            inner join estados d on d.id=c.estado_fkey
            and a.id=$id";
        $rst = $this->db->query($qry);
        if ($rst->num_rows() == 1) {
            return $rst->row_array();
        }
        return NULL;
    }

}

?>