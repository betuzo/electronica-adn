<%@ page import="mx.com.ideasydiseno.electronica.RefaccionAlmacen" %>



<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'refaccion', 'error')} required">
	<label for="refaccion">
		<g:message code="refaccionAlmacen.refaccion.label" default="Refaccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="refaccion" name="refaccion.id" from="${mx.com.ideasydiseno.electronica.Refaccion.list()}" optionKey="id" required="" value="${refaccionAlmacenInstance?.refaccion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="refaccionAlmacen.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: refaccionAlmacenInstance, field: 'cantidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="refaccionAlmacen.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" required="" value="${fieldValue(bean: refaccionAlmacenInstance, field: 'precio')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'almacen', 'error')} required">
	<label for="almacen">
		<g:message code="refaccionAlmacen.almacen.label" default="Almacen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="almacen" name="almacen.id" from="${mx.com.ideasydiseno.electronica.Almacen.list()}" optionKey="id" required="" value="${refaccionAlmacenInstance?.almacen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'entrada', 'error')} required">
	<label for="entrada">
		<g:message code="refaccionAlmacen.entrada.label" default="Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrada" name="entrada.id" from="${mx.com.ideasydiseno.electronica.DetalleEntrada.list()}" optionKey="id" required="" value="${refaccionAlmacenInstance?.entrada?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'salidas', 'error')} ">
	<label for="salidas">
		<g:message code="refaccionAlmacen.salidas.label" default="Salidas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${refaccionAlmacenInstance?.salidas?}" var="s">
    <li><g:link controller="detalleOrden" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleOrden" action="create" params="['refaccionAlmacen.id': refaccionAlmacenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden')])}</g:link>
</li>
</ul>

</div>

