
<%@ page import="mx.com.ideasydiseno.electronica.RefaccionAlmacen" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-refaccionAlmacen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-refaccionAlmacen" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list refaccionAlmacen">
			
				<g:if test="${refaccionAlmacenInstance?.refaccion}">
				<li class="fieldcontain">
					<span id="refaccion-label" class="property-label"><g:message code="refaccionAlmacen.refaccion.label" default="Refaccion" /></span>
					
						<span class="property-value" aria-labelledby="refaccion-label"><g:link controller="refaccion" action="show" id="${refaccionAlmacenInstance?.refaccion?.id}">${refaccionAlmacenInstance?.refaccion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionAlmacenInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="refaccionAlmacen.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${refaccionAlmacenInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionAlmacenInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="refaccionAlmacen.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${refaccionAlmacenInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionAlmacenInstance?.almacen}">
				<li class="fieldcontain">
					<span id="almacen-label" class="property-label"><g:message code="refaccionAlmacen.almacen.label" default="Almacen" /></span>
					
						<span class="property-value" aria-labelledby="almacen-label"><g:link controller="almacen" action="show" id="${refaccionAlmacenInstance?.almacen?.id}">${refaccionAlmacenInstance?.almacen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionAlmacenInstance?.entrada}">
				<li class="fieldcontain">
					<span id="entrada-label" class="property-label"><g:message code="refaccionAlmacen.entrada.label" default="Entrada" /></span>
					
						<span class="property-value" aria-labelledby="entrada-label"><g:link controller="detalleEntrada" action="show" id="${refaccionAlmacenInstance?.entrada?.id}">${refaccionAlmacenInstance?.entrada?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${refaccionAlmacenInstance?.salidas}">
				<li class="fieldcontain">
					<span id="salidas-label" class="property-label"><g:message code="refaccionAlmacen.salidas.label" default="Salidas" /></span>
					
						<g:each in="${refaccionAlmacenInstance.salidas}" var="s">
						<span class="property-value" aria-labelledby="salidas-label"><g:link controller="detalleOrden" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${refaccionAlmacenInstance?.id}" />
					<g:link class="edit" action="edit" id="${refaccionAlmacenInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
