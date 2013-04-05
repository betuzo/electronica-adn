<%@ page import="mx.com.ideasydiseno.electronica.TipoFalla" %>



<div class="fieldcontain ${hasErrors(bean: tipoFallaInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="tipoFalla.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo" required="" value="${tipoFallaInstance?.tipo}"/>
</div>

