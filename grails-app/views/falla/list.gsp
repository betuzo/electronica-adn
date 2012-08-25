
<%@ page import="mx.com.ideasydiseno.electronica.Falla" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'falla.label', default: 'Falla')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-falla" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-falla" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="falla.tipoFalla.label" default="Tipo Falla" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'falla.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="falla.orden.label" default="Orden" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fallaInstanceList}" status="i" var="fallaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fallaInstance.id}">${fieldValue(bean: fallaInstance, field: "tipoFalla")}</g:link></td>
					
						<td>${fieldValue(bean: fallaInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: fallaInstance, field: "orden")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fallaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
