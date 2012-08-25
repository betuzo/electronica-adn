<%@ page import="mx.com.ideasydiseno.electronica.DetalleFechaEntrada" %>



<div class="fieldcontain ${hasErrors(bean: detalleFechaEntradaInstance, field: 'tipoFecha', 'error')} required">
	<label for="tipoFecha">
		<g:message code="detalleFechaEntrada.tipoFecha.label" default="Tipo Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoFecha" name="tipoFecha.id" from="${mx.com.ideasydiseno.electronica.TipoFecha.list()}" optionKey="id" required="" value="${detalleFechaEntradaInstance?.tipoFecha?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleFechaEntradaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="detalleFechaEntrada.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${detalleFechaEntradaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: detalleFechaEntradaInstance, field: 'personal', 'error')} required">
	<label for="personal">
		<g:message code="detalleFechaEntrada.personal.label" default="Personal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="personal" name="personal.id" from="${mx.com.ideasydiseno.electronica.Personal.list()}" optionKey="id" required="" value="${detalleFechaEntradaInstance?.personal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleFechaEntradaInstance, field: 'entrada', 'error')} required">
	<label for="entrada">
		<g:message code="detalleFechaEntrada.entrada.label" default="Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrada" name="entrada.id" from="${mx.com.ideasydiseno.electronica.Entrada.list()}" optionKey="id" required="" value="${detalleFechaEntradaInstance?.entrada?.id}" class="many-to-one"/>
</div>

