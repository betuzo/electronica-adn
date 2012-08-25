<%@ page import="mx.com.ideasydiseno.electronica.Orden" %>



<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="orden.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${mx.com.ideasydiseno.electronica.Cliente.list()}" optionKey="id" required="" value="${ordenInstance?.cliente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'sucursal', 'error')} required">
	<label for="sucursal">
		<g:message code="orden.sucursal.label" default="Sucursal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sucursal" name="sucursal.id" from="${mx.com.ideasydiseno.electronica.Sucursal.list()}" optionKey="id" required="" value="${ordenInstance?.sucursal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'marca', 'error')} required">
	<label for="marca">
		<g:message code="orden.marca.label" default="Marca" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="marca" name="marca.id" from="${mx.com.ideasydiseno.electronica.Marca.list()}" optionKey="id" required="" value="${ordenInstance?.marca?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'modelo', 'error')} required">
	<label for="modelo">
		<g:message code="orden.modelo.label" default="Modelo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modelo" name="modelo.id" from="${mx.com.ideasydiseno.electronica.Modelo.list()}" optionKey="id" required="" value="${ordenInstance?.modelo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="orden.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${ordenInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'noSerie', 'error')} required">
	<label for="noSerie">
		<g:message code="orden.noSerie.label" default="No Serie" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noSerie" required="" value="${ordenInstance?.noSerie}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="orden.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="total" required="" value="${fieldValue(bean: ordenInstance, field: 'total')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="orden.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${ordenInstance.constraints.status.inList}" required="" value="${ordenInstance?.status}" valueMessagePrefix="orden.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="orden.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" maxlength="50" value="${ordenInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'cobros', 'error')} ">
	<label for="cobros">
		<g:message code="orden.cobros.label" default="Cobros" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenInstance?.cobros?}" var="c">
    <li><g:link controller="detalleCobro" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleCobro" action="create" params="['orden.id': ordenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'fallas', 'error')} ">
	<label for="fallas">
		<g:message code="orden.fallas.label" default="Fallas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenInstance?.fallas?}" var="f">
    <li><g:link controller="falla" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="falla" action="create" params="['orden.id': ordenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'falla.label', default: 'Falla')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'fechas', 'error')} ">
	<label for="fechas">
		<g:message code="orden.fechas.label" default="Fechas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenInstance?.fechas?}" var="f">
    <li><g:link controller="detalleFechaOrden" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleFechaOrden" action="create" params="['orden.id': ordenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'pagos', 'error')} ">
	<label for="pagos">
		<g:message code="orden.pagos.label" default="Pagos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenInstance?.pagos?}" var="p">
    <li><g:link controller="pagoCliente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pagoCliente" action="create" params="['orden.id': ordenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagoCliente.label', default: 'PagoCliente')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ordenInstance, field: 'refacciones', 'error')} ">
	<label for="refacciones">
		<g:message code="orden.refacciones.label" default="Refacciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenInstance?.refacciones?}" var="r">
    <li><g:link controller="detalleOrden" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleOrden" action="create" params="['orden.id': ordenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden')])}</g:link>
</li>
</ul>

</div>

