
<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<jv:generateValidation domain="pagoProveedor" form="formPagos" display="list" container="errors"/>
		
		<g:javascript>
			$(document).on("ready", function(){
				var tipoFecha = $("#tipoFechaEntrada").val();
				$("#totalPago").val("0");
				$("#tipoPago").val(" ");
				$("#form-fecha").css("display", "none");
				$("#form-pagos").css("display", "none");
				$("#form-refacciones").css("display", "none");

				/**FECHAS**/
				$("#slide-fecha-open").on("click", function(){
					$("#form-fecha").slideDown();
				});

				$("#slide-fecha-close").on("click", function(){
					$("#form-fecha").slideUp();
				});

				$("#save-slide-fecha").on("click", function(){

					var fechaEntrada = $("#fechaEntrada_day").val() + "/" + $("#fechaEntrada_month").val() + "/" + $("#fechaEntrada_year").val();
					console.log("id del elemento que estamos guardando: " + $('#id').val());
					console.log("tipo fecha entrada: " + $("#tipoFechaEntrada").val());
					console.log("fecha Entrada: " + fechaEntrada);
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
							console.log("hola que hace el error");
						}
					});
				});



				$(".imgDelete").on("click", function(){
					var objDelete = $(this).attr('id');
					var arrayDelete = objDelete.split('-');
					var urlDelete = "${request.contextPath}/"+arrayDelete[0]+"/delete";
					var elimina = confirm("desea eliminar");
					console.log("valor de eliminar: " + elimina);
					if(elimina){
						console.log("entra a aliminar: " + urlDelete);
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
								console.log("hola que hace el error");
								var deleteContenedor= "delete-"+arrayDelete[0]+"-"+arrayDelete[1];
								console.log("id del contenedor a eliminar: " + deleteContenedor);
								$("#"+deleteContenedor+" ").remove();
							}
						});
					}
				});



				/**PAGOS**/
				
				$("#slide-pagos-open").on("click", function(){
					console.log("entra a pagos");
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
					console.log("guardando pagos");
					$.ajax({
						url:"${request.contextPath}/entrada/savePagoShow",
						dataType:"json",
						type:"post",
						data:{id: $('#id').val(), tipoPago:$("#tipoPago").val(), totalPago:$("#totalPago").val(), fechaPago: fechaPago},
						cache:false,
						success: function(data){
							console.log("success pagos: " + data.html);
							$("#add-pago").append(data.html);
						},
						error: function(data){
							console.log("Error pago");
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
					console.log("cambio de refaccion");
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
					console.log("Entra a refacciones");
					$.ajax({
						url:"${request.contextPath}/entrada/addRefaccion",
						dataType:"json",
						type:"post",
						data:{id: $('#id').val(), refaccion:$("#refaccion").val(), cantidad:$("#cantidadRefaccion").val(), precio: $("#precioUnitario").val()},
						cache:false,
						success: function(data){
							console.log("success pagos: " + data.html);
							$("#tableRefacciones tbody:first").append(data.html)
						},
						error: function(data){
							console.log("Error pago");
						}
					});
				});
			});
		</g:javascript>

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
						 &nbsp; &nbsp; &nbsp;Agregar fecha entrada <img id="slide-fecha-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar fecha" height="30px" width="30px"/>
						
						<g:each in="${entradaInstance.fechas}" var="f">
						<span id="delete-detalleFechaEntrada-${f.id}" class="property-value" aria-labelledby="fechas-label"><g:link controller="detalleFechaEntrada" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link>
							<img id="detalleFechaEntrada-${f.id}" class="imgDelete" href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar Fecha" height="20px" width="20px"/></span>
						</g:each>
				</li>

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
						<img id="slide-fecha-close" href="#" src="${resource (dir:'images', file:'Xion.png')}" alt="Cerrar" heigth="30px" width="30px"/>
						<img id="save-slide-fecha" href="#"src="${resource(dir: 'images', file: 'Floppy.png')}" alt="Guardar" height="25px" width="25px"/>
					</div>
				</div>
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

					<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'fechaPago', 'error')} required">
						<label for="fechaPago">
							<g:message code="pagoProveedor.fechaPago.label" default="Fecha Pago" />
							<span class="required-indicator">*</span>
						</label>
						<g:datePicker name="fechaPago" precision="day"  value="${pagoProveedorInstance?.fechaPago}"  />
					</div>
					<div class="fieldcontain">
						<img id="slide-pagos-close" href="#" src="${resource(dir: 'images', file: 'Xion.png')}" alt="Agregar Pagos" height="30px" width="30px"/>
						<img id="save-slide-pagos" href="#"src="${resource(dir: 'images', file: 'Floppy.png')}" alt="Guardar" height="25px" width="25px"/>
					</div>
				</div>
			
				<li class="fieldcontain">
					<span id="refacciones-label" class="property-label"><g:message code="entrada.refacciones.label" default="Refacción" /></span>
					&nbsp; &nbsp; &nbsp;Agregar refacciones<img id="slide-refacciones-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar fecha" height="30px" width="30px"/>
						<g:each in="${entradaInstance.refacciones}" var="r">
						<span class="property-value" aria-labelledby="refacciones-label">
							<g:link controller="detalleEntrada" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>
							<img id="delete-refacciones" href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar Refacción" height="20px" width="20px"/>
						</span>
						</g:each>

				</li>
				<div id="form-refacciones">
					<table id="tableRefacciones">
						<thead>
							<tr>
								<th>Refaccion</th>
							
								<th>Precio</th>
								
								<th>Cantidad</th>

								<th>Total</th>
							</tr>
						</thead>
						<tbody>

							<g:each in="${entradaInstance?.refacciones?}" status="i" var="detalleEntradaInstance">
								<tr id="delete-detalleEntrada-${detalleEntradaInstance.id}" class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
									<td><g:link controller="detalleEntrada" action="show" id="${detalleEntradaInstance.id}">${fieldValue(bean: detalleEntradaInstance, field: "refaccion")}</g:link></td>
								
									<td>${fieldValue(bean: detalleEntradaInstance, field: "cantidad")}</td>
								
									<td>${fieldValue(bean: detalleEntradaInstance, field: "precioUnitario")}</td>
								
									<td>${fieldValue(bean: detalleEntradaInstance, field: "total")}</td>

									<td><img id="detalleEntrada-${detalleEntradaInstance.id}" class="imgDelete" href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar refacciones" height="20px" width="20px"/></td>
								
								</tr>
							</g:each>
						</tbody>
					</table>
					<br>
					<div class="fieldcontain">
						<img id="slide-refacciones-close" href="#" src="${resource(dir: 'images', file: 'Xion.png')}" alt="Cerrar" height="30px" width="30px"/>
						<img id="open-modal" href="#" src="${resource(dir: 'images', file: 'Search.png')}" alt="Buscar Refaccion" height="25px" width="25px"/>
						<img id="save-slide-refacciones" href="#"src="${resource(dir: 'images', file: 'Floppy.png')}" alt="Guardar" height="25px" width="25px"/>
					</div>
				</div>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField id="idEntrada" name="id" value="${entradaInstance?.id}" />
					<g:link class="edit" action="edit" id="${entradaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>


			<div id="overlay">
				<div id="overlayContainer">
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
						<br>
						<div class="fielcontain">
							<fieldset class="buttons">
								<input type="button" id="add-modal-refacciones" class="ready" value="Listo"/> 
								<input type="button" id="close-modal" class="close" value="Cerrar"/>
							</fieldset>
						</div>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>
