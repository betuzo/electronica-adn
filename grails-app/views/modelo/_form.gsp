<%@ page import="mx.com.ideasydiseno.electronica.Modelo" %>



<div class="fieldcontain ${hasErrors(bean: modeloInstance, field: 'nombreModelo', 'error')} required">
	<label for="nombreModelo">
		<g:message code="modelo.nombreModelo.label" default="Nombre Modelo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreModelo" required="" value="${modeloInstance?.nombreModelo}"/>
</div>

