<%@ page import="mx.com.ideasydiseno.electronica.Almacen" %>



<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'refacciones', 'error')} ">
	<label for="refacciones">
		<g:message code="almacen.refacciones.label" default="Refacciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${almacenInstance?.refacciones?}" var="r">
    <li><g:link controller="refaccionAlmacen" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="refaccionAlmacen" action="create" params="['almacen.id': almacenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'sucursal', 'error')} required">
	<label for="sucursal">
		<g:message code="almacen.sucursal.label" default="Sucursal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sucursal"  disabled="" name="sucursal.id" from="${mx.com.ideasydiseno.electronica.Sucursal.list()}" optionKey="id" required="" value="${almacenInstance?.sucursal?.id}" class="many-to-one"/>
</div>

