
<%@ page import="mx.com.ideasydiseno.electronica.Orden" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orden.label', default: 'Orden')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-orden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-orden" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<th><g:message code="orden.cliente.label" default="Cliente" /></th>
					
						<th><g:message code="orden.sucursal.label" default="Sucursal" /></th>
					
						<th><g:message code="orden.marca.label" default="Marca" /></th>
					
						<th><g:message code="orden.modelo.label" default="Modelo" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'orden.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="noSerie" title="${message(code: 'orden.noSerie.label', default: 'No Serie')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ordenInstanceList}" status="i" var="ordenInstance">
					<tr>
					
						<td><g:link action="show" id="${ordenInstance.id}">${fieldValue(bean: ordenInstance, field: "cliente")}</g:link></td>
					
						<td>${fieldValue(bean: ordenInstance, field: "sucursal")}</td>
					
						<td>${fieldValue(bean: ordenInstance, field: "marca")}</td>
					
						<td>${fieldValue(bean: ordenInstance, field: "modelo")}</td>
					
						<td>${fieldValue(bean: ordenInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: ordenInstance, field: "noSerie")}</td>
					
					</tr>
				</g:each>
				</tbody>
				<tfoot class="navGrid">
					<tr>
						<td colspan=7>
							<div class="pagination"></div>
							<div class="paginationTitle">Pag </div>
							<div class="selectPerPage"></div>
							<div class="status"> </div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</body>
</html>
