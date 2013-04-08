
<%@ page import="mx.com.ideasydiseno.electronica.PagoCliente" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagoCliente.label', default: 'PagoCliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-pagoCliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pagoCliente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<g:sortableColumn property="tipoPago" title="${message(code: 'pagoCliente.tipoPago.label', default: 'Tipo Pago')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'pagoCliente.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="fechaPago" title="${message(code: 'pagoCliente.fechaPago.label', default: 'Fecha Pago')}" />
					
						<th><g:message code="pagoCliente.recibio.label" default="Recibio" /></th>
					
						<th><g:message code="pagoCliente.orden.label" default="Orden" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagoClienteInstanceList}" status="i" var="pagoClienteInstance">
					<tr>
					
						<td><g:link action="show" id="${pagoClienteInstance.id}">${fieldValue(bean: pagoClienteInstance, field: "tipoPago")}</g:link></td>
					
						<td>${fieldValue(bean: pagoClienteInstance, field: "total")}</td>
					
						<td><g:formatDate date="${pagoClienteInstance.fechaPago}" /></td>
					
						<td>${fieldValue(bean: pagoClienteInstance, field: "recibio")}</td>
					
						<td>${fieldValue(bean: pagoClienteInstance, field: "orden")}</td>
					
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
