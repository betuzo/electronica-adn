
<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entrada" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr >

						<th><g:message code="entrada.proveedor.label" default="Proveedor" /></th>

						<th><g:message code="entrada.sucursal.label" default="Sucursal" /></th>

						<g:sortableColumn property="total" title="${message(code: 'entrada.total.label', default: 'Total')}" />

						<g:sortableColumn property="status" title="${message(code: 'entrada.status.label', default: 'Status')}" />

						<g:sortableColumn property="observaciones" title="${message(code: 'entrada.observaciones.label', default: 'Observaciones')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${entradaInstanceList}" status="i" var="entradaInstance">
					<tr class="${(fieldValue(bean: entradaInstance, field: 'status')) == 'Abierto' ? 'ordenOpen' : 'ordenClose'}">

						<td><g:link action="show" id="${entradaInstance.id}">${fieldValue(bean: entradaInstance, field: "proveedor")}</g:link></td>

						<td>${fieldValue(bean: entradaInstance, field: "sucursal")}</td>

						<td>${fieldValue(bean: entradaInstance, field: "totalAdeudo")}</td>

						<td>${fieldValue(bean: entradaInstance, field: "status")}</td>

						<td>${fieldValue(bean: entradaInstance, field: "observaciones")}</td>

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
