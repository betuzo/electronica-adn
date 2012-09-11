
<%@ page import="mx.com.ideasydiseno.electronica.PagoCliente" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagoCliente.label', default: 'PagoCliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pagoCliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pagoCliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pagoCliente">
			
				<g:if test="${pagoClienteInstance?.tipoPago}">
				<li class="fieldcontain">
					<span id="tipoPago-label" class="property-label"><g:message code="pagoCliente.tipoPago.label" default="Tipo Pago" /></span>
					
						<span class="property-value" aria-labelledby="tipoPago-label"><g:fieldValue bean="${pagoClienteInstance}" field="tipoPago"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoClienteInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="pagoCliente.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${pagoClienteInstance.total}" type="currency" currencyCode="MXN" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoClienteInstance?.fechaPago}">
				<li class="fieldcontain">
					<span id="fechaPago-label" class="property-label"><g:message code="pagoCliente.fechaPago.label" default="Fecha Pago" /></span>
					
						<span class="property-value" aria-labelledby="fechaPago-label"><g:formatDate date="${pagoClienteInstance?.fechaPago}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoClienteInstance?.recibio}">
				<li class="fieldcontain">
					<span id="recibio-label" class="property-label"><g:message code="pagoCliente.recibio.label" default="Recibio" /></span>
					
						<span class="property-value" aria-labelledby="recibio-label"><g:link controller="personal" action="show" id="${pagoClienteInstance?.recibio?.id}">${pagoClienteInstance?.recibio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoClienteInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="pagoCliente.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="orden" action="show" id="${pagoClienteInstance?.orden?.id}">${pagoClienteInstance?.orden?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pagoClienteInstance?.id}" />
					<g:link class="edit" action="edit" id="${pagoClienteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
