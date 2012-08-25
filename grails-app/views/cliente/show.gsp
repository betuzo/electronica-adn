
<%@ page import="mx.com.ideasydiseno.electronica.Cliente" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cliente">
			
				<g:if test="${clienteInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="cliente.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${clienteInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="cliente.apellidoPaterno.label" default="Apellido Paterno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${clienteInstance}" field="apellidoPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="cliente.apellidoMaterno.label" default="Apellido Materno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${clienteInstance}" field="apellidoMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="cliente.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${clienteInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="cliente.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${clienteInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="cliente.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${clienteInstance}" field="calle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.colonia}">
				<li class="fieldcontain">
					<span id="colonia-label" class="property-label"><g:message code="cliente.colonia.label" default="Colonia" /></span>
					
						<span class="property-value" aria-labelledby="colonia-label"><g:link controller="colonia" action="show" id="${clienteInstance?.colonia?.id}">${clienteInstance?.colonia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="cliente.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${clienteInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.noExt}">
				<li class="fieldcontain">
					<span id="noExt-label" class="property-label"><g:message code="cliente.noExt.label" default="No Ext" /></span>
					
						<span class="property-value" aria-labelledby="noExt-label"><g:fieldValue bean="${clienteInstance}" field="noExt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.noInt}">
				<li class="fieldcontain">
					<span id="noInt-label" class="property-label"><g:message code="cliente.noInt.label" default="No Int" /></span>
					
						<span class="property-value" aria-labelledby="noInt-label"><g:fieldValue bean="${clienteInstance}" field="noInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.rfc}">
				<li class="fieldcontain">
					<span id="rfc-label" class="property-label"><g:message code="cliente.rfc.label" default="Rfc" /></span>
					
						<span class="property-value" aria-labelledby="rfc-label"><g:fieldValue bean="${clienteInstance}" field="rfc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="cliente.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clienteInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="cliente.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${clienteInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoPersona" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clienteInstance?.id}" />
					<g:link class="edit" action="edit" id="${clienteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
