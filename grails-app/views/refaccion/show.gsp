
<%@ page import="mx.com.ideasydiseno.electronica.Refaccion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'refaccion.label', default: 'Refaccion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-refaccion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-refaccion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list refaccion">
			
				<g:if test="${refaccionInstance?.clave}">
				<li class="fieldcontain">
					<span id="clave-label" class="property-label"><g:message code="refaccion.clave.label" default="Clave" /></span>
					
						<span class="property-value" aria-labelledby="clave-label"><g:fieldValue bean="${refaccionInstance}" field="clave"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="refaccion.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${refaccionInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionInstance?.compras}">
				<li class="fieldcontain">
					<span id="compras-label" class="property-label"><g:message code="refaccion.compras.label" default="Compras" /></span>
					
						<g:each in="${refaccionInstance.compras}" var="c">
						<span class="property-value" aria-labelledby="compras-label"><g:link controller="detalleEntrada" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionInstance?.lotesAlmacen}">
				<li class="fieldcontain">
					<span id="lotesAlmacen-label" class="property-label"><g:message code="refaccion.lotesAlmacen.label" default="Lotes Almacen" /></span>
					
						<g:each in="${refaccionInstance.lotesAlmacen}" var="l">
						<span class="property-value" aria-labelledby="lotesAlmacen-label"><g:link controller="refaccionAlmacen" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionInstance?.ordenes}">
				<li class="fieldcontain">
					<span id="ordenes-label" class="property-label"><g:message code="refaccion.ordenes.label" default="Ordenes" /></span>
					
						<g:each in="${refaccionInstance.ordenes}" var="o">
						<span class="property-value" aria-labelledby="ordenes-label"><g:link controller="detalleOrden" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${refaccionInstance?.id}" />
					<g:link class="edit" action="edit" id="${refaccionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
