$(document).ready(function(){
    /* Table initialisation */
    $(document).ready(function(){
        $('#paginado').dataTable({
            "sAjaxSource": $("#paginado").attr("source"),
            "aoColumns": [
            {
                "bSortable": true
            },
            {
                "bSortable": true
            },
            {
                "bSortable": false,
                "bSearchable":false
            }
            ]
        });
    });
});

