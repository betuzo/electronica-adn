<%@ page import="mx.com.ideasydiseno.electronica.TelefonoPersona" %>



<div class="fieldcontain ${hasErrors(bean: telefonoPersonaInstance, field: 'tipoTelefono', 'error')} required">
	<label for="tipoTelefono">
		<g:message code="telefonoPersona.tipoTelefono.label" default="Tipo Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoTelefono" required="" value="${telefonoPersonaInstance?.tipoTelefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoPersonaInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="telefonoPersona.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${telefonoPersonaInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoPersonaInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="telefonoPersona.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${mx.com.ideasydiseno.electronica.Persona.list()}" optionKey="id" required="" value="${telefonoPersonaInstance?.persona?.id}" class="many-to-one"/>
</div>

