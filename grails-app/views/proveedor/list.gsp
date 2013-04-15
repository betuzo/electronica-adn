
<%@ page import="mx.com.ideasydiseno.electronica.Proveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-proveedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'proveedor.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'proveedor.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="fechaRegistro" title="${message(code: 'proveedor.fechaRegistro.label', default: 'Fecha Registro')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'proveedor.calle.label', default: 'Calle')}" />
					
						<th><g:message code="proveedor.colonia.label" default="Colonia" /></th>
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'proveedor.codigoPostal.label', default: 'Codigo Postal')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proveedorInstanceList}" status="i" var="proveedorInstance">
					<tr>
						<td><g:link action="show" id="${proveedorInstance.id}"> ${fieldValue(bean: proveedorInstance, field: "nombre")}</g:link></td>
						<td>${fieldValue(bean: proveedorInstance, field: "descripcion")}</td>
					
						<td><g:formatDate date="${proveedorInstance.fechaRegistro}"   formatName="customDateFormat"/></td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "calle")}</td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "colonia")}</td>
					
						<td>${fieldValue(bean: proveedorInstance, field: "codigoPostal")}</td>
					
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
