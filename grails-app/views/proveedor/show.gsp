
<%@ page import="mx.com.ideasydiseno.electronica.Proveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proveedor">
			
				<g:if test="${proveedorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="proveedor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${proveedorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="proveedor.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${proveedorInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="proveedor.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${proveedorInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="proveedor.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${proveedorInstance}" field="calle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.colonia}">
				<li class="fieldcontain">
					<span id="colonia-label" class="property-label"><g:message code="proveedor.colonia.label" default="Colonia" /></span>
					
						<span class="property-value" aria-labelledby="colonia-label"><g:link controller="colonia" action="show" id="${proveedorInstance?.colonia?.id}">${proveedorInstance?.colonia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="proveedor.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${proveedorInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.noExt}">
				<li class="fieldcontain">
					<span id="noExt-label" class="property-label"><g:message code="proveedor.noExt.label" default="No Ext" /></span>
					
						<span class="property-value" aria-labelledby="noExt-label"><g:fieldValue bean="${proveedorInstance}" field="noExt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.noInt}">
				<li class="fieldcontain">
					<span id="noInt-label" class="property-label"><g:message code="proveedor.noInt.label" default="No Int" /></span>
					
						<span class="property-value" aria-labelledby="noInt-label"><g:fieldValue bean="${proveedorInstance}" field="noInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.referencias}">
				<li class="fieldcontain">
					<span id="referencias-label" class="property-label"><g:message code="proveedor.referencias.label" default="Referencias" /></span>
					
						<span class="property-value" aria-labelledby="referencias-label"><g:fieldValue bean="${proveedorInstance}" field="referencias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="proveedor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${proveedorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.contactos}">
				<li class="fieldcontain">
					<span id="contactos-label" class="property-label"><g:message code="proveedor.contactos.label" default="Contactos" /></span>
					
						<g:each in="${proveedorInstance.contactos}" var="c">
						<span class="property-value" aria-labelledby="contactos-label"><g:link controller="contactoProveedor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.entradas}">
				<li class="fieldcontain">
					<span id="entradas-label" class="property-label"><g:message code="proveedor.entradas.label" default="Entradas" /></span>
					
						<g:each in="${proveedorInstance.entradas}" var="e">
						<span class="property-value" aria-labelledby="entradas-label"><g:link controller="entrada" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${proveedorInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="proveedor.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${proveedorInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoInstitucion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${proveedorInstance?.id}" />
					<g:link class="edit" action="edit" id="${proveedorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
