
<%@ page import="mx.com.ideasydiseno.electronica.Tienda" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tienda.label', default: 'Tienda')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-tienda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tienda" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'tienda.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tienda.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="fechaRegistro" title="${message(code: 'tienda.fechaRegistro.label', default: 'Fecha Registro')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'tienda.calle.label', default: 'Calle')}" />
					
						<th><g:message code="tienda.colonia.label" default="Colonia" /></th>
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'tienda.codigoPostal.label', default: 'Codigo Postal')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tiendaInstanceList}" status="i" var="tiendaInstance">
					<tr>
					
						<td><g:link action="show" id="${tiendaInstance.id}">${fieldValue(bean: tiendaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: tiendaInstance, field: "descripcion")}</td>
					
						<td><g:formatDate date="${tiendaInstance.fechaRegistro}" /></td>
					
						<td>${fieldValue(bean: tiendaInstance, field: "calle")}</td>
					
						<td>${fieldValue(bean: tiendaInstance, field: "colonia")}</td>
					
						<td>${fieldValue(bean: tiendaInstance, field: "codigoPostal")}</td>
					
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
