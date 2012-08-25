
<%@ page import="mx.com.ideasydiseno.electronica.PagoProveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagoProveedor.label', default: 'PagoProveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pagoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pagoProveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipoPago" title="${message(code: 'pagoProveedor.tipoPago.label', default: 'Tipo Pago')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'pagoProveedor.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="fechaPago" title="${message(code: 'pagoProveedor.fechaPago.label', default: 'Fecha Pago')}" />
					
						<th><g:message code="pagoProveedor.realizo.label" default="Realizo" /></th>
					
						<th><g:message code="pagoProveedor.entrada.label" default="Entrada" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagoProveedorInstanceList}" status="i" var="pagoProveedorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pagoProveedorInstance.id}">${fieldValue(bean: pagoProveedorInstance, field: "tipoPago")}</g:link></td>
					
						<td>${fieldValue(bean: pagoProveedorInstance, field: "total")}</td>
					
						<td><g:formatDate date="${pagoProveedorInstance.fechaPago}" /></td>
					
						<td>${fieldValue(bean: pagoProveedorInstance, field: "realizo")}</td>
					
						<td>${fieldValue(bean: pagoProveedorInstance, field: "entrada")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagoProveedorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
