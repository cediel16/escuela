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
        $this->db->query($qry, array($data['usuario'],
            $data['dea'],
            $data['rif'],
            $data['nombre'],
            $data['direccion'],
            $data['parroquia_fkey'],
            $data['telefono_plantel'],
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
        $this->aud->set_operation('usuarios', 'insertar', '{usuario:' . $data['usuario'] . ', email:' . $data['email'] . ', grupo_fkey:' . $data['grupo_fkey'] . ', rol_fkey:' . $data['rol_fkey'] . '}');
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
        $qry = "select a.id,
            a.usuario, 
            a.email, 
            a.status,
            b.rol,
            c.grupo
            from usuarios a 
            inner join roles b on b.id=a.rol_fkey
            inner join grupos c on c.id=a.grupo_fkey
            order by a.usuario";
        $rst = $this->db->query($qry);
        $f = Array();
        if ($rst->num_rows() > 0) {
            foreach ($rst->result() as $row) {
                $gear = '<div class = "btn-group">';
                $gear.= '<span class = "btn btn-xs icon icon-gears dropdown-toggle" data-toggle = "dropdown"></span>';
                $gear.= '<ul class = "dropdown-menu pull-right" role = "menu">';
                $gear.= '<li>' . anchor('users/edit/' . $row->id, 'Editar') . '</li>';
                $gear.= '<li class = "divider"></li>';
                $gear.= '<li>' . anchor('users/del/' . $row->id, 'Activar') . '</li>';
                $gear.= '<li>' . anchor('users/del/' . $row->id, 'Bloquear') . '</li>';
                $gear.= '</ul>';
                $gear.= '</div>';
                $f[] = array(
                    $row->usuario,
                    $row->email,
                    ucfirst($row->status),
                    $row->grupo,
                    $row->rol,
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

    function obtener_usuario_por_id($id) {
        $qry = "select * from usuarios where id=$id";
        $rst = $this->db->query($qry);
        if ($rst->num_rows() == 1) {
            return $rst->row_array();
        }
        return NULL;
    }

}

?>