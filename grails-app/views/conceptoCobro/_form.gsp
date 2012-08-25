<%@ page import="mx.com.ideasydiseno.electronica.ConceptoCobro" %>



<div class="fieldcontain ${hasErrors(bean: conceptoCobroInstance, field: 'concepto', 'error')} required">
	<label for="concepto">
		<g:message code="conceptoCobro.concepto.label" default="Concepto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="concepto" required="" value="${conceptoCobroInstance?.concepto}"/>
</div>

