<%@ page import="mx.com.ideasydiseno.electronica.DetalleOrden" %>



<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'refaccion', 'error')} required">
	<label for="refaccion">
		<g:message code="detalleOrden.refaccion.label" default="Refaccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="refaccion" name="refaccion.id" from="${mx.com.ideasydiseno.electronica.Refaccion.list()}" optionKey="id" required="" value="${detalleOrdenInstance?.refaccion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="detalleOrden.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: detalleOrdenInstance, field: 'cantidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="detalleOrden.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" required="" value="${detalleOrdenInstance.precio}" step="0.01"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="detalleOrden.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="total" required="" value="${detalleOrdenInstance.total}" step="0.01"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'lote', 'error')} required">
	<label for="lote">
		<g:message code="detalleOrden.lote.label" default="Lote" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lote" name="lote.id" from="${mx.com.ideasydiseno.electronica.RefaccionAlmacen.list()}" optionKey="id" required="" value="${detalleOrdenInstance?.lote?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="detalleOrden.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orden" name="orden.id" from="${mx.com.ideasydiseno.electronica.Orden.list()}" optionKey="id" required="" value="${detalleOrdenInstance?.orden?.id}" class="many-to-one"/>
</div>

