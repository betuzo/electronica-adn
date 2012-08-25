<%@ page import="mx.com.ideasydiseno.electronica.Falla" %>



<div class="fieldcontain ${hasErrors(bean: fallaInstance, field: 'tipoFalla', 'error')} required">
	<label for="tipoFalla">
		<g:message code="falla.tipoFalla.label" default="Tipo Falla" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoFalla" name="tipoFalla.id" from="${mx.com.ideasydiseno.electronica.TipoFalla.list()}" optionKey="id" required="" value="${fallaInstance?.tipoFalla?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fallaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="falla.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="50" value="${fallaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fallaInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="falla.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orden" name="orden.id" from="${mx.com.ideasydiseno.electronica.Orden.list()}" optionKey="id" required="" value="${fallaInstance?.orden?.id}" class="many-to-one"/>
</div>

