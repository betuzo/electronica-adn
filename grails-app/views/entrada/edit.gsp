<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:javascript>
		document.getElementById('form-fecha').style.display='none';
		document.getElementById('form-pagos').style.display='none';
		document.getElementById('form-refacciones').style.display='none';


		function overlay() {
			el = document.getElementById("overlay");
			el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
		}

		var optionFecha = document.getElementById('tipoFecha');
		var caja = document.getElementById('totalPago');
		var text = document.getElementById('tipoPago');
		text.value = " ";
		caja.value = 0;
		optionFecha.value ='0'
		$(document).ready(function(){

			$("#slide-fecha-open").click(function(){
				$("#form-fecha").slideDown();
				optionFecha.value="0";
			});

			$("#slide-fecha-close").click(function(){
				$("#form-fecha").slideUp();
				optionFecha.value="0";
			});

			$("#slide-pagos-open").click(function(){
				text.value = "";
				caja.value = "";
				$("#form-pagos").slideDown();
			});

			$("#slide-pagos-close").click(function(){
				$("#form-pagos").slideUp();
				text.value = " ";
				caja.value = 0;	
			});

			$("#slide-refacciones-open").click(function(){
				$("#form-refacciones").slideDown();
			});

			$("#slide-refacciones-close").click(function(){
				$("#form-refacciones").slideUp();
			});

			$("#open-modal").click(function(){
				el = document.getElementById("overlay");
				el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
			}); 
		});

		</g:javascript>
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
					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'fechas', 'error')} ">
						<label for="fechas">
							<g:message code="entrada.fechas.label" default="Fechas" />
							
						</label>
						
						<ul class="one-to-many">
						<g:each in="${entradaInstance?.fechas?}" var="f">
						    <li><g:link controller="detalleFechaEntrada" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
						</g:each>
						<li>
						<!--
						<g:link controller="detalleFechaEntrada" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada')])}</g:link> 
						-->
						Agregar fecha entrada <img id="slide-fecha-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar fecha" height="30px" width="30px"/>
							<div id="form-fecha">
								<div class="fieldcontain ${hasErrors(bean: detalleFechaEntradaInstance, field: 'tipoFecha', 'error')} required">
									<label for="tipoFecha">
										<g:message code="detalleFechaEntrada.tipoFecha.label" default="Tipo Fecha" />
										<span class="required-indicator">*</span>
									</label>
									<g:select id="tipoFecha" name="tipoFecha.id" from="${mx.com.ideasydiseno.electronica.TipoFecha.findAllByTipoUso(mx.com.ideasydiseno.electronica.EntradaController.FECHA_TIPO_ENTRADA)}" optionKey="id" value="${detalleFechaEntradaInstance?.tipoFecha?.id}" class="many-to-one"/>
								</div>
								<div class="fieldcontain ${hasErrors(bean: detalleFechaEntradaInstance, field: 'fecha', 'error')} required">
									<label for="fecha">
										<g:message code="detalleFechaEntrada.fecha.label" default="Fecha" />
										<span class="required-indicator">*</span>
									</label>
									<g:datePicker name="fecha" precision="day"  value="${detalleFechaEntradaInstance?.fecha}"  />
								</div>
								<div>
									<img id="slide-fecha-close" href="#" src="${resource (dir:'images', file:'Xion.png')}" alt="Cerrar" heigth="30px" width="30px"/>	
								</div>
							</div>
						</li>
						</ul>
					</div>
<!-- Agregar pagos-->
					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'pagos', 'error')} ">
						<label for="pagos">
							<g:message code="entrada.pagos.label" default="Pagos" />
							
						</label>
						
					<ul class="one-to-many">
					<g:each in="${entradaInstance?.pagos?}" var="p">
					    <li><g:link controller="pagoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					<li class="add">
					<!--
					<g:link controller="pagoProveedor" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor')])}</g:link> -->
					
					Agregar pagos <img id="slide-pagos-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar Pagos" height="30px" width="30px"/>

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
							</div>

						</div>
					</li>
					</ul>

					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'refacciones', 'error')} ">
						<label for="refacciones">
							<g:message code="entrada.refacciones.label" default="Refacciones" />
							
						</label>
<!--Agregar refacciones-->	
					<ul class="one-to-many">
					<g:each in="${entradaInstance?.refacciones?}" var="r">
					    <li><g:link controller="detalleEntrada" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					<li class="add">
					<!--
					<g:link controller="detalleEntrada" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada')])}</g:link>
					-->
					Agregar refacciones <img id="slide-refacciones-open" href="#"src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar refacciones" height="30px" width="30px"/> 
					
					</li>
					</ul>
						<div id= "form-refacciones">
							<table>
								<thead>
									<tr>
										<th>Refaccion</th>
									
										<th>Precio</th>
										
										<th>Cantidad</th>

										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${refaccionInstance}" var="r">
										<tr >
											<td><span>${r?.encodeAsHTML()}</span></td>
						 					<td><span>${r?.encodeAsHTML()}</span></td>
											<td><span>${r?.encodeAsHTML()}</span></td>
											<td><span>${r?.encodeAsHTML()}</span></td>
										</tr>
									</g:each>
								</tbody>
							</table>
							<br>
							<div class="fieldcontain">
								<img id="slide-refacciones-close" href="#" src="${resource(dir: 'images', file: 'Xion.png')}" alt="Cerrar" height="30px" width="30px"/>
								<img id="open-modal" href="#"src="${resource(dir: 'images', file: 'Search.png')}" alt="Buscar Refaccion" height="30px" width="30px"/>
							</div>
						</div>
					</div>
				</fieldset>


				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>

			<div id="overlay">
				<div id="overlayContainer">
					<p>
						<g:form url="[controller:'entrada', action:'refaccionTable']">
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
								<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'cantidad')}"/>
							</div>

							<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'precioUnitario', 'error')} required">
								<label for="precioUnitario">
									<g:message code="detalleEntrada.precioUnitario.label" default="Precio Unitario" />
									<span class="required-indicator">*</span>
								</label>
								<g:field type="number" name="precioUnitario" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'precioUnitario')}"/>
							</div>

							<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'total', 'error')} required">
								<label for="total">
									<g:message code="detalleEntrada.total.label" default="Total" />
									<span class="required-indicator">*</span>
								</label>
								<g:field type="number" name="total" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'total')}"/>
							</div>
							<br>
							<div class="fielcontain">
								<fieldset class="buttons">
									<g:submitButton name="refaccion" id="agregar-refaccion" class="ready" value="Listo"/> 
									<input type="button" id="open-modal" class="close" value="Cerrar" onclick="overlay()" />
								</fieldset>
							</div>
						</g:form>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>
