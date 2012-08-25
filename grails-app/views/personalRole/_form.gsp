<%@ page import="mx.com.ideasydiseno.electronica.PersonalRole" %>



<div class="fieldcontain ${hasErrors(bean: personalRoleInstance, field: 'personal', 'error')} required">
	<label for="personal">
		<g:message code="personalRole.personal.label" default="Personal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="personal" name="personal.id" from="${mx.com.ideasydiseno.electronica.Personal.list()}" optionKey="id" required="" value="${personalRoleInstance?.personal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalRoleInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="personalRole.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${mx.com.ideasydiseno.electronica.Role.list()}" optionKey="id" required="" value="${personalRoleInstance?.role?.id}" class="many-to-one"/>
</div>

