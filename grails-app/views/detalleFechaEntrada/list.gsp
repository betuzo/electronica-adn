
<%@ page import="mx.com.ideasydiseno.electronica.DetalleFechaEntrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detalleFechaEntrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleFechaEntrada" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="detalleFechaEntrada.tipoFecha.label" default="Tipo Fecha" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'detalleFechaEntrada.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="detalleFechaEntrada.personal.label" default="Personal" /></th>
					
						<th><g:message code="detalleFechaEntrada.entrada.label" default="Entrada" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleFechaEntradaInstanceList}" status="i" var="detalleFechaEntradaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detalleFechaEntradaInstance.id}">${fieldValue(bean: detalleFechaEntradaInstance, field: "tipoFecha")}</g:link></td>
					
						<td><g:formatDate date="${detalleFechaEntradaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: detalleFechaEntradaInstance, field: "personal")}</td>
					
						<td>${fieldValue(bean: detalleFechaEntradaInstance, field: "entrada")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detalleFechaEntradaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
