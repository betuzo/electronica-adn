
<%@ page import="mx.com.ideasydiseno.electronica.RefaccionAlmacen" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-refaccionAlmacen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-refaccionAlmacen" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<th><g:message code="refaccionAlmacen.refaccion.label" default="Refaccion" /></th>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'refaccionAlmacen.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="precio" title="${message(code: 'refaccionAlmacen.precio.label', default: 'Precio')}" />
					
						<th><g:message code="refaccionAlmacen.almacen.label" default="Almacen" /></th>
					
						<th><g:message code="refaccionAlmacen.entrada.label" default="Entrada" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${refaccionAlmacenInstanceList}" status="i" var="refaccionAlmacenInstance">
					<tr>
					
						<td><g:link action="show" id="${refaccionAlmacenInstance.id}">${fieldValue(bean: refaccionAlmacenInstance, field: "refaccion")}</g:link></td>
					
						<td>${fieldValue(bean: refaccionAlmacenInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: refaccionAlmacenInstance, field: "precio")}</td>
					
						<td>${fieldValue(bean: refaccionAlmacenInstance, field: "almacen")}</td>
					
						<td>${fieldValue(bean: refaccionAlmacenInstance, field: "entrada")}</td>
					
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
