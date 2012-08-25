<%@ page import="mx.com.ideasydiseno.electronica.PagoProveedor" %>



<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'tipoPago', 'error')} required">
	<label for="tipoPago">
		<g:message code="pagoProveedor.tipoPago.label" default="Tipo Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoPago" required="" value="${pagoProveedorInstance?.tipoPago}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="pagoProveedor.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="total" required="" value="${fieldValue(bean: pagoProveedorInstance, field: 'total')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'fechaPago', 'error')} required">
	<label for="fechaPago">
		<g:message code="pagoProveedor.fechaPago.label" default="Fecha Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaPago" precision="day"  value="${pagoProveedorInstance?.fechaPago}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'realizo', 'error')} required">
	<label for="realizo">
		<g:message code="pagoProveedor.realizo.label" default="Realizo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="realizo" name="realizo.id" from="${mx.com.ideasydiseno.electronica.Personal.list()}" optionKey="id" required="" value="${pagoProveedorInstance?.realizo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'entrada', 'error')} required">
	<label for="entrada">
		<g:message code="pagoProveedor.entrada.label" default="Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrada" name="entrada.id" from="${mx.com.ideasydiseno.electronica.Entrada.list()}" optionKey="id" required="" value="${pagoProveedorInstance?.entrada?.id}" class="many-to-one"/>
</div>

