<%@ page import="mx.com.ideasydiseno.electronica.TipoPersonal" %>



<div class="fieldcontain ${hasErrors(bean: tipoPersonalInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="tipoPersonal.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo" required="" value="${tipoPersonalInstance?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPersonalInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipoPersonal.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${tipoPersonalInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPersonalInstance, field: 'personal', 'error')} ">
	<label for="personal">
		<g:message code="tipoPersonal.personal.label" default="Personal" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoPersonalInstance?.personal?}" var="p">
    <li><g:link controller="personal" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="personal" action="create" params="['tipoPersonal.id': tipoPersonalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'personal.label', default: 'Personal')])}</g:link>
</li>
</ul>

</div>

