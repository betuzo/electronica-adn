<%@ page import="mx.com.ideasydiseno.electronica.DetalleEntrada" %>



<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'entrada', 'error')} required">
	<label for="entrada">
		<g:message code="detalleEntrada.entrada.label" default="Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrada" name="entrada.id" from="${mx.com.ideasydiseno.electronica.Entrada.list()}" optionKey="id" required="" value="${detalleEntradaInstance?.entrada?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'refaccion', 'error')} required">
	<label for="refaccion">
		<g:message code="detalleEntrada.refaccion.label" default="Refaccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="refaccion" name="refaccion.id" from="${mx.com.ideasydiseno.electronica.Refaccion.list()}" optionKey="id" required="" value="${detalleEntradaInstance?.refaccion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="detalleEntrada.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'cantidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'precioUnitario', 'error')} required">
	<label for="precioUnitario">
		<g:message code="detalleEntrada.precioUnitario.label" default="Precio Unitario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precioUnitario" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'precioUnitario')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="detalleEntrada.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="total" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'total')}"/>
</div>

