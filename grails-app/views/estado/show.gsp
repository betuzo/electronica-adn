
<%@ page import="mx.com.ideasydiseno.electronica.Estado" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-estado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-estado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list estado">
			
				<g:if test="${estadoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="estado.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${estadoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estadoInstance?.abreviatura}">
				<li class="fieldcontain">
					<span id="abreviatura-label" class="property-label"><g:message code="estado.abreviatura.label" default="Abreviatura" /></span>
					
						<span class="property-value" aria-labelledby="abreviatura-label"><g:fieldValue bean="${estadoInstance}" field="abreviatura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${estadoInstance?.municipios}">
				<li class="fieldcontain">
					<span id="municipios-label" class="property-label"><g:message code="estado.municipios.label" default="Municipios" /></span>
					
						<g:each in="${estadoInstance.municipios}" var="m">
						<span class="property-value" aria-labelledby="municipios-label"><g:link controller="municipio" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${estadoInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="estado.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${estadoInstance?.pais?.id}">${estadoInstance?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${estadoInstance?.id}" />
					<g:link class="edit" action="edit" id="${estadoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
