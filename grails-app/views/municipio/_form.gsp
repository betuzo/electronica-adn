<%@ page import="mx.com.ideasydiseno.electronica.Municipio" %>



<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="municipio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${municipioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombreCompleto', 'error')} ">
	<label for="nombreCompleto">
		<g:message code="municipio.nombreCompleto.label" default="Nombre Completo" />
		
	</label>
	<g:textField name="nombreCompleto" value="${municipioInstance?.nombreCompleto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'colonias', 'error')} ">
	<label for="colonias">
		<g:message code="municipio.colonias.label" default="Colonias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${municipioInstance?.colonias?}" var="c">
    <li><g:link controller="colonia" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="colonia" action="create" params="['municipio.id': municipioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'colonia.label', default: 'Colonia')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="municipio.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${mx.com.ideasydiseno.electronica.Estado.list()}" optionKey="id" required="" value="${municipioInstance?.estado?.id}" class="many-to-one"/>
</div>

