<%@ page import="mx.com.ideasydiseno.electronica.TelefonoInstitucion" %>



<div class="fieldcontain ${hasErrors(bean: telefonoInstitucionInstance, field: 'tipoTelefono', 'error')} required">
	<label for="tipoTelefono">
		<g:message code="telefonoInstitucion.tipoTelefono.label" default="Tipo Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoTelefono" required="" value="${telefonoInstitucionInstance?.tipoTelefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstitucionInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="telefonoInstitucion.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${telefonoInstitucionInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstitucionInstance, field: 'institucion', 'error')} required">
	<label for="institucion">
		<g:message code="telefonoInstitucion.institucion.label" default="Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institucion" name="institucion.id" from="${mx.com.ideasydiseno.electronica.Institucion.list()}" optionKey="id" required="" value="${telefonoInstitucionInstance?.institucion?.id}" class="many-to-one"/>
</div>

