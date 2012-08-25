
<%@ page import="mx.com.ideasydiseno.electronica.DetalleEntrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleEntrada.label', default: 'DetalleEntrada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleEntrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleEntrada" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleEntrada">
			
				<g:if test="${detalleEntradaInstance?.entrada}">
				<li class="fieldcontain">
					<span id="entrada-label" class="property-label"><g:message code="detalleEntrada.entrada.label" default="Entrada" /></span>
					
						<span class="property-value" aria-labelledby="entrada-label"><g:link controller="entrada" action="show" id="${detalleEntradaInstance?.entrada?.id}">${detalleEntradaInstance?.entrada?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleEntradaInstance?.refaccion}">
				<li class="fieldcontain">
					<span id="refaccion-label" class="property-label"><g:message code="detalleEntrada.refaccion.label" default="Refaccion" /></span>
					
						<span class="property-value" aria-labelledby="refaccion-label"><g:link controller="refaccion" action="show" id="${detalleEntradaInstance?.refaccion?.id}">${detalleEntradaInstance?.refaccion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleEntradaInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="detalleEntrada.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${detalleEntradaInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleEntradaInstance?.precioUnitario}">
				<li class="fieldcontain">
					<span id="precioUnitario-label" class="property-label"><g:message code="detalleEntrada.precioUnitario.label" default="Precio Unitario" /></span>
					
						<span class="property-value" aria-labelledby="precioUnitario-label"><g:fieldValue bean="${detalleEntradaInstance}" field="precioUnitario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleEntradaInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="detalleEntrada.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${detalleEntradaInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${detalleEntradaInstance?.id}" />
					<g:link class="edit" action="edit" id="${detalleEntradaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
