<%@ page import="mx.com.ideasydiseno.electronica.Marca" %>



<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'nombreMarca', 'error')} required">
	<label for="nombreMarca">
		<g:message code="marca.nombreMarca.label" default="Nombre Marca" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreMarca" required="" value="${marcaInstance?.nombreMarca}"/>
</div>

