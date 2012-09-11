
<%@ page import="mx.com.ideasydiseno.electronica.DetalleOrden" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleOrden.label', default: 'DetalleOrden')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleOrden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleOrden" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleOrden">
			
				<g:if test="${detalleOrdenInstance?.refaccion}">
				<li class="fieldcontain">
					<span id="refaccion-label" class="property-label"><g:message code="detalleOrden.refaccion.label" default="Refaccion" /></span>
					
						<span class="property-value" aria-labelledby="refaccion-label"><g:link controller="refaccion" action="show" id="${detalleOrdenInstance?.refaccion?.id}">${detalleOrdenInstance?.refaccion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleOrdenInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="detalleOrden.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${detalleOrdenInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleOrdenInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="detalleOrden.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:formatNumber number="${detalleOrdenInstance.precio}" type="currency" currencyCode="MXN" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleOrdenInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="detalleOrden.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${detalleOrdenInstance.total}" type="currency" currencyCode="MXN" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleOrdenInstance?.lote}">
				<li class="fieldcontain">
					<span id="lote-label" class="property-label"><g:message code="detalleOrden.lote.label" default="Lote" /></span>
					
						<span class="property-value" aria-labelledby="lote-label"><g:link controller="refaccionAlmacen" action="show" id="${detalleOrdenInstance?.lote?.id}">${detalleOrdenInstance?.lote?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleOrdenInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="detalleOrden.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="orden" action="show" id="${detalleOrdenInstance?.orden?.id}">${detalleOrdenInstance?.orden?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${detalleOrdenInstance?.id}" />
					<g:link class="edit" action="edit" id="${detalleOrdenInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
