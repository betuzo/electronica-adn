
<%@ page import="mx.com.ideasydiseno.electronica.DetalleOrden" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleOrden.label', default: 'DetalleOrden')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-detalleOrden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleOrden" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<th><g:message code="detalleOrden.refaccion.label" default="Refaccion" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'detalleOrden.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="precio" title="${message(code: 'detalleOrden.precio.label', default: 'Precio')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'detalleOrden.total.label', default: 'Total')}" />
					
						<th><g:message code="detalleOrden.lote.label" default="Lote" /></th>
					
						<th><g:message code="detalleOrden.orden.label" default="Orden" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleOrdenInstanceList}" status="i" var="detalleOrdenInstance">
					<tr>
					
						<td><g:link action="show" id="${detalleOrdenInstance.id}">${fieldValue(bean: detalleOrdenInstance, field: "refaccion")}</g:link></td>
					
						<td>${fieldValue(bean: detalleOrdenInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: detalleOrdenInstance, field: "precio")}</td>
					
						<td>${fieldValue(bean: detalleOrdenInstance, field: "total")}</td>
					
						<td>${fieldValue(bean: detalleOrdenInstance, field: "lote")}</td>
					
						<td>${fieldValue(bean: detalleOrdenInstance, field: "orden")}</td>
					
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
