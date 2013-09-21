$(document).ready(function() {
    $('#paginado_roles').dataTable({
        "sAjaxSource": $("#paginado_roles").attr("source"),
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