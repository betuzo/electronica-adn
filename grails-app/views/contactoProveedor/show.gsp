
<%@ page import="mx.com.ideasydiseno.electronica.ContactoProveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contactoProveedor.label', default: 'ContactoProveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contactoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contactoProveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contactoProveedor">

				<g:if test="${contactoProveedorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="contactoProveedor.nombre.label" default="Nombre" /></span>

						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${contactoProveedorInstance}" field="nombre"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="contactoProveedor.apellidoPaterno.label" default="Apellido Paterno" /></span>

						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${contactoProveedorInstance}" field="apellidoPaterno"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="contactoProveedor.apellidoMaterno.label" default="Apellido Materno" /></span>

						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${contactoProveedorInstance}" field="apellidoMaterno"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="contactoProveedor.sexo.label" default="Sexo" /></span>

						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${contactoProveedorInstance}" field="sexo"/></span>

				</li>
				</g:if>


				<g:if test="${contactoProveedorInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="contactoProveedor.calle.label" default="Calle" /></span>

						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${contactoProveedorInstance}" field="calle"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.colonia}">
				<li class="fieldcontain">
					<span id="colonia-label" class="property-label"><g:message code="contactoProveedor.colonia.label" default="Colonia" /></span>

						<span class="property-value" aria-labelledby="colonia-label"><g:link controller="colonia" action="show" id="${contactoProveedorInstance?.colonia?.id}">${contactoProveedorInstance?.colonia?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="contactoProveedor.codigoPostal.label" default="Codigo Postal" /></span>

						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${contactoProveedorInstance}" field="codigoPostal"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.noExt}">
				<li class="fieldcontain">
					<span id="noExt-label" class="property-label"><g:message code="contactoProveedor.noExt.label" default="No Ext" /></span>

						<span class="property-value" aria-labelledby="noExt-label"><g:fieldValue bean="${contactoProveedorInstance}" field="noExt"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.noInt}">
				<li class="fieldcontain">
					<span id="noInt-label" class="property-label"><g:message code="contactoProveedor.noInt.label" default="No Int" /></span>

						<span class="property-value" aria-labelledby="noInt-label"><g:fieldValue bean="${contactoProveedorInstance}" field="noInt"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.rfc}">
				<li class="fieldcontain">
					<span id="rfc-label" class="property-label"><g:message code="contactoProveedor.rfc.label" default="Rfc" /></span>

						<span class="property-value" aria-labelledby="rfc-label"><g:fieldValue bean="${contactoProveedorInstance}" field="rfc"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="contactoProveedor.email.label" default="Email" /></span>

						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${contactoProveedorInstance}" field="email"/></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="contactoProveedor.proveedor.label" default="Proveedor" /></span>

						<span class="property-value" aria-labelledby="proveedor-label"><g:link controller="proveedor" action="show" id="${contactoProveedorInstance?.proveedor?.id}">${contactoProveedorInstance?.proveedor?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${contactoProveedorInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="contactoProveedor.telefonos.label" default="Telefonos" /></span>

						<g:each in="${contactoProveedorInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoPersona" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contactoProveedorInstance?.id}" />
					<g:link class="edit" action="edit" id="${contactoProveedorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
