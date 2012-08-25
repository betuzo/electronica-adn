
<%@ page import="mx.com.ideasydiseno.electronica.Sucursal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sucursal.label', default: 'Sucursal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sucursal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sucursal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'sucursal.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'sucursal.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="fechaRegistro" title="${message(code: 'sucursal.fechaRegistro.label', default: 'Fecha Registro')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'sucursal.calle.label', default: 'Calle')}" />
					
						<th><g:message code="sucursal.colonia.label" default="Colonia" /></th>
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'sucursal.codigoPostal.label', default: 'Codigo Postal')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sucursalInstanceList}" status="i" var="sucursalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sucursalInstance.id}">${fieldValue(bean: sucursalInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: sucursalInstance, field: "descripcion")}</td>
					
						<td><g:formatDate date="${sucursalInstance.fechaRegistro}" /></td>
					
						<td>${fieldValue(bean: sucursalInstance, field: "calle")}</td>
					
						<td>${fieldValue(bean: sucursalInstance, field: "colonia")}</td>
					
						<td>${fieldValue(bean: sucursalInstance, field: "codigoPostal")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sucursalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
