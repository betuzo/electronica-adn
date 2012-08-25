
<%@ page import="mx.com.ideasydiseno.electronica.Refaccion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'refaccion.label', default: 'Refaccion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-refaccion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-refaccion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clave" title="${message(code: 'refaccion.clave.label', default: 'Clave')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'refaccion.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${refaccionInstanceList}" status="i" var="refaccionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${refaccionInstance.id}">${fieldValue(bean: refaccionInstance, field: "clave")}</g:link></td>
					
						<td>${fieldValue(bean: refaccionInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${refaccionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
