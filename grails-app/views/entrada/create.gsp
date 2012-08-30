<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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

			<g:form action="save" >
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

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'pagos', 'error')} ">
						<label for="pagos">
							<g:message code="entrada.pagos.label" default="Pagos" />
							
						</label>
						
					<ul class="one-to-many">
					<g:each in="${entradaInstance?.pagos?}" var="p">
					    <li><g:link controller="pagoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
						</g:each>
						<li class="add">
						<g:link controller="pagoProveedor" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor')])}</g:link>
						</li>
					</ul>

					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'refacciones', 'error')} ">
						<label for="refacciones">
							<g:message code="entrada.refacciones.label" default="Refacciones" />
						</label>
						
					<ul class="one-to-many">
					<g:each in="${entradaInstance?.refacciones?}" var="r">
					    <li><g:link controller="detalleEntrada" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					<li class="add">
					<g:link controller="detalleEntrada" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada')])}</g:link>
					</li>
					</ul>

					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
