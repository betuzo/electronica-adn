<%@ page import="mx.com.ideasydiseno.electronica.Colonia" %>



<div class="fieldcontain ${hasErrors(bean: coloniaInstance, field: 'nombreCompleto', 'error')} required">
	<label for="nombreCompleto">
		<g:message code="colonia.nombreCompleto.label" default="Nombre Completo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCompleto" required="" value="${coloniaInstance?.nombreCompleto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coloniaInstance, field: 'instituciones', 'error')} ">
	<label for="instituciones">
		<g:message code="colonia.instituciones.label" default="Instituciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${coloniaInstance?.instituciones?}" var="i">
    <li><g:link controller="institucion" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="institucion" action="create" params="['colonia.id': coloniaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'institucion.label', default: 'Institucion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: coloniaInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="colonia.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${mx.com.ideasydiseno.electronica.Municipio.list()}" optionKey="id" required="" value="${coloniaInstance?.municipio?.id}" class="many-to-one"/>
</div>

