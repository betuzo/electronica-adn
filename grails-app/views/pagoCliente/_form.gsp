<%@ page import="mx.com.ideasydiseno.electronica.PagoCliente" %>



<div class="fieldcontain ${hasErrors(bean: pagoClienteInstance, field: 'tipoPago', 'error')} required">
	<label for="tipoPago">
		<g:message code="pagoCliente.tipoPago.label" default="Tipo Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoPago" required="" value="${pagoClienteInstance?.tipoPago}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoClienteInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="pagoCliente.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="total" required="" value="${fieldValue(bean: pagoClienteInstance, field: 'total')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoClienteInstance, field: 'fechaPago', 'error')} required">
	<label for="fechaPago">
		<g:message code="pagoCliente.fechaPago.label" default="Fecha Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaPago" precision="day"  value="${pagoClienteInstance?.fechaPago}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pagoClienteInstance, field: 'recibio', 'error')} required">
	<label for="recibio">
		<g:message code="pagoCliente.recibio.label" default="Recibio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recibio" name="recibio.id" from="${mx.com.ideasydiseno.electronica.Personal.list()}" optionKey="id" required="" value="${pagoClienteInstance?.recibio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoClienteInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="pagoCliente.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orden" name="orden.id" from="${mx.com.ideasydiseno.electronica.Orden.list()}" optionKey="id" required="" value="${pagoClienteInstance?.orden?.id}" class="many-to-one"/>
</div>

