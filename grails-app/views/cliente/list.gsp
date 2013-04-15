
<%@ page import="mx.com.ideasydiseno.electronica.Cliente" %>
<!doctype html>
<html>
	
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript src='gridjTPS.js'/>
	</head>
	<body>
		<a href="#list-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cliente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="tableGrid">
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'cliente.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'cliente.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'cliente.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'cliente.sexo.label', default: 'Sexo')}" />
					
						<g:sortableColumn property="fechaRegistro" title="${message(code: 'cliente.fechaRegistro.label', default: 'Fecha Registro')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'cliente.calle.label', default: 'Calle')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
					<tr>
					
						<td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "apellidoMaterno")}</td>
					
						<td>${fieldValue(bean: clienteInstance, field: "sexo")}</td>
					
						<td><g:formatDate date="${clienteInstance.fechaRegistro}"  formatName="customDateFormat" /></td>
					
						<td>${fieldValue(bean: clienteInstance, field: "calle")}</td>
					
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
