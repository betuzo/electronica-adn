<%@ page import="mx.com.ideasydiseno.electronica.OrdenSamsung" %>



<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="ordenSamsung.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${mx.com.ideasydiseno.electronica.Cliente.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.cliente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'sucursal', 'error')} required">
	<label for="sucursal">
		<g:message code="ordenSamsung.sucursal.label" default="Sucursal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sucursal" name="sucursal.id" from="${mx.com.ideasydiseno.electronica.Sucursal.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.sucursal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'marca', 'error')} required">
	<label for="marca">
		<g:message code="ordenSamsung.marca.label" default="Marca" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="marca" name="marca.id" from="${mx.com.ideasydiseno.electronica.Marca.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.marca?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'modelo', 'error')} required">
	<label for="modelo">
		<g:message code="ordenSamsung.modelo.label" default="Modelo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modelo" name="modelo.id" from="${mx.com.ideasydiseno.electronica.Modelo.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.modelo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'tienda', 'error')} required">
	<label for="tienda">
		<g:message code="ordenSamsung.tienda.label" default="Tienda" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tienda" name="tienda.id" from="${mx.com.ideasydiseno.electronica.Tienda.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.tienda?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'aplicaGarantia', 'error')} ">
	<label for="aplicaGarantia">
		<g:message code="personal.aplicaGarantia.label" default="Aplica Garantia" />
	</label>
	<g:checkBox name="aplicaGarantia" value="${personalInstance?.aplicaGarantia}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="ordenSamsung.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" autocomplete="off" required="" value="${ordenSamsungInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'noSerie', 'error')} required">
	<label for="noSerie">
		<g:message code="ordenSamsung.noSerie.label" default="No Serie" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noSerie" required="" value="${ordenSamsungInstance?.noSerie}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="ordenSamsung.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="total" required=""  autocomplete="off" value="${fieldValue(bean: ordenSamsungInstance, field: 'total')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="ordenSamsung.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${ordenSamsungInstance.constraints.status.inList}" required="" value="${ordenSamsungInstance?.status}" valueMessagePrefix="ordenSamsung.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="ordenSamsung.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textArea name="observaciones" autocomplete="off" value="${ordenSamsungInstance?.observaciones}" rows="3" cols="40"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'solucion', 'error')} ">
	<label for="solucion">
		<g:message code="ordenSamsung.solucion.label" default="Solucion" />
		
	</label>
	<g:textArea name="solucion" value="${ordenSamsungInstance?.solucion}" rows="3" cols="40"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'noOrdenServicio', 'error')} ">
	<label for="noOrdenServicio">
		<g:message code="ordenSamsung.noOrdenServicio.label" default="No Orden Servicio" />
		
	</label>
	<g:textField name="noOrdenServicio" value="${ordenSamsungInstance?.noOrdenServicio}"/>
</div>

<g:if test="${!ordenSamsungInstance?.id}">

<div class="fieldcontain">
	<label for="telefonoPrincipal">
		<g:message code="ordenSamsung.costoRevision.label" default="Costo Revision" />
	</label>
	<g:field type="number" name="costoRevision"  autocomplete="off" value="0"/>
</div>

<div class="fieldcontain">
	<label for="tipoFalla">
		<g:message code="ordenSamsung.tipoFalla.label" default="Tipo Falla" />
	</label>
	<g:select id="tipoFalla" name="tipoFalla.id" from="${mx.com.ideasydiseno.electronica.TipoFalla.list()}" optionKey="id" value="" class="many-to-one"/>
</div>

<div class="fieldcontain">
	<label for="descFalla">
		<g:message code="ordenSamsung.descFalla.label" default="Descripción Falla" />
	</label>
	<g:textField name="descFalla" value=""/>
</div>

<div class="fieldcontain">
	<label for="anticipo">
		<g:message code="ordenSamsung.anticipo.label" default="Anticipo" />
	</label>
	<g:field type="number" name="anticipo" autocomplete="off"  value="0"/>
</div>

</g:if>

<g:if test="${ordenSamsungInstance?.id}">

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'cobros', 'error')} ">
	<label for="cobros">
		<g:message code="ordenSamsung.cobros.label" default="Cobros" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenSamsungInstance?.cobros?}" var="c">
    <li><g:link controller="detalleCobro" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleCobro" action="create" params="['ordenSamsung.id': ordenSamsungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'fallas', 'error')} ">
	<label for="fallas">
		<g:message code="ordenSamsung.fallas.label" default="Fallas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenSamsungInstance?.fallas?}" var="f">
    <li><g:link controller="falla" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="falla" action="create" params="['ordenSamsung.id': ordenSamsungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'falla.label', default: 'Falla')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'fechas', 'error')} ">
	<label for="fechas">
		<g:message code="ordenSamsung.fechas.label" default="Fechas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenSamsungInstance?.fechas?}" var="f">
    <li><g:link controller="detalleFechaOrden" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleFechaOrden" action="create" params="['ordenSamsung.id': ordenSamsungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'pagos', 'error')} ">
	<label for="pagos">
		<g:message code="ordenSamsung.pagos.label" default="Pagos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenSamsungInstance?.pagos?}" var="p">
    <li><g:link controller="pagoCliente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pagoCliente" action="create" params="['ordenSamsung.id': ordenSamsungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagoCliente.label', default: 'PagoCliente')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'refacciones', 'error')} ">
	<label for="refacciones">
		<g:message code="ordenSamsung.refacciones.label" default="Refacciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ordenSamsungInstance?.refacciones?}" var="r">
    <li><g:link controller="detalleOrden" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleOrden" action="create" params="['ordenSamsung.id': ordenSamsungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden')])}</g:link>
</li>
</ul>
</g:if>

</div>

