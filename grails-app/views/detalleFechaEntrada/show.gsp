
<%@ page import="mx.com.ideasydiseno.electronica.DetalleFechaEntrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleFechaEntrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleFechaEntrada" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleFechaEntrada">
			
				<g:if test="${detalleFechaEntradaInstance?.tipoFecha}">
				<li class="fieldcontain">
					<span id="tipoFecha-label" class="property-label"><g:message code="detalleFechaEntrada.tipoFecha.label" default="Tipo Fecha" /></span>
					
						<span class="property-value" aria-labelledby="tipoFecha-label"><g:link controller="tipoFecha" action="show" id="${detalleFechaEntradaInstance?.tipoFecha?.id}">${detalleFechaEntradaInstance?.tipoFecha?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFechaEntradaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="detalleFechaEntrada.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${detalleFechaEntradaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFechaEntradaInstance?.personal}">
				<li class="fieldcontain">
					<span id="personal-label" class="property-label"><g:message code="detalleFechaEntrada.personal.label" default="Personal" /></span>
					
						<span class="property-value" aria-labelledby="personal-label"><g:link controller="personal" action="show" id="${detalleFechaEntradaInstance?.personal?.id}">${detalleFechaEntradaInstance?.personal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFechaEntradaInstance?.entrada}">
				<li class="fieldcontain">
					<span id="entrada-label" class="property-label"><g:message code="detalleFechaEntrada.entrada.label" default="Entrada" /></span>
					
						<span class="property-value" aria-labelledby="entrada-label"><g:link controller="entrada" action="show" id="${detalleFechaEntradaInstance?.entrada?.id}">${detalleFechaEntradaInstance?.entrada?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${detalleFechaEntradaInstance?.id}" />
					<g:link class="edit" action="edit" id="${detalleFechaEntradaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
