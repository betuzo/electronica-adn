
<%@ page import="mx.com.ideasydiseno.electronica.DetalleFechaOrden" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleFechaOrden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleFechaOrden" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleFechaOrden">
			
				<g:if test="${detalleFechaOrdenInstance?.tipoFecha}">
				<li class="fieldcontain">
					<span id="tipoFecha-label" class="property-label"><g:message code="detalleFechaOrden.tipoFecha.label" default="Tipo Fecha" /></span>
					
						<span class="property-value" aria-labelledby="tipoFecha-label"><g:link controller="tipoFecha" action="show" id="${detalleFechaOrdenInstance?.tipoFecha?.id}">${detalleFechaOrdenInstance?.tipoFecha?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFechaOrdenInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="detalleFechaOrden.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${detalleFechaOrdenInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFechaOrdenInstance?.personal}">
				<li class="fieldcontain">
					<span id="personal-label" class="property-label"><g:message code="detalleFechaOrden.personal.label" default="Personal" /></span>
					
						<span class="property-value" aria-labelledby="personal-label"><g:link controller="personal" action="show" id="${detalleFechaOrdenInstance?.personal?.id}">${detalleFechaOrdenInstance?.personal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleFechaOrdenInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="detalleFechaOrden.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="orden" action="show" id="${detalleFechaOrdenInstance?.orden?.id}">${detalleFechaOrdenInstance?.orden?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${detalleFechaOrdenInstance?.id}" />
					<g:link class="edit" action="edit" id="${detalleFechaOrdenInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
