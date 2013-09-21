    $(document).ready(function() {
        $('#paginado_permisos').dataTable({
            "sAjaxSource": $("#paginado").attr("source"),
            "aoColumns": [
                {
                    "bSortable": true
                },
                {
                    "bSortable": false,
                    "bSearchable": false
                }
            ]
        });
    });