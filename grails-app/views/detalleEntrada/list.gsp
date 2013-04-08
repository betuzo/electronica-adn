
<%@ page import="mx.com.ideasydiseno.electronica.DetalleEntrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleEntrada.label', default: 'DetalleEntrada')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-detalleEntrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleEntrada" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<th><g:message code="detalleEntrada.entrada.label" default="Entrada" /></th>
					
						<th><g:message code="detalleEntrada.refaccion.label" default="Refaccion" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'detalleEntrada.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="precioUnitario" title="${message(code: 'detalleEntrada.precioUnitario.label', default: 'Precio Unitario')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'detalleEntrada.total.label', default: 'Total')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleEntradaInstanceList}" status="i" var="detalleEntradaInstance">
					<tr>
					
						<td><g:link action="show" id="${detalleEntradaInstance.id}">${fieldValue(bean: detalleEntradaInstance, field: "entrada")}</g:link></td>
					
						<td>${fieldValue(bean: detalleEntradaInstance, field: "refaccion")}</td>
					
						<td>${fieldValue(bean: detalleEntradaInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: detalleEntradaInstance, field: "precioUnitario")}</td>
					
						<td>${fieldValue(bean: detalleEntradaInstance, field: "total")}</td>
					
					</tr>
				</g:each>
				</tbody>
				<tfoot class="nav">
					<tr>
						<td colspan=7>
							<div class="pagination"></div>
							<div class="paginationTitle">Page</div>
							<div class="selectPerPage"></div>
							<div class="status"> </div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</body>
</html>
