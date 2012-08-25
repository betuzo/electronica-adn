
<%@ page import="mx.com.ideasydiseno.electronica.Falla" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'falla.label', default: 'Falla')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-falla" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-falla" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list falla">
			
				<g:if test="${fallaInstance?.tipoFalla}">
				<li class="fieldcontain">
					<span id="tipoFalla-label" class="property-label"><g:message code="falla.tipoFalla.label" default="Tipo Falla" /></span>
					
						<span class="property-value" aria-labelledby="tipoFalla-label"><g:link controller="tipoFalla" action="show" id="${fallaInstance?.tipoFalla?.id}">${fallaInstance?.tipoFalla?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fallaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="falla.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${fallaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fallaInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="falla.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="orden" action="show" id="${fallaInstance?.orden?.id}">${fallaInstance?.orden?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fallaInstance?.id}" />
					<g:link class="edit" action="edit" id="${fallaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
