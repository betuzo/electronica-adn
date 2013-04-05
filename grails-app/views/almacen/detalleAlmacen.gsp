<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">
    <title >Detalle almacen</title>
     <link rel="stylesheet" href="${resource(dir: 'jqwidgets', file: '/styles/jqx.base.css')}" type="text/css">
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxcore.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxbuttons.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxscrollbar.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxmenu.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxgrid.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxgrid.grouping.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxgrid.selection.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxdata.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'gettheme.js')}" ></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var theme = getDemoTheme();
            var url = "${request.contextPath}/almacen/jsonAlmacen";
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'sucursal', type: 'string' },
                    { name: 'refaccion', type: 'string' },
                    { name: 'cantidad', type: 'int' },
                    { name: 'precio', type: 'int' },
                    { name: 'proveedor', type: 'string' }
                ],
                //id: 'id',
                url: url
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#jqxgrid").jqxGrid({
                width: 800,
                source: dataAdapter,
                autoheight: true,
                columns: [
                    { text: 'Sucursal', datafield: 'sucursal', width: 150 },
                    { text: 'Refaccion', datafield: 'refaccion', width: 200 },
                    { text: 'Cantidad', datafield: 'cantidad', width: 100 },
                    { text: 'Precio', datafield: 'precio', width: 100 },
                    { text: 'Proveedor', datafield: 'proveedor', minwidth: 150 }
                ]
                });
        });

    </script>
</head>
<body >
    <h2>Almacen</h2>
    <div id="jqxgrid">
    </div>
</body>
</html>