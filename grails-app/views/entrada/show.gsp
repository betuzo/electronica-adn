
<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<jv:generateValidation domain="pagoProveedor" form="formPagos" display="list" container="errors"/>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript>

			function addPago(data) {
				console.log("=====> " + data +"  "+data.success);
				if (!data.success){
					alert("Se genero un problema, contacte el area de sistemas...");
				}else{
					$("#add-pago").append(data.html);
					var tipoP = document.getElementById("tipoPago");
					var totalP = document.getElementById("totalPago");
					tipoP.value="";
					totalP.value="";
				}
		    }

		    function addRefaccion(data){
				console.log("=====> refaccion " + data +"  "+data.success);
				if (!data.success){
					alert("Se genero un problema, contacte el area de sistemas...");
				}else{
					if ($('#tableRefacciones >tbody >tr').length == 0){
						$("#tableRefacciones tbody").append(data.html)

					}else{
						// $("#tableRefacciones tbody").append(data.html)
						$("#tableRefacciones tbody> tr:first").before(data.html);
						// $("#tableRefacciones tbody> tr:last").after(data.html);
					}
				}

				var cantidadR = document.getElementById("cantidadRefaccion");
				var preciouR = document.getElementById("precioUnitario");
				var totalR = document.getElementById("totalRefaccion");
				cantidadR.value="";
				preciouR.value=""
				totalR.value="";
		    }


			$(document).on("ready", function(){

				$.ajax({
					url:"${request.contextPath}/entrada/hasNext",
					dataType: "json",
					type:'post',
					data:{id: $('#id').val()},
					cache:false,
					success: function(data){
						$("#nextFecha").css('display', " " +data.html+" ");
					},
					error: function(data){
						console.log(" Error: " + data);
					}
				});


				var tipoFecha = $("#tipoFechaEntrada").val();
				$("#totalPago").val("0");
				$("#tipoPago").val(" ");
				$("#form-fecha").css("display", "none");
				$("#form-pagos").css("display", "none");
				//$("#form-refacciones").css("display", "none");

				/**FECHAS**/
				$("#nextFecha").on("click", function(){
					$.ajax({
						url:"${request.contextPath}/entrada/nextFechaShow",
						dataType: "json",
						type:'post',
						data:{id: $('#id').val(), tipoFechaEntrada: $("#tipoFechaEntrada").val()},
						cache:false,
						success: function(data){
							$("#add-fechas").append(data.html);
							$("#nextFecha").css('display', " " +data.img+" ");
						},
						error: function(data){
							console.log("Error: " + data);
						}
					});
				});

				$("#slide-fecha-open").on("click", function(){
					$("#form-fecha").slideDown();
				});

				$("#slide-fecha-close").on("click", function(){
					$("#form-fecha").slideUp();
				});

				$("#save-slide-fecha").on("click", function(){
					var fechaEntrada = $("#fechaEntrada_day").val() + "/" + $("#fechaEntrada_month").val() + "/" + $("#fechaEntrada_year").val();
					$.ajax({
						url:"${request.contextPath}/entrada/saveFechaEntradaShow",
						dataType: "json",
						type:'post',
						data:{id: $('#id').val(), tipoFechaEntrada: $("#tipoFechaEntrada").val(), fechaEntrada: fechaEntrada},
						cache:false,
						success: function(data){
							$("#add-fechas").append(data.html);
						},
						error: function(data){
							console.log("Error: " + data);
						}
					});
				});



				$(".imgDelete").on("click", function(){
					var objDelete = $(this).attr('id');
					var arrayDelete = objDelete.split('-');
					var urlDelete = "${request.contextPath}/"+arrayDelete[0]+"/delete";
					var elimina = confirm("¿Está usted seguro?");
					if(elimina){
						$.ajax({
							url: urlDelete,
							dataType: "json",
							type:'post',
							data:{id: arrayDelete[1]},
							cache:false,
							success: function(data){
								console.log("console success delete " + arrayDelete[0]);
							},
							error: function(data){
								console.log("Error: " + data);
								var deleteContenedor= "delete-"+arrayDelete[0]+"-"+arrayDelete[1];
								$("#"+deleteContenedor+" ").remove();
							}
						});
					}
				});
				/**PAGOS**/

				$("#slide-pagos-open").on("click", function(){
					$("#totalPago").val("");
					$("#tipoPago").val("");
					$("#form-pagos").slideDown();
				});

				$("#slide-pagos-close").on("click", function(){
					$("#totalPago").val("0");
					$("#tipoPago").val(" ");
					$("#form-pagos").slideUp();
				});

				$("#save-slide-pagos").on('click', function(){
					var fechaPago = $("#fechaPago_day").val() + "/" + $("#fechaPago_month").val() + "/" + $("#fechaPago_year").val();
					$.ajax({
						url:"${request.contextPath}/entrada/savePagoShow",
						dataType:"json",
						type:"post",
						data:{id: $('#id').val(), tipoPago:$("#tipoPago").val(), totalPago:$("#totalPago").val(), fechaPago: fechaPago},
						cache:false,
						success: function(data){
							$("#add-pago").append(data.html);
						},
						error: function(data){
							console.log("Error: " + data);
						}
					});
				});

				/**Refacciones**/

				$("#slide-refacciones-open").on("click", function(){
					$("#form-refacciones").slideDown();
				});

				$("#slide-refacciones-close").on("click", function(){
					$("#form-refacciones").slideUp();
				});

				$("#open-modal").on("click", function(){
					var show = ($("#overlay-entrada-show").css('visibility') == 'visible' ) ? 'hidden' : 'visible';
					$("#overlay-entrada-show").css('visibility', show);
					$("#cantidadRefaccion").val("");
					$("#precioUnitario").val("");
					$("#totalRefaccion").val("");

				});

				$("#close-modal").on("click", function(){
					var show = ($("#overlay-entrada-show").css('visibility') == 'visible' ) ? 'hidden' : 'visible';
					$("#overlay-entrada-show").css('visibility', show);
					$("#cantidadRefaccion").val("");
					$("#precioUnitario").val("");
					$("#totalRefaccion").val("");
				})

				$("#refaccion").on('change', function(){
					$("#cantidadRefaccion").val("");
					$("#precioUnitario").val("");
					$("#totalRefaccion").val("");
				});
				/**
				$("#precioUnitario").on('change', function(){
					var cantidad = $("#cantidadRefaccion").val();
					var precio = $("#precioUnitario").val();
					var result = parseFloat(cantidad) * parseFloat(precio);
					$("#totalRefaccion").val(result);
				});

				$("#cantidadRefaccion").on("change", function(){
					var cantidad = $("#cantidadRefaccion").val();
					var precio = $("#precioUnitario").val();
					var result = parseFloat(cantidad) * parseFloat(precio);
					$("#totalRefaccion").val(result);
				}); */


				$('#precioUnitario').keyup(function () {
					this.value = this.value.replace(/[^0-9\.]/g,'');
					var cantidad = $("#cantidadRefaccion").val();
					var precio = $("#precioUnitario").val();
					var result = parseFloat(cantidad) * parseFloat(precio);
					if (!isNaN(result)){
						$("#totalRefaccion").val(result);
					}else{
						$("#totalRefaccion").val(0);
					}
				});

				$('#cantidadRefaccion').keyup(function () {
					this.value = this.value.replace(/[^0-9\.]/g,'');
					var cantidad = $("#cantidadRefaccion").val();
					var precio = $("#precioUnitario").val();
					var result = parseFloat(cantidad) * parseFloat(precio);
					if (!isNaN(result)){
						$("#totalRefaccion").val(result);
					}else{
						$("#totalRefaccion").val(0);
					}
					//console.log("lo del nan" + (isNaN(result)));
				});

				$("#totalPago").on('keyup', function(){
					this.value = this.value.replace(/[^0-9\.]/g,'');
				});


				$("#add-modal-refacciones").on("click", function(){
					$.ajax({
						url:"${request.contextPath}/entrada/addRefaccion",
						dataType:"json",
						type:"post",
						data:{id: $('#id').val(), refaccion:$("#refaccion").val(), cantidad:$("#cantidadRefaccion").val(), precio: $("#precioUnitario").val()},
						cache:false,
						success: function(data){
							$("#tableRefacciones tbody:first").append(data.html)
						},
						error: function(data){
							console.log("Error: " + data);
						}
					});
				});

				/*jTPS*/
				$('#tableRefacciones').jTPS( {perPages:[5,12,15,50,'Todos'],scrollStep:1,scrollDelay:30,
					clickCallback:function () {
						// target table selector
						var table = '#tableRefacciones';
						// store pagination + sort in cookie
						document.cookie = 'jTPS=sortasc:' + $(table + ' .sortableHeader').index($(table + ' .sortAsc')) + ',' +
							'sortdesc:' + $(table + ' .sortableHeader').index($(table + ' .sortDesc')) + ',' +
							'page:' + $(table + ' .pageSelector').index($(table + ' .hilightPageSelector')) + ';';
					}
				});

				// reinstate sort and pagination if cookie exists
				var cookies = document.cookie.split(';');
				for (var ci = 0, cie = cookies.length; ci < cie; ci++) {
					var cookie = cookies[ci].split('=');
					if (cookie[0] == 'jTPS') {
						var commands = cookie[1].split(',');
						for (var cm = 0, cme = commands.length; cm < cme; cm++) {
							var command = commands[cm].split(':');
							if (command[0] == 'sortasc' && parseInt(command[1]) >= 0) {
								$('#tableRefacciones .sortableHeader:eq(' + parseInt(command[1]) + ')').click();
							} else if (command[0] == 'sortdesc' && parseInt(command[1]) >= 0) {
								$('#tableRefacciones .sortableHeader:eq(' + parseInt(command[1]) + ')').click().click();
							} else if (command[0] == 'page' && parseInt(command[1]) >= 0) {
								$('#tableRefacciones .pageSelector:eq(' + parseInt(command[1]) + ')').click();
							}
						}
					}
				}

				// bind mouseover for each tbody row and change cell (td) hover style
				$('#tableRefacciones tbody tr:not(.stubCell)').bind('mouseover mouseout',
					function (e) {
						// hilight the row
						e.type == 'mouseover' ? $(this).children('td').addClass('hilightRow') : $(this).children('td').removeClass('hilightRow');
					}
				);
			});
		</g:javascript>
		<style >
		#tableRefacciones thead th {
			white-space: nowrap;
			overflow-x:hidden;
			padding: 2px;
			font-family: Tahoma;
			font-size: 10pt;
		}

		#tableRefacciones tbody td {
			padding: 2px;
			font-family: Tahoma;
			font-size: 10pt;
		}

		#tableRefacciones tfoot td {
			font-family: Tahoma;
			font-size: 10pt;
		}
		</style>

	</head>
	<body>
		<a href="#show-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-entrada" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:hiddenField name="id" value="${entradaInstance?.id}" />
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list entrada">

				<g:if test="${entradaInstance?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="entrada.proveedor.label" default="Proveedor" /></span>
						<span class="property-value" aria-labelledby="proveedor-label"><g:link controller="proveedor" action="show" id="${entradaInstance?.proveedor?.id}">${entradaInstance?.proveedor?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>

				<g:if test="${entradaInstance?.sucursal}">
				<li class="fieldcontain">
					<span id="sucursal-label" class="property-label"><g:message code="entrada.sucursal.label" default="Sucursal" /></span>

						<span class="property-value" aria-labelledby="sucursal-label"><g:link controller="sucursal" action="show" id="${entradaInstance?.sucursal?.id}">${entradaInstance?.sucursal?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${entradaInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="entrada.total.label" default="Total" /></span>

						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${entradaInstance}" field="total"/></span>

				</li>
				</g:if>

				<g:if test="${entradaInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="entrada.status.label" default="Status" /></span>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${entradaInstance}" field="status"/></span>
				</li>
				</g:if>

				<g:if test="${entradaInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="entrada.observaciones.label" default="Observaciones" /></span>
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${entradaInstance}" field="observaciones"/></span>

				</li>
				</g:if>
<!-- agregar fechas-->

				<li id="add-fechas" class="fieldcontain">
					<span id="fechas-label" class="property-label"><g:message code="entrada.fechas.label" default="Fechas" /></span>
						 &nbsp; &nbsp; &nbsp;Fecha entrada <img id="nextFecha" href="#" src="${resource(dir: 'images', file: 'next.png')}" alt="Agregar fecha" height="20px" width="20px"/>

						<g:each in="${entradaInstance.fechas}" var="f">
						<span id="delete-detalleFechaEntrada-${f.id}" class="property-value" aria-labelledby="fechas-label"><g:link controller="detalleFechaEntrada" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>


<!--Agregar pagos-->
				<li id="add-pago" class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="entrada.pagos.label" default="Pagos" /></span>
						&nbsp; &nbsp; &nbsp;Agregar Pagos <img id="slide-pagos-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar fecha" height="30px" width="30px"/>
						<g:each in="${entradaInstance.pagos}" var="p">
						<span id="delete-pagoProveedor-${p.id}" class="property-value" aria-labelledby="pagos-label">
							<g:link controller="pagoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link>
							<img id="pagoProveedor-${p.id}" class="imgDelete" href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar Pago" height="20px" width="20px"/>
						</span>
						</g:each>
				</li>
				<div id="form-pagos">
					<div class="container-form-overlay">
						<g:formRemote name="formPagosAdd" url="[controller: 'entrada', action: 'savePagoShow']" onSuccess="addPago(data)" onFailure="addPago(data)">
								<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'tipoPago', 'error')} required">
									<label for="tipoPago">
										<g:message code="pagoProveedor.tipoPago.label" default="Tipo Pago" />
										<span class="required-indicator">*</span>
									</label>
									<g:textField id="tipoPago" required="" name="tipoPago" value="${pagoProveedorInstance?.tipoPago}"/>
								</div>

								<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'total', 'error')} required">
									<label for="total">
										<g:message code="pagoProveedor.total.label" default="Total" />
										<span class="required-indicator">*</span>
									</label>
									<g:field type="number" required="" name="totalPago" autocomplete="off" value="${fieldValue(bean: pagoProveedorInstance, field: 'total')}"/>
								</div>

								<g:hiddenField id="idEntradaPago" name="idEntradaPago" value="${entradaInstance?.id}" />
							<fieldset class="buttons">
								<g:submitButton name="guardarPago" class="saveIcon" value="Guardar"></g:submitButton>
								<div id="slide-pagos-close" class="closeIcon">Cerrar</div>
							</fieldset>
						</g:formRemote>
					</div>
				</div>

				<li class="fieldcontain">
					<span id="refacciones-label" class="property-label"><g:message code="entrada.refacciones.label" default="Refacción" /></span>
					<span class="property-value" aria-labelledby="refacciones-label"> Agregar refacciones<img id="slide-refacciones-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar fecha" height="30px" width="30px"/> </span>
				</li>

				<div id="form-refacciones">
					<table id="tableRefacciones">
						<thead>
							<tr>
								<th>Refaccion</th>

								<th>Precio</th>

								<th>Cantidad</th>

								<th>Total</th>

								<th>Eliminar</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${entradaInstance?.refacciones?}" status="i" var="detalleEntradaInstance">
								<tr id="delete-detalleEntrada-${detalleEntradaInstance.id}" >

									<td><g:link controller="detalleEntrada" action="show" id="${detalleEntradaInstance.id}">${fieldValue(bean: detalleEntradaInstance, field: "refaccion")}</g:link></td>

									<td>${fieldValue(bean: detalleEntradaInstance, field: "cantidad")}</td>

									<td>${fieldValue(bean: detalleEntradaInstance, field: "precioUnitario")}</td>

									<td>${fieldValue(bean: detalleEntradaInstance, field: "total")}</td>

									<td><img id="detalleEntrada-${detalleEntradaInstance.id}" class="imgDelete" href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar refacciones" height="20px" width="20px"/></td>

								</tr>
							</g:each>
						</tbody>
						<tfoot class="navGrid">
							<tr>
								<td colspan=7>
									<div class="pagination"></div>
									<div class="paginationTitle">Pag </div>
									<div class="selectPerPage"></div>
									<div class="status"> </div>
									<fieldset class="buttonsGrid">
										<div id="slide-refacciones-close" class="closeIcon">Cerar</div>
										<div id="open-modal" class="searchIcon">Agregar Refacciones</div>
									</fieldset>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField id="idEntrada" name="id" value="${entradaInstance?.id}" />
					<g:link class="edit" action="edit" id="${entradaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>


			<div id="overlay-entrada-show">
				<g:formRemote name="formRefaccionesAdd" url="[controller: 'entrada', action: 'addRefaccion']" onSuccess="addRefaccion(data)" addRefaccion="addRefaccion(data)">
					<div class="container-form-overlay" >
						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'refaccion', 'error')} required">
							<label for="refaccion">
								<g:message code="detalleEntrada.refaccion.label" default="Refaccion" />
								<span class="required-indicator">*</span>
							</label>
							<g:select id="refaccion" name="refaccion.id" from="${mx.com.ideasydiseno.electronica.Refaccion.list()}" optionKey="id" required="" value="${detalleEntradaInstance?.refaccion?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'cantidad', 'error')} required">
							<label for="cantidad">
								<g:message code="detalleEntrada.cantidad.label" default="Cantidad" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" id="cantidadRefaccion" name="cantidad" autocomplete="off" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'cantidad')}"/>
						</div>
						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'precioUnitario', 'error')} required">
							<label for="precioUnitario">
								<g:message code="detalleEntrada.precioUnitario.label" default="Precio Unitario" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" id="precioUnitario" name="precioUnitario" autocomplete="off" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'precioUnitario')}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'total', 'error')} required">
							<label for="total">
								<g:message code="detalleEntrada.total.label" default="Total" />
								<span class="required-indicator">*</span>
							</label>
							<input type="number" id="totalRefaccion" disabled="" autocomplete="off"/>
						</div>
						<g:hiddenField id="idEntradaRefaccion" name="idEntradaRefaccion" value="${entradaInstance?.id}" />
						<br>
						<div class="fielcontain">
							<fieldset class="buttons">
								<g:submitButton id="guardarRefaccion" name="guardarRefaccion" class="saveIcon" value="Guardar"></g:submitButton>
								<div id="close-modal" class="closeIcon">Cerrar</div>
							</fieldset>
						</div>
					</div>
				</g:formRemote>
			</div>
		</div>
	</body>
</html>
