
<%@ page import="mx.com.ideasydiseno.electronica.PersonalRole" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personalRole.label', default: 'PersonalRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-personalRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-personalRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list personalRole">
			
				<g:if test="${personalRoleInstance?.personal}">
				<li class="fieldcontain">
					<span id="personal-label" class="property-label"><g:message code="personalRole.personal.label" default="Personal" /></span>
					
						<span class="property-value" aria-labelledby="personal-label"><g:link controller="personal" action="show" id="${personalRoleInstance?.personal?.id}">${personalRoleInstance?.personal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personalRoleInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="personalRole.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="role" action="show" id="${personalRoleInstance?.role?.id}">${personalRoleInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personalRoleInstance?.id}" />
					<g:link class="edit" action="edit" id="${personalRoleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
