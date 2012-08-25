
<%@ page import="mx.com.ideasydiseno.electronica.TipoFalla" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoFalla.label', default: 'TipoFalla')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoFalla" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoFalla" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoFalla">
			
				<g:if test="${tipoFallaInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="tipoFalla.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${tipoFallaInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoFallaInstance?.fallas}">
				<li class="fieldcontain">
					<span id="fallas-label" class="property-label"><g:message code="tipoFalla.fallas.label" default="Fallas" /></span>
					
						<g:each in="${tipoFallaInstance.fallas}" var="f">
						<span class="property-value" aria-labelledby="fallas-label"><g:link controller="falla" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoFallaInstance?.id}" />
					<g:link class="edit" action="edit" id="${tipoFallaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
