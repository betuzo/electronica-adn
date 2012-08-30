<%@ page import="mx.com.ideasydiseno.electronica.DetalleFechaOrden" %>



<div class="fieldcontain ${hasErrors(bean: detalleFechaOrdenInstance, field: 'tipoFecha', 'error')} required">
	<label for="tipoFecha">
		<g:message code="detalleFechaOrden.tipoFecha.label" default="Tipo Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoFecha" name="tipoFecha.id" from="${mx.com.ideasydiseno.electronica.TipoFecha.findAllByTipoUso(mx.com.ideasydiseno.electronica.OrdenSamsungController.FECHA_TIPO_ORDEN)}" optionKey="id" required="" value="${detalleFechaOrdenInstance?.tipoFecha?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleFechaOrdenInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="detalleFechaOrden.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${detalleFechaOrdenInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: detalleFechaOrdenInstance, field: 'personal', 'error')} required">
	<label for="personal">
		<g:message code="detalleFechaOrden.personal.label" default="Personal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="personal" name="personal.id" from="${mx.com.ideasydiseno.electronica.Personal.list()}" optionKey="id" required="" value="${detalleFechaOrdenInstance?.personal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleFechaOrdenInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="detalleFechaOrden.orden.label" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="orden" name="orden.id" from="${mx.com.ideasydiseno.electronica.Orden.list()}" optionKey="id" required="" value="${detalleFechaOrdenInstance?.orden?.id}" class="many-to-one"/>
</div>

