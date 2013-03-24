<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">
    <title >Detalle almacen</title>
     <link rel="stylesheet" href="${resource(dir: 'jqwidgets', file: '/styles/jqx.base.css')}" type="text/css">
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxcore.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxdata.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxbuttons.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxscrollbar.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxmenu.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxgrid.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxgrid.grouping.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'jqxgrid.selection.js')}" ></script>
     <script type="text/javascript" src="${resource(dir: 'jqwidgets', file: 'gettheme.js')}" ></script>
    <script type="text/javascript">
        $(document).on('ready', function(){
            var data = new Array();
            var firstNames =
            [
                "Andrew", "Nancy", "Shelley", "Regina", "Yoshi", "Antoni", "Mayumi", "Ian", "Peter", "Lars", "Petra", "Martin", "Sven", "Elio", "Beate", "Cheryl", "Michael", "Guylene"
            ];
            var lastNames =
            [
                "Fuller", "Davolio", "Burke", "Murphy", "Nagase", "Saavedra", "Ohno", "Devling", "Wilson", "Peterson", "Winkler", "Bein", "Petersen", "Rossi", "Vileid", "Saylor", "Bjorn", "Nodier"
            ];
            var productNames =
            [
                "Black Tea", "Green Tea", "Caffe Espresso", "Doubleshot Espresso", "Caffe Latte", "White Chocolate Mocha", "Cramel Latte", "Caffe Americano", "Cappuccino", "Espresso Truffle", "Espresso con Panna", "Peppermint Mocha Twist"
            ];
            var priceValues =
            [
                "2.25", "1.5", "3.0", "3.3", "4.5", "3.6", "3.8", "2.5", "5.0", "1.75", "3.25", "4.0"
            ];
            for (var i = 0; i < 50; i++) {
                var row = {};
                var productindex = Math.floor(Math.random() * productNames.length);
                var price = parseFloat(priceValues[productindex]);
                var quantity = 1 + Math.round(Math.random() * 10);
                row["firstname"] = firstNames[Math.floor(Math.random() * firstNames.length)];
                row["lastname"] = lastNames[Math.floor(Math.random() * lastNames.length)];
                row["productname"] = productNames[productindex];
                row["price"] = price;
                row["quantity"] = quantity;
                row["total"] = price * quantity;
                data[i] = row;
                console.log("===>data: " + data[i].total + row.total);
            };

            console.log(data);

            var loadGrid = function (){
                $.ajax({
                    url:"$(request.contextPath)/",
                    dataType:"json",
                    beforeSend: function () {
                        $("jqxgrid").html('');
                    },
                    error: function (json, textStatus, errorThrown) {
                        alert(' Error :' + errorThrown);
                    },
                    success: function (data) {
                        var gridData = data;
                        var gridSource =
                        {
                            localdata: gridData,
                            datatype: 'json'
                        };
                        var gridDataAdapter = new $.jqx.dataAdapter(gridSource);
                        $("#jqxgrid").jqxGrid(
                        {
                            width: 670,
                            source: gridDataAdapter,
                            editable: true,
                            pageable: true,
                            autoheight: true,
                            selectionmode: 'singlecell',
                            columns: [
                              { text: 'Name', datafield: 'name', width: 250 },
                              { text: 'Beverage Type', datafield: 'type', width: 250 },
                              { text: 'Calories', datafield: 'calories', width: 180 },
                              { text: 'Total Fat', datafield: 'totalfat', width: 120 },
                              { text: 'Protein', datafield: 'protein', minwidth: 120 }]
                        });
                    }
                });
            }
        });
    </script>
</head>
<body class='default'>
    <div id='jqxWidget'>
        <div id="jqxgrid">
        </div>
</body>
</html>