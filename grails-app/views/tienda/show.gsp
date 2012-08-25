
<%@ page import="mx.com.ideasydiseno.electronica.Tienda" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tienda.label', default: 'Tienda')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tienda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tienda" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tienda">
			
				<g:if test="${tiendaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="tienda.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tiendaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="tienda.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${tiendaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="tienda.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${tiendaInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="tienda.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${tiendaInstance}" field="calle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.colonia}">
				<li class="fieldcontain">
					<span id="colonia-label" class="property-label"><g:message code="tienda.colonia.label" default="Colonia" /></span>
					
						<span class="property-value" aria-labelledby="colonia-label"><g:link controller="colonia" action="show" id="${tiendaInstance?.colonia?.id}">${tiendaInstance?.colonia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="tienda.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${tiendaInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.noExt}">
				<li class="fieldcontain">
					<span id="noExt-label" class="property-label"><g:message code="tienda.noExt.label" default="No Ext" /></span>
					
						<span class="property-value" aria-labelledby="noExt-label"><g:fieldValue bean="${tiendaInstance}" field="noExt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.noInt}">
				<li class="fieldcontain">
					<span id="noInt-label" class="property-label"><g:message code="tienda.noInt.label" default="No Int" /></span>
					
						<span class="property-value" aria-labelledby="noInt-label"><g:fieldValue bean="${tiendaInstance}" field="noInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.referencias}">
				<li class="fieldcontain">
					<span id="referencias-label" class="property-label"><g:message code="tienda.referencias.label" default="Referencias" /></span>
					
						<span class="property-value" aria-labelledby="referencias-label"><g:fieldValue bean="${tiendaInstance}" field="referencias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="tienda.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${tiendaInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tiendaInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="tienda.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${tiendaInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoInstitucion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tiendaInstance?.id}" />
					<g:link class="edit" action="edit" id="${tiendaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
