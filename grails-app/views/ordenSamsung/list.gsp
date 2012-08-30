
<%@ page import="mx.com.ideasydiseno.electronica.OrdenSamsung" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordenSamsung.label', default: 'OrdenSamsung')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ordenSamsung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ordenSamsung" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="ordenSamsung.cliente.label" default="Cliente" /></th>
					
						<th><g:message code="ordenSamsung.sucursal.label" default="Sucursal" /></th>
					
						<th><g:message code="ordenSamsung.marca.label" default="Marca" /></th>
					
						<th><g:message code="ordenSamsung.modelo.label" default="Modelo" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'ordenSamsung.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="noSerie" title="${message(code: 'ordenSamsung.noSerie.label', default: 'No Serie')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ordenSamsungInstanceList}" status="i" var="ordenSamsungInstance">
					<tr class="${(fieldValue(bean: ordenSamsungInstance, field: 'status')) == 'Abierto' ? 'ordenOpen' : 'ordenClose'}">
					
						<td><g:link action="show" id="${ordenSamsungInstance.id}">${fieldValue(bean: ordenSamsungInstance, field: "cliente")}</g:link></td>
					
						<td>${fieldValue(bean: ordenSamsungInstance, field: "sucursal")}</td>
					
						<td>${fieldValue(bean: ordenSamsungInstance, field: "marca")}</td>
					
						<td>${fieldValue(bean: ordenSamsungInstance, field: "modelo")}</td>
					
						<td>${fieldValue(bean: ordenSamsungInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: ordenSamsungInstance, field: "noSerie")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ordenSamsungInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
