
<%@ page import="mx.com.ideasydiseno.electronica.TelefonoInstitucion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-telefonoInstitucion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-telefonoInstitucion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list telefonoInstitucion">
			
				<g:if test="${telefonoInstitucionInstance?.tipoTelefono}">
				<li class="fieldcontain">
					<span id="tipoTelefono-label" class="property-label"><g:message code="telefonoInstitucion.tipoTelefono.label" default="Tipo Telefono" /></span>
					
						<span class="property-value" aria-labelledby="tipoTelefono-label"><g:fieldValue bean="${telefonoInstitucionInstance}" field="tipoTelefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoInstitucionInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="telefonoInstitucion.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${telefonoInstitucionInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoInstitucionInstance?.institucion}">
				<li class="fieldcontain">
					<span id="institucion-label" class="property-label"><g:message code="telefonoInstitucion.institucion.label" default="Institucion" /></span>
					
						<span class="property-value" aria-labelledby="institucion-label"><g:link controller="sucursal" action="show" id="${telefonoInstitucionInstance?.institucion?.id}">${telefonoInstitucionInstance?.institucion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${telefonoInstitucionInstance?.id}" />
					<g:link class="edit" action="edit" id="${telefonoInstitucionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
