<%@ page import="mx.com.ideasydiseno.electronica.TipoFalla" %>



<div class="fieldcontain ${hasErrors(bean: tipoFallaInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="tipoFalla.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo" required="" value="${tipoFallaInstance?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoFallaInstance, field: 'fallas', 'error')} ">
	<label for="fallas">
		<g:message code="tipoFalla.fallas.label" default="Fallas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoFallaInstance?.fallas?}" var="f">
    <li><g:link controller="falla" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="falla" action="create" params="['tipoFalla.id': tipoFallaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'falla.label', default: 'Falla')])}</g:link>
</li>
</ul>

</div>

