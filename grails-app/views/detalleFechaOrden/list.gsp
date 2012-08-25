
<%@ page import="mx.com.ideasydiseno.electronica.DetalleFechaOrden" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleFechaOrden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleFechaOrden" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="detalleFechaOrden.tipoFecha.label" default="Tipo Fecha" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'detalleFechaOrden.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="detalleFechaOrden.personal.label" default="Personal" /></th>
					
						<th><g:message code="detalleFechaOrden.orden.label" default="Orden" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleFechaOrdenInstanceList}" status="i" var="detalleFechaOrdenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleFechaOrdenInstance.id}">${fieldValue(bean: detalleFechaOrdenInstance, field: "tipoFecha")}</g:link></td>
					
						<td><g:formatDate date="${detalleFechaOrdenInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: detalleFechaOrdenInstance, field: "personal")}</td>
					
						<td>${fieldValue(bean: detalleFechaOrdenInstance, field: "orden")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleFechaOrdenInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
