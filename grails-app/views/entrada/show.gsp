
<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
			
				<g:if test="${entradaInstance?.fechas}">
				<li class="fieldcontain">
					<span id="fechas-label" class="property-label"><g:message code="entrada.fechas.label" default="Fechas" /></span>
					
						<g:each in="${entradaInstance.fechas}" var="f">
						<span class="property-value" aria-labelledby="fechas-label"><g:link controller="detalleFechaEntrada" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.pagos}">
				<li class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="entrada.pagos.label" default="Pagos" /></span>
					
						<g:each in="${entradaInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pagoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.refacciones}">
				<li class="fieldcontain">
					<span id="refacciones-label" class="property-label"><g:message code="entrada.refacciones.label" default="Refacciones" /></span>
					
						<g:each in="${entradaInstance.refacciones}" var="r">
						<span class="property-value" aria-labelledby="refacciones-label"><g:link controller="detalleEntrada" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${entradaInstance?.id}" />
					<g:link class="edit" action="edit" id="${entradaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
