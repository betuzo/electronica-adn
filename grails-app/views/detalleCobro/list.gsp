
<%@ page import="mx.com.ideasydiseno.electronica.DetalleCobro" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleCobro.label', default: 'DetalleCobro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-detalleCobro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detalleCobro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id=tableGrid>
				<thead>
					<tr>
					
						<th><g:message code="detalleCobro.concepto.label" default="Concepto" /></th>
					
						<g:sortableColumn property="total" title="${message(code: 'detalleCobro.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'detalleCobro.date.label', default: 'Date')}" />
					
						<th><g:message code="detalleCobro.orden.label" default="Orden" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detalleCobroInstanceList}" status="i" var="detalleCobroInstance">
					<tr>
					
						<td><g:link action="show" id="${detalleCobroInstance.id}">${fieldValue(bean: detalleCobroInstance, field: "concepto")}</g:link></td>
					
						<td>${fieldValue(bean: detalleCobroInstance, field: "total")}</td>
					
						<td><g:formatDate date="${detalleCobroInstance.date}" /></td>
					
						<td>${fieldValue(bean: detalleCobroInstance, field: "orden")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
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
		</div>
	</body>
</html>
