
<%@ page import="mx.com.ideasydiseno.electronica.DetalleCobro" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleCobro.label', default: 'DetalleCobro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleCobro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleCobro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleCobro">
			
				<g:if test="${detalleCobroInstance?.concepto}">
				<li class="fieldcontain">
					<span id="concepto-label" class="property-label"><g:message code="detalleCobro.concepto.label" default="Concepto" /></span>
					
						<span class="property-value" aria-labelledby="concepto-label"><g:link controller="conceptoCobro" action="show" id="${detalleCobroInstance?.concepto?.id}">${detalleCobroInstance?.concepto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCobroInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="detalleCobro.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${detalleCobroInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCobroInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="detalleCobro.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${detalleCobroInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleCobroInstance?.orden}">
				<li class="fieldcontain">
					<span id="orden-label" class="property-label"><g:message code="detalleCobro.orden.label" default="Orden" /></span>
					
						<span class="property-value" aria-labelledby="orden-label"><g:link controller="orden" action="show" id="${detalleCobroInstance?.orden?.id}">${detalleCobroInstance?.orden?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${detalleCobroInstance?.id}" />
					<g:link class="edit" action="edit" id="${detalleCobroInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
