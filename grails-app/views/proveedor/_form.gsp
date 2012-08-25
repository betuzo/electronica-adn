<%@ page import="mx.com.ideasydiseno.electronica.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="proveedor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${proveedorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="proveedor.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${proveedorInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="proveedor.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${proveedorInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="proveedor.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${proveedorInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'colonia', 'error')} ">
	<label for="colonia">
		<g:message code="proveedor.colonia.label" default="Colonia" />
		
	</label>
	<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.electronica.Colonia.list()}" optionKey="id" value="${proveedorInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="proveedor.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" value="${proveedorInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'noExt', 'error')} ">
	<label for="noExt">
		<g:message code="proveedor.noExt.label" default="No Ext" />
		
	</label>
	<g:textField name="noExt" value="${proveedorInstance?.noExt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'noInt', 'error')} ">
	<label for="noInt">
		<g:message code="proveedor.noInt.label" default="No Int" />
		
	</label>
	<g:textField name="noInt" value="${proveedorInstance?.noInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'referencias', 'error')} ">
	<label for="referencias">
		<g:message code="proveedor.referencias.label" default="Referencias" />
		
	</label>
	<g:textField name="referencias" maxlength="50" value="${proveedorInstance?.referencias}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="proveedor.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${proveedorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'contactos', 'error')} ">
	<label for="contactos">
		<g:message code="proveedor.contactos.label" default="Contactos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${proveedorInstance?.contactos?}" var="c">
    <li><g:link controller="contactoProveedor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contactoProveedor" action="create" params="['proveedor.id': proveedorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'entradas', 'error')} ">
	<label for="entradas">
		<g:message code="proveedor.entradas.label" default="Entradas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${proveedorInstance?.entradas?}" var="e">
    <li><g:link controller="entrada" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="entrada" action="create" params="['proveedor.id': proveedorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'entrada.label', default: 'Entrada')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="proveedor.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${proveedorInstance?.telefonos?}" var="t">
    <li><g:link controller="telefonoInstitucion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefonoInstitucion" action="create" params="['proveedor.id': proveedorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion')])}</g:link>
</li>
</ul>

</div>

