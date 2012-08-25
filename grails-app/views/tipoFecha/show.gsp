
<%@ page import="mx.com.ideasydiseno.electronica.TipoFecha" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoFecha.label', default: 'TipoFecha')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoFecha" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoFecha" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoFecha">
			
				<g:if test="${tipoFechaInstance?.tipoFecha}">
				<li class="fieldcontain">
					<span id="tipoFecha-label" class="property-label"><g:message code="tipoFecha.tipoFecha.label" default="Tipo Fecha" /></span>
					
						<span class="property-value" aria-labelledby="tipoFecha-label"><g:fieldValue bean="${tipoFechaInstance}" field="tipoFecha"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoFechaInstance?.ordenCronologico}">
				<li class="fieldcontain">
					<span id="ordenCronologico-label" class="property-label"><g:message code="tipoFecha.ordenCronologico.label" default="Orden Cronologico" /></span>
					
						<span class="property-value" aria-labelledby="ordenCronologico-label"><g:fieldValue bean="${tipoFechaInstance}" field="ordenCronologico"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoFechaInstance?.tipoUso}">
				<li class="fieldcontain">
					<span id="tipoUso-label" class="property-label"><g:message code="tipoFecha.tipoUso.label" default="Tipo Uso" /></span>
					
						<span class="property-value" aria-labelledby="tipoUso-label"><g:fieldValue bean="${tipoFechaInstance}" field="tipoUso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoFechaInstance?.fechas}">
				<li class="fieldcontain">
					<span id="fechas-label" class="property-label"><g:message code="tipoFecha.fechas.label" default="Fechas" /></span>
					
						<g:each in="${tipoFechaInstance.fechas}" var="f">
						<span class="property-value" aria-labelledby="fechas-label"><g:link controller="detalleFecha" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoFechaInstance?.id}" />
					<g:link class="edit" action="edit" id="${tipoFechaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
