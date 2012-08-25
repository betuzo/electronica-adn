<%@ page import="mx.com.ideasydiseno.electronica.DetalleCobro" %>



<div class="fieldcontain ${hasErrors(bean: detalleCobroInstance, field: 'concepto', 'error')} required">
	<label for="concepto">
		<g:message code="detalleCobro.concepto.label" default="Concepto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="concepto" name="concepto.id" from="${mx.com.ideasydiseno.electronica.ConceptoCobro.list()}" optionKey="id" required="" value="${detalleCobroInstance?.concepto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleCobroInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="detalleCobro.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="total" required="" value="${fieldValue(bean: detalleCobroInstance, field: 'total')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleCobroInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="detalleCobro.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${detalleCobroInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: detalleCobroInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="detalleCobro.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orden" name="orden.id" from="${mx.com.ideasydiseno.electronica.Orden.list()}" optionKey="id" required="" value="${detalleCobroInstance?.orden?.id}" class="many-to-one"/>
</div>

