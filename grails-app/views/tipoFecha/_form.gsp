<%@ page import="mx.com.ideasydiseno.electronica.TipoFecha" %>



<div class="fieldcontain ${hasErrors(bean: tipoFechaInstance, field: 'tipoFecha', 'error')} required">
	<label for="tipoFecha">
		<g:message code="tipoFecha.tipoFecha.label" default="Tipo Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipoFecha" required="" value="${tipoFechaInstance?.tipoFecha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoFechaInstance, field: 'ordenCronologico', 'error')} required">
	<label for="ordenCronologico">
		<g:message code="tipoFecha.ordenCronologico.label" default="Orden Cronologico" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="ordenCronologico" required="" value="${fieldValue(bean: tipoFechaInstance, field: 'ordenCronologico')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoFechaInstance, field: 'tipoUso', 'error')} required">
	<label for="tipoUso">
		<g:message code="tipoFecha.tipoUso.label" default="Tipo Uso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoUso" from="${tipoFechaInstance.constraints.tipoUso.inList}" required="" value="${tipoFechaInstance?.tipoUso}" valueMessagePrefix="tipoFecha.tipoUso"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoFechaInstance, field: 'fechas', 'error')} ">
	<label for="fechas">
		<g:message code="tipoFecha.fechas.label" default="Fechas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoFechaInstance?.fechas?}" var="f">
    <li><g:link controller="detalleFecha" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleFecha" action="create" params="['tipoFecha.id': tipoFechaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFecha.label', default: 'DetalleFecha')])}</g:link>
</li>
</ul>

</div>

