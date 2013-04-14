<%@ page import="mx.com.ideasydiseno.electronica.Sucursal" %>



<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="sucursal.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${sucursalInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="sucursal.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${sucursalInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="sucursal.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${sucursalInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="sucursal.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${sucursalInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'municipio.estado.pais', 'error')} required">
	<label for="pais">
		<g:message code="sucursal.pais.label" default="Pais" />
	</label>
	<g:select id="pais" name="municipio.estado.pais.id" from="${mx.com.ideasydiseno.electronica.Pais.list()}" optionKey="id" required="" value="${sucursalInstance?.colonia?.municipio?.estado?.pais?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'municipio.estado', 'error')} required">
	<label for="estado">
		<g:message code="sucursal.estado.label" default="Estado" />
	</label>
	<g:select id="estado" name="municipio.estado.id" from="${sucursalInstance?.colonia?.municipio?.estado?.pais?.estados}" optionKey="id" required="" value="${sucursalInstance?.colonia?.municipio?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="sucursal.municipio.label" default="Municipio" />
	</label>
	<g:select id="municipio" name="municipio.id" from="${sucursalInstance?.colonia?.municipio?.estado?.municipios}" optionKey="id" required="" value="${sucursalInstance?.colonia?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'colonia', 'error')} ">
	<label for="colonia">
		<g:message code="sucursal.colonia.label" default="Colonia" />
		
	</label>
	<g:select id="colonia" name="colonia.id" from="${sucursalInstance?.colonia?.municipio?.colonias}" optionKey="id" value="${sucursalInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="sucursal.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" value="${sucursalInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'noExt', 'error')} ">
	<label for="noExt">
		<g:message code="sucursal.noExt.label" default="No Ext" />
		
	</label>
	<g:textField name="noExt" value="${sucursalInstance?.noExt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'noInt', 'error')} ">
	<label for="noInt">
		<g:message code="sucursal.noInt.label" default="No Int" />
		
	</label>
	<g:textField name="noInt" value="${sucursalInstance?.noInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'referencias', 'error')} ">
	<label for="referencias">
		<g:message code="sucursal.referencias.label" default="Referencias" />
		
	</label>
	<g:textField name="referencias" maxlength="50" value="${sucursalInstance?.referencias}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="sucursal.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${sucursalInstance?.email}"/>
</div>

<!--div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'almacen', 'error')} ">
	<label for="almacen">
		<g:message code="sucursal.almacen.label" default="Almacen" />
		
	</label>
	<g:select id="almacen" name="almacen.id" from="${mx.com.ideasydiseno.electronica.Almacen.list()}" optionKey="id" value="${sucursalInstance?.almacen?.id}" class="many-to-one" noSelection="['null': '']"/>
</div-->

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'entradas', 'error')} ">
	<label for="entradas">
		<g:message code="sucursal.entradas.label" default="Entradas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sucursalInstance?.entradas?}" var="e">
    <li><g:link controller="entrada" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="entrada" action="create" params="['sucursal.id': sucursalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'entrada.label', default: 'Entrada')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'ordenes', 'error')} ">
	<label for="ordenes">
		<g:message code="sucursal.ordenes.label" default="Ordenes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sucursalInstance?.ordenes?}" var="o">
    <li><g:link controller="orden" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="orden" action="create" params="['sucursal.id': sucursalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'orden.label', default: 'Orden')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'personal', 'error')} ">
	<label for="personal">
		<g:message code="sucursal.personal.label" default="Personal" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sucursalInstance?.personal?}" var="p">
    <li><g:link controller="personal" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="personal" action="create" params="['sucursal.id': sucursalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'personal.label', default: 'Personal')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: sucursalInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="sucursal.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sucursalInstance?.telefonos?}" var="t">
    <li><g:link controller="telefonoInstitucion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefonoInstitucion" action="create" params="['sucursal.id': sucursalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion')])}</g:link>
</li>
</ul>

</div>

