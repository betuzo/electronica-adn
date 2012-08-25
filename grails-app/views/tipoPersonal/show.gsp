
<%@ page import="mx.com.ideasydiseno.electronica.TipoPersonal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoPersonal.label', default: 'TipoPersonal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoPersonal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoPersonal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoPersonal">
			
				<g:if test="${tipoPersonalInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="tipoPersonal.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${tipoPersonalInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPersonalInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="tipoPersonal.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tipoPersonalInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPersonalInstance?.personal}">
				<li class="fieldcontain">
					<span id="personal-label" class="property-label"><g:message code="tipoPersonal.personal.label" default="Personal" /></span>
					
						<g:each in="${tipoPersonalInstance.personal}" var="p">
						<span class="property-value" aria-labelledby="personal-label"><g:link controller="personal" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoPersonalInstance?.id}" />
					<g:link class="edit" action="edit" id="${tipoPersonalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
