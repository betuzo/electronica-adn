
<%@ page import="mx.com.ideasydiseno.electronica.TelefonoPersona" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoPersona.label', default: 'TelefonoPersona')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-telefonoPersona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-telefonoPersona" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipoTelefono" title="${message(code: 'telefonoPersona.tipoTelefono.label', default: 'Tipo Telefono')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'telefonoPersona.telefono.label', default: 'Telefono')}" />
					
						<th><g:message code="telefonoPersona.persona.label" default="Persona" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${telefonoPersonaInstanceList}" status="i" var="telefonoPersonaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${telefonoPersonaInstance.id}">${fieldValue(bean: telefonoPersonaInstance, field: "tipoTelefono")}</g:link></td>
					
						<td>${fieldValue(bean: telefonoPersonaInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: telefonoPersonaInstance, field: "persona")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${telefonoPersonaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
