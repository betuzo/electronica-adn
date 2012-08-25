
<%@ page import="mx.com.ideasydiseno.electronica.PersonalRole" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personalRole.label', default: 'PersonalRole')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-personalRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-personalRole" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="personalRole.personal.label" default="Personal" /></th>
					
						<th><g:message code="personalRole.role.label" default="Role" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personalRoleInstanceList}" status="i" var="personalRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personalRoleInstance.id}">${fieldValue(bean: personalRoleInstance, field: "personal")}</g:link></td>
					
						<td>${fieldValue(bean: personalRoleInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personalRoleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
