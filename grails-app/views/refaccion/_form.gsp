<%@ page import="mx.com.ideasydiseno.electronica.Refaccion" %>



<div class="fieldcontain ${hasErrors(bean: refaccionInstance, field: 'clave', 'error')} required">
	<label for="clave">
		<g:message code="refaccion.clave.label" default="Clave" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clave" required="" value="${refaccionInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: refaccionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="refaccion.descripcion.label" default="Descripcion" />

	</label>
	<g:textField name="descripcion" value="${refaccionInstance?.descripcion}"/>
</div>

%{-- <div class="fieldcontain ${hasErrors(bean: refaccionInstance, field: 'compras', 'error')} ">
	<label for="compras">
		<g:message code="refaccion.compras.label" default="Compras" />

	</label>

<ul class="one-to-many">
<g:each in="${refaccionInstance?.compras?}" var="c">
    <li><g:link controller="detalleEntrada" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleEntrada" action="create" params="['refaccion.id': refaccionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: refaccionInstance, field: 'lotesAlmacen', 'error')} ">
	<label for="lotesAlmacen">
		<g:message code="refaccion.lotesAlmacen.label" default="Lotes Almacen" />

	</label>

<ul class="one-to-many">
<g:each in="${refaccionInstance?.lotesAlmacen?}" var="l">
    <li><g:link controller="refaccionAlmacen" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="refaccionAlmacen" action="create" params="['refaccion.id': refaccionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: refaccionInstance, field: 'ordenes', 'error')} ">
	<label for="ordenes">
		<g:message code="refaccion.ordenes.label" default="Ordenes" />

	</label>

<ul class="one-to-many">
<g:each in="${refaccionInstance?.ordenes?}" var="o">
    <li><g:link controller="detalleOrden" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleOrden" action="create" params="['refaccion.id': refaccionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden')])}</g:link>
</li>
</ul>

</div>
 --}%
