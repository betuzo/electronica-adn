
<%@ page import="mx.com.ideasydiseno.electronica.TelefonoInstitucion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-telefonoInstitucion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-telefonoInstitucion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipoTelefono" title="${message(code: 'telefonoInstitucion.tipoTelefono.label', default: 'Tipo Telefono')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'telefonoInstitucion.telefono.label', default: 'Telefono')}" />
					
						<th><g:message code="telefonoInstitucion.institucion.label" default="Institucion" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${telefonoInstitucionInstanceList}" status="i" var="telefonoInstitucionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${telefonoInstitucionInstance.id}">${fieldValue(bean: telefonoInstitucionInstance, field: "tipoTelefono")}</g:link></td>
					
						<td>${fieldValue(bean: telefonoInstitucionInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: telefonoInstitucionInstance, field: "institucion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${telefonoInstitucionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
