
<%@ page import="mx.com.ideasydiseno.electronica.Personal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personal.label', default: 'Personal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-personal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-personal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'personal.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'personal.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'personal.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'personal.sexo.label', default: 'Sexo')}" />
					
						<g:sortableColumn property="fechaRegistro" title="${message(code: 'personal.fechaRegistro.label', default: 'Fecha Registro')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'personal.calle.label', default: 'Calle')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personalInstanceList}" status="i" var="personalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personalInstance.id}">${fieldValue(bean: personalInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: personalInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: personalInstance, field: "apellidoMaterno")}</td>
					
						<td>${fieldValue(bean: personalInstance, field: "sexo")}</td>
					
						<td><g:formatDate date="${personalInstance.fechaRegistro}" /></td>
					
						<td>${fieldValue(bean: personalInstance, field: "calle")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
