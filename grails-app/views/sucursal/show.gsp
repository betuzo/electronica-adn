
<%@ page import="mx.com.ideasydiseno.electronica.Sucursal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sucursal.label', default: 'Sucursal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sucursal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sucursal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sucursal">
			
				<g:if test="${sucursalInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="sucursal.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${sucursalInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="sucursal.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${sucursalInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="sucursal.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${sucursalInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="sucursal.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${sucursalInstance}" field="calle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.colonia}">
				<li class="fieldcontain">
					<span id="colonia-label" class="property-label"><g:message code="sucursal.colonia.label" default="Colonia" /></span>
					
						<span class="property-value" aria-labelledby="colonia-label"><g:link controller="colonia" action="show" id="${sucursalInstance?.colonia?.id}">${sucursalInstance?.colonia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="sucursal.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${sucursalInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.noExt}">
				<li class="fieldcontain">
					<span id="noExt-label" class="property-label"><g:message code="sucursal.noExt.label" default="No Ext" /></span>
					
						<span class="property-value" aria-labelledby="noExt-label"><g:fieldValue bean="${sucursalInstance}" field="noExt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.noInt}">
				<li class="fieldcontain">
					<span id="noInt-label" class="property-label"><g:message code="sucursal.noInt.label" default="No Int" /></span>
					
						<span class="property-value" aria-labelledby="noInt-label"><g:fieldValue bean="${sucursalInstance}" field="noInt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.referencias}">
				<li class="fieldcontain">
					<span id="referencias-label" class="property-label"><g:message code="sucursal.referencias.label" default="Referencias" /></span>
					
						<span class="property-value" aria-labelledby="referencias-label"><g:fieldValue bean="${sucursalInstance}" field="referencias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="sucursal.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${sucursalInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.almacen}">
				<li class="fieldcontain">
					<span id="almacen-label" class="property-label"><g:message code="sucursal.almacen.label" default="Almacen" /></span>
					
						<span class="property-value" aria-labelledby="almacen-label"><g:link controller="almacen" action="show" id="${sucursalInstance?.almacen?.id}">${sucursalInstance?.almacen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.entradas}">
				<li class="fieldcontain">
					<span id="entradas-label" class="property-label"><g:message code="sucursal.entradas.label" default="Entradas" /></span>
					
						<g:each in="${sucursalInstance.entradas}" var="e">
						<span class="property-value" aria-labelledby="entradas-label"><g:link controller="entrada" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.ordenes}">
				<li class="fieldcontain">
					<span id="ordenes-label" class="property-label"><g:message code="sucursal.ordenes.label" default="Ordenes" /></span>
					
						<g:each in="${sucursalInstance.ordenes}" var="o">
						<span class="property-value" aria-labelledby="ordenes-label"><g:link controller="orden" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.personal}">
				<li class="fieldcontain">
					<span id="personal-label" class="property-label"><g:message code="sucursal.personal.label" default="Personal" /></span>
					
						<g:each in="${sucursalInstance.personal}" var="p">
						<span class="property-value" aria-labelledby="personal-label"><g:link controller="personal" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${sucursalInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="sucursal.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${sucursalInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoInstitucion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sucursalInstance?.id}" />
					<g:link class="edit" action="edit" id="${sucursalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
