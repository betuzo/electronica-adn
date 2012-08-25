<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>



<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'proveedor', 'error')} required">
	<label for="proveedor">
		<g:message code="entrada.proveedor.label" default="Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proveedor" name="proveedor.id" from="${mx.com.ideasydiseno.electronica.Proveedor.list()}" optionKey="id" required="" value="${entradaInstance?.proveedor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'sucursal', 'error')} required">
	<label for="sucursal">
		<g:message code="entrada.sucursal.label" default="Sucursal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sucursal" name="sucursal.id" from="${mx.com.ideasydiseno.electronica.Sucursal.list()}" optionKey="id" required="" value="${entradaInstance?.sucursal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="entrada.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="total" required="" value="${fieldValue(bean: entradaInstance, field: 'total')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="entrada.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${entradaInstance.constraints.status.inList}" required="" value="${entradaInstance?.status}" valueMessagePrefix="entrada.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="entrada.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" maxlength="50" value="${entradaInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'fechas', 'error')} ">
	<label for="fechas">
		<g:message code="entrada.fechas.label" default="Fechas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${entradaInstance?.fechas?}" var="f">
    <li><g:link controller="detalleFechaEntrada" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleFechaEntrada" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'pagos', 'error')} ">
	<label for="pagos">
		<g:message code="entrada.pagos.label" default="Pagos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${entradaInstance?.pagos?}" var="p">
    <li><g:link controller="pagoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pagoProveedor" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'refacciones', 'error')} ">
	<label for="refacciones">
		<g:message code="entrada.refacciones.label" default="Refacciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${entradaInstance?.refacciones?}" var="r">
    <li><g:link controller="detalleEntrada" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleEntrada" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada')])}</g:link>
</li>
</ul>

</div>

