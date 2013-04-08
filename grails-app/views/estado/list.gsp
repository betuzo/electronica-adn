
<%@ page import="mx.com.ideasydiseno.electronica.Estado" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-estado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-estado" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'estado.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="abreviatura" title="${message(code: 'estado.abreviatura.label', default: 'Abreviatura')}" />
					
						<th><g:message code="estado.pais.label" default="Pais" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${estadoInstanceList}" status="i" var="estadoInstance">
					<tr>
					
						<td><g:link action="show" id="${estadoInstance.id}">${fieldValue(bean: estadoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: estadoInstance, field: "abreviatura")}</td>
					
						<td>${fieldValue(bean: estadoInstance, field: "pais")}</td>
					
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
