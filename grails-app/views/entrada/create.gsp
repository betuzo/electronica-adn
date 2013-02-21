<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript>
			var caja = document.getElementById('totalPago');
			var text = document.getElementById('tipoPago');
			//var el = $('#form-refacciones');
			var el = document.getElementById('form-refacciones');
			document.getElementById('form-refacciones').style.display='none';
			el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
			//text.value = " ";
			//caja.value = 0;

			function overlay() {
				el = document.getElementById("overlay");
				el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
			}

			function obtenerElemento() { 
			
			}

			$(document).ready(function(){
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
		<a href="#create-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		
		<div id="create-entrada" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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

			<g:form name="form" action="save" >
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

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'fechas', 'error')} ">
						<label for="fechas">
							<g:message code="entrada.fechas.label" default="Fecha" />	
						</label>
						<g:datePicker name="fecha" precision="day"  value="${detalleFechaEntradaInstance?.fecha}"  />
					</div>
<!--Agregar refacciones -->
					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'refacciones', 'error')} ">
						<label for="refacciones">
							<g:message code="entrada.refacciones.label" default="Refacciones" />
						</label>
						Agregar refacciones <img id="slide-refacciones-open" href="#"src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar refacciones" height="30px" width="30px"/> 
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
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			<br>
<!-- Agregar refacciones -->
			<div id="overlay">
				<div id="overlayContainer">
					<p>
						<g:form name="form-refacciones" url="[controller:'entrada', action:'refaccionTable']">
							
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
							
							<br/>
							<div class="fielcontain">
								<fieldset class="buttons">
									<g:submitButton name="refaccion" id="agregar-refaccion" class="ready" value="Listo"/> 
									<input type="button" id="close-modal" class="close" value="Cerrar" onclick="overlay()" />
								</fieldset>
							</div>
						</g:form>
					</p>
				</div>
			</div>

		</div>
	</body>
</html>
