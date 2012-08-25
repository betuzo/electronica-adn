
<%@ page import="mx.com.ideasydiseno.electronica.TelefonoPersona" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoPersona.label', default: 'TelefonoPersona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-telefonoPersona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-telefonoPersona" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list telefonoPersona">
			
				<g:if test="${telefonoPersonaInstance?.tipoTelefono}">
				<li class="fieldcontain">
					<span id="tipoTelefono-label" class="property-label"><g:message code="telefonoPersona.tipoTelefono.label" default="Tipo Telefono" /></span>
					
						<span class="property-value" aria-labelledby="tipoTelefono-label"><g:fieldValue bean="${telefonoPersonaInstance}" field="tipoTelefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoPersonaInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="telefonoPersona.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${telefonoPersonaInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoPersonaInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="telefonoPersona.persona.label" default="Persona" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="persona" action="show" id="${telefonoPersonaInstance?.persona?.id}">${telefonoPersonaInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${telefonoPersonaInstance?.id}" />
					<g:link class="edit" action="edit" id="${telefonoPersonaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
