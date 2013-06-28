
<%@ page import="mx.com.ideasydiseno.electronica.Personal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personal.label', default: 'Personal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-personal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-personal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list personal">

				<g:if test="${personalInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="personal.nombre.label" default="Nombre" /></span>

						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personalInstance}" field="nombre"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="personal.apellidoPaterno.label" default="Apellido Paterno" /></span>

						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${personalInstance}" field="apellidoPaterno"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="personal.apellidoMaterno.label" default="Apellido Materno" /></span>

						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${personalInstance}" field="apellidoMaterno"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="personal.sexo.label" default="Sexo" /></span>

						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${personalInstance}" field="sexo"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="personal.fechaRegistro.label" default="Fecha Registro" /></span>

						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${personalInstance?.fechaRegistro}"  formatName="customDateFormat" /></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="personal.calle.label" default="Calle" /></span>

						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${personalInstance}" field="calle"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.colonia}">
				<li class="fieldcontain">
					<span id="colonia-label" class="property-label"><g:message code="personal.colonia.label" default="Colonia" /></span>

						<span class="property-value" aria-labelledby="colonia-label"><g:link controller="colonia" action="show" id="${personalInstance?.colonia?.id}">${personalInstance?.colonia?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="personal.codigoPostal.label" default="Codigo Postal" /></span>

						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${personalInstance}" field="codigoPostal"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.noExt}">
				<li class="fieldcontain">
					<span id="noExt-label" class="property-label"><g:message code="personal.noExt.label" default="No Ext" /></span>

						<span class="property-value" aria-labelledby="noExt-label"><g:fieldValue bean="${personalInstance}" field="noExt"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.noInt}">
				<li class="fieldcontain">
					<span id="noInt-label" class="property-label"><g:message code="personal.noInt.label" default="No Int" /></span>

						<span class="property-value" aria-labelledby="noInt-label"><g:fieldValue bean="${personalInstance}" field="noInt"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.rfc}">
				<li class="fieldcontain">
					<span id="rfc-label" class="property-label"><g:message code="personal.rfc.label" default="Rfc" /></span>

						<span class="property-value" aria-labelledby="rfc-label"><g:fieldValue bean="${personalInstance}" field="rfc"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="personal.email.label" default="Email" /></span>

						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personalInstance}" field="email"/></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="personal.username.label" default="Username" /></span>

						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${personalInstance}" field="username"/></span>

				</li>
				</g:if>


				<g:if test="${personalInstance?.tipoPersonal}">
				<li class="fieldcontain">
					<span id="tipoPersonal-label" class="property-label"><g:message code="personal.tipoPersonal.label" default="Tipo Personal" /></span>

						<span class="property-value" aria-labelledby="tipoPersonal-label"><g:link controller="tipoPersonal" action="show" id="${personalInstance?.tipoPersonal?.id}">${personalInstance?.tipoPersonal?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.sucursal}">
				<li class="fieldcontain">
					<span id="sucursal-label" class="property-label"><g:message code="personal.sucursal.label" default="Sucursal" /></span>

						<span class="property-value" aria-labelledby="sucursal-label"><g:link controller="sucursal" action="show" id="${personalInstance?.sucursal?.id}">${personalInstance?.sucursal?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="personal.accountExpired.label" default="Account Expired" /></span>

						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${personalInstance?.accountExpired}" /></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="personal.accountLocked.label" default="Account Locked" /></span>

						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${personalInstance?.accountLocked}" /></span>

				</li>
				</g:if>



				<g:if test="${personalInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="personal.enabled.label" default="Enabled" /></span>

						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${personalInstance?.enabled}" /></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.ordenes}">
				<li class="fieldcontain">
					<span id="ordenes-label" class="property-label"><g:message code="personal.ordenes.label" default="Ordenes" /></span>

						<g:each in="${personalInstance.ordenes}" var="o">
						<span class="property-value" aria-labelledby="ordenes-label"><g:link controller="detalleFechaOrden" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${personalInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="personal.passwordExpired.label" default="Password Expired" /></span>

						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${personalInstance?.passwordExpired}" /></span>

				</li>
				</g:if>

				<g:if test="${personalInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="personal.telefonos.label" default="Telefonos" /></span>

						<g:each in="${personalInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoPersona" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${personalInstance?.compras}">
				<li class="fieldcontain">
					<span id="compras-label" class="property-label"><g:message code="personal.compras.label" default="Compras" /></span>

						<g:each in="${personalInstance.compras}" var="c">
						<span class="property-value" aria-labelledby="compras-label"><g:link controller="detalleFechaEntrada" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personalInstance?.id}" />
					<g:link class="edit" action="edit" id="${personalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
