
<%@ page import="mx.com.ideasydiseno.electronica.PagoProveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagoProveedor.label', default: 'PagoProveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pagoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pagoProveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pagoProveedor">
			
				<g:if test="${pagoProveedorInstance?.tipoPago}">
				<li class="fieldcontain">
					<span id="tipoPago-label" class="property-label"><g:message code="pagoProveedor.tipoPago.label" default="Tipo Pago" /></span>
					
						<span class="property-value" aria-labelledby="tipoPago-label"><g:fieldValue bean="${pagoProveedorInstance}" field="tipoPago"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoProveedorInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="pagoProveedor.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${pagoProveedorInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoProveedorInstance?.fechaPago}">
				<li class="fieldcontain">
					<span id="fechaPago-label" class="property-label"><g:message code="pagoProveedor.fechaPago.label" default="Fecha Pago" /></span>
					
						<span class="property-value" aria-labelledby="fechaPago-label"><g:formatDate date="${pagoProveedorInstance?.fechaPago}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoProveedorInstance?.realizo}">
				<li class="fieldcontain">
					<span id="realizo-label" class="property-label"><g:message code="pagoProveedor.realizo.label" default="Realizo" /></span>
					
						<span class="property-value" aria-labelledby="realizo-label"><g:link controller="personal" action="show" id="${pagoProveedorInstance?.realizo?.id}">${pagoProveedorInstance?.realizo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoProveedorInstance?.entrada}">
				<li class="fieldcontain">
					<span id="entrada-label" class="property-label"><g:message code="pagoProveedor.entrada.label" default="Entrada" /></span>
					
						<span class="property-value" aria-labelledby="entrada-label"><g:link controller="entrada" action="show" id="${pagoProveedorInstance?.entrada?.id}">${pagoProveedorInstance?.entrada?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pagoProveedorInstance?.id}" />
					<g:link class="edit" action="edit" id="${pagoProveedorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
