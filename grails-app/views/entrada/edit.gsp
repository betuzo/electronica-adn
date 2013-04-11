<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript>
			function addRefaccion(data){
				console.log("=====> refaccion " + data +"  "+data.success);
				if (!data.success){
					alert("Se genero un problema, contacte el area de sistemas...");
				}else{
					$("#tableRefacciones tbody:last").append(data.html)
				}		    	
		    }

			$(document).on('ready', function(){
				var tipoFecha = $("#tipoFechaEntrada").val();
				$("#totalPago").val("0");
				$("#tipoPago").val(" ");
				$("#form-fecha").css("display", "none");
				$("#form-pagos").css("display", "none");
				//$("#form-refacciones").css("display", "none");


				/**FECHAS**/
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

				$("#nextFecha").on("click", function(){
					$.ajax({
						url:"${request.contextPath}/entrada/nextFecha",
						dataType: "json",
						type:'post',
						data:{id: $('#id').val(), tipoFechaEntrada: $("#tipoFechaEntrada").val()},
						cache:false,
						success: function(data){
							$("#fecha-container ul").append(data.html);
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
						url:"${request.contextPath}/entrada/saveFechaEntrada",
						dataType: "json",
						type:'post',
						data:{id: $('#id').val(), tipoFechaEntrada: $("#tipoFechaEntrada").val(), fechaEntrada: fechaEntrada},
						cache:false,
						success: function(data){
							$("#fecha-container ul").append(data.html);
						},
						error: function(data){
							console.log("Error: " + data);
						}
					});
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
						url:"${request.contextPath}/entrada/savePago",
						dataType:"json",
						type:"post",
						data:{id: $('#id').val(), tipoPago:$("#tipoPago").val(), totalPago:$("#totalPago").val(), fechaPago: fechaPago},
						cache:false,
						success: function(data){
							$("#pago-container ul").append(data.html);
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
					var show = ($("#overlay").css('visibility') == 'visible' ) ? 'hidden' : 'visible'; 
					$("#overlay").css('visibility', show);
					$("#cantidadRefaccion").val("");
					$("#precioUnitario").val("");
					$("#totalRefaccion").val(""); 

				});

				$("#close-modal").on("click", function(){
					var show = ($("#overlay").css('visibility') == 'visible' ) ? 'hidden' : 'visible'; 
					$("#overlay").css('visibility', show);
					$("#cantidadRefaccion").val("");
					$("#precioUnitario").val("");
					$("#totalRefaccion").val(""); 
				})

				$("#refaccion").on('change', function(){
					$("#cantidadRefaccion").val("");
					$("#precioUnitario").val("");
					$("#totalRefaccion").val(""); 
				});

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
				$('#tableRefacciones').jTPS( {perPages:[5,10,20,50,'Todos'],scrollStep:1,scrollDelay:30,
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
		<a href="#edit-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-entrada" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${entradaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${entradaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${entradaInstance?.id}" />
				<g:hiddenField name="version" value="${entradaInstance?.version}" />
<!--Form editar entrada-->
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'proveedor', 'error')} required">
						<label for="proveedor">
							<g:message code="entrada.proveedor.label" default="Proveedor" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="proveedor" name="proveedor.id" from="${mx.com.ideasydiseno.electronica.Proveedor.list()}" optionKey="id" required="" value="${entradaInstance?.proveedor?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'sucursal', 'error')} required">
						<label for="sucursal">
							<g:message code="entrada.sucursal.label" default="Sucursal" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="sucursal" name="sucursal.id" from="${mx.com.ideasydiseno.electronica.Sucursal.list()}" optionKey="id" required="" value="${entradaInstance?.sucursal?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'total', 'error')} required">
						<label for="total">
							<g:message code="entrada.total.label" default="Total" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="number" name="total" required="" value="${fieldValue(bean: entradaInstance, field: 'total')}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'status', 'error')} required">
						<label for="status">
							<g:message code="entrada.status.label" default="Status" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="status" from="${entradaInstance.constraints.status.inList}" required="" value="${entradaInstance?.status}" valueMessagePrefix="entrada.status"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'observaciones', 'error')} ">
						<label for="observaciones">
							<g:message code="entrada.observaciones.label" default="Observaciones" />
							
						</label>
						<g:textField name="observaciones" maxlength="50" value="${entradaInstance?.observaciones}"/>
					</div>

<!--Aqui agregas una nueva fecha -->
					<div id="fecha-container" class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'fechas', 'error')} ">
						<label for="fechas">
							<g:message code="entrada.fechas.label" default="Fechas" />
						</label>

						<ul id="fechasEntrada" class="one-to-many">
						Agregar fecha entrada <img id="nextFecha" href="#" src="${resource(dir: 'images', file: 'next.png')}" alt="Agregar fecha" height="20px" width="20px"/>
							<g:each in="${entradaInstance?.fechas?}" var="f">
							    <li><g:link controller="detalleFechaEntrada" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
							</g:each>
						</ul>
					</div>

					<div id="form-fecha">
						<div class="fieldcontain ${hasErrors(bean: detalleFechaEntradaInstance, field: 'tipoFecha', 'error')} required">
							<label for="tipoFecha">
								<g:message code="detalleFechaEntrada.tipoFecha.label" default="Tipo Fecha" />
								<span class="required-indicator">*</span>
							</label>
							<g:select id="tipoFechaEntrada" name="tipoFecha.id" from="${mx.com.ideasydiseno.electronica.TipoFecha.findAllByTipoUso(mx.com.ideasydiseno.electronica.EntradaController.FECHA_TIPO_ENTRADA)}" optionKey="id" value="${detalleFechaEntradaInstance?.tipoFecha?.id}" class="many-to-one"/>
						</div>
						<div class="fieldcontain ${hasErrors(bean: detalleFechaEntradaInstance, field: 'fecha', 'error')} required">
							<label for="fecha">
								<g:message code="detalleFechaEntrada.fecha.label" default="Fecha" />
								<span class="required-indicator">*</span>
							</label>
							<g:datePicker id="fechaEntrada" name="fechaEntrada" precision="day"  value="${detalleFechaEntradaInstance?.fecha}"  />
						</div>
						<div>
							<img id="slide-fecha-close" href="#" src="${resource (dir:'images', file:'cerrar.png')}" alt="Cerrar" heigth="30px" width="30px"/>
							<img id="save-slide-fecha" href="#"src="${resource(dir: 'images', file: 'Floppy.png')}" alt="Guardar" height="25px" width="25px"/>
						</div>
					</div>

<!--Aquí agregamos nuevos Agregar pagos-->
					<div id="pago-container" class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'pagos', 'error')} ">
						<label for="pagos">
							<g:message code="entrada.pagos.label" default="Pagos" />
						</label>
						<ul class="one-to-many">
							Agregar pagos <img id="slide-pagos-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar Pagos" height="30px" width="30px"/>
							<g:each in="${entradaInstance?.pagos?}" var="p">
							    <li>
							    	<g:link controller="pagoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link>
							    	<img href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar pagos" height="20px" width="20px"/> 
							    </li>
							</g:each>
						</ul>
					</div>
					<div id="form-pagos">
						<g:formRemote name="formPagosAdd" url="[controller: 'entrada', action: 'savePagoShow']" onSuccess="addPago(data)" onFailure="addPago(data)">
							<fieldset class="form">
							
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
									<g:field type="number" required="" name="totalPago" value="${fieldValue(bean: pagoProveedorInstance, field: 'total')}"/>
								</div>
							</fieldset>
							<br>
							<fieldset class="buttons">
								<g:submitButton name="guardarPago" class="saveIcon" value="Guardar"></g:submitButton>
								<div id="slide-pagos-close" class="closeIcon">Cerrar</div>
							</fieldset>
						</g:formRemote>
					</div>

<!--aqui empezamos con refacciones -->
					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'refacciones', 'error')} ">
						<label for="refacciones">
							<g:message code="entrada.refacciones.label" default="Refacciones" />
						</label>

						Agregar refacciones <img id="slide-refacciones-open" href="#"src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar refacciones" height="30px" width="30px"/>
					</div>
				</fieldset>

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
								<tr>
								
									<td><g:link controller="detalleEntrada" action="show" id="${detalleEntradaInstance.id}">${fieldValue(bean: detalleEntradaInstance, field: "refaccion")}</g:link></td>
								
									<td>${fieldValue(bean: detalleEntradaInstance, field: "cantidad")}</td>
								
									<td>${fieldValue(bean: detalleEntradaInstance, field: "precioUnitario")}</td>
								
									<td>${fieldValue(bean: detalleEntradaInstance, field: "total")}</td>

									<td><img href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar refacciones" height="20px" width="20px"/></td>
								
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

				<br>

				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>

			<div id="overlay">
				<g:formRemote name="formRefaccionesAdd" url="[controller: 'entrada', action: 'addRefaccion']" onSuccess="addRefaccion(data)" addRefaccion="addRefaccion(data)">
					<p>
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
							<g:field type="number" id="cantidadRefaccion" name="cantidad" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'cantidad')}"/>
						</div>
						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'precioUnitario', 'error')} required">
							<label for="precioUnitario">
								<g:message code="detalleEntrada.precioUnitario.label" default="Precio Unitario" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" id="precioUnitario" name="precioUnitario" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'precioUnitario')}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'total', 'error')} required">
							<label for="total">
								<g:message code="detalleEntrada.total.label" default="Total" />
								<span class="required-indicator">*</span>
							</label>
							<input id="totalRefaccion" disable />
						</div>
						<g:hiddenField id="idEntradaRefaccion" name="idEntradaRefaccion" value="${entradaInstance?.id}" />
						<br>
						<div class="fielcontain">
							<fieldset class="buttons">
								<g:submitButton name="guardarRefaccion" class="saveIcon" value="Guardar"></g:submitButton>
								<div id="close-modal" class="closeIcon">Cerrar</div>
							</fieldset>
						</div>
					</p>
				</g:formRemote>
			</div>
		</div>
	</body>
</html>
