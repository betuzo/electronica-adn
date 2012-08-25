
<%@ page import="mx.com.ideasydiseno.electronica.TipoPersonal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoPersonal.label', default: 'TipoPersonal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoPersonal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoPersonal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipo" title="${message(code: 'tipoPersonal.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tipoPersonal.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoPersonalInstanceList}" status="i" var="tipoPersonalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoPersonalInstance.id}">${fieldValue(bean: tipoPersonalInstance, field: "tipo")}</g:link></td>
					
						<td>${fieldValue(bean: tipoPersonalInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoPersonalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
