<%@ page import="mx.com.ideasydiseno.electronica.ContactoProveedor" %>



<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="contactoProveedor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${contactoProveedorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="contactoProveedor.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${contactoProveedorInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="contactoProveedor.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${contactoProveedorInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="contactoProveedor.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${contactoProveedorInstance.constraints.sexo.inList}" required="" value="${contactoProveedorInstance?.sexo}" valueMessagePrefix="contactoProveedor.sexo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="contactoProveedor.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${contactoProveedorInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="contactoProveedor.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${contactoProveedorInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'colonia', 'error')} ">
	<label for="colonia">
		<g:message code="contactoProveedor.colonia.label" default="Colonia" />
		
	</label>
	<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.electronica.Colonia.list()}" optionKey="id" value="${contactoProveedorInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="contactoProveedor.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" value="${contactoProveedorInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'noExt', 'error')} ">
	<label for="noExt">
		<g:message code="contactoProveedor.noExt.label" default="No Ext" />
		
	</label>
	<g:textField name="noExt" value="${contactoProveedorInstance?.noExt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'noInt', 'error')} ">
	<label for="noInt">
		<g:message code="contactoProveedor.noInt.label" default="No Int" />
		
	</label>
	<g:textField name="noInt" value="${contactoProveedorInstance?.noInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'rfc', 'error')} ">
	<label for="rfc">
		<g:message code="contactoProveedor.rfc.label" default="Rfc" />
		
	</label>
	<g:textField name="rfc" maxlength="13" value="${contactoProveedorInstance?.rfc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="contactoProveedor.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${contactoProveedorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'proveedor', 'error')} required">
	<label for="proveedor">
		<g:message code="contactoProveedor.proveedor.label" default="Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proveedor" name="proveedor.id" from="${mx.com.ideasydiseno.electronica.Proveedor.list()}" optionKey="id" required="" value="${contactoProveedorInstance?.proveedor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="contactoProveedor.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contactoProveedorInstance?.telefonos?}" var="t">
    <li><g:link controller="telefonoPersona" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefonoPersona" action="create" params="['contactoProveedor.id': contactoProveedorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona')])}</g:link>
</li>
</ul>

</div>

