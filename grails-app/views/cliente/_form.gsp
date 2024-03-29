<%@ page import="mx.com.ideasydiseno.electronica.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cliente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${clienteInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="cliente.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${clienteInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="cliente.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${clienteInstance?.apellidoMaterno}"/>
</div>

<g:if test="${!clienteInstance?.id}">
<div class="fieldcontain">
	<label for="telefonoPrincipal">
		<g:message code="venta.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value=""/>
</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="cliente.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${clienteInstance.constraints.sexo.inList}" required="" value="${clienteInstance?.sexo}" valueMessagePrefix="cliente.sexo"/>
</div>


<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'municipio.estado.pais', 'error')} required">
	<label for="pais">
		<g:message code="cliente.pais.label" default="Pais" />
	</label>
	<g:select id="pais" name="municipio.estado.pais.id" from="${mx.com.ideasydiseno.electronica.Pais.list()}" optionKey="id" required="" value="${clienteInstance?.colonia?.municipio?.estado?.pais?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'municipio.estado', 'error')} required">
	<label for="estado">
		<g:message code="cliente.estado.label" default="Estado" />
	</label>
	<g:select id="estado" name="municipio.estado.id" from="${clienteInstance?.colonia?.municipio?.estado?.pais?.estados}" optionKey="id" required="" value="${clienteInstance?.colonia?.municipio?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="cliente.municipio.label" default="Municipio" />
	</label>
	<g:select id="municipio" name="municipio.id" from="${clienteInstance?.colonia?.municipio?.estado?.municipios}" optionKey="id" required="" value="${clienteInstance?.colonia?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'colonia', 'error')} ">
	<label for="colonia">
		<g:message code="cliente.colonia.label" default="Colonia" />
		
	</label>
	<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.electronica.Colonia.list()}" optionKey="id"  value="${clienteInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="cliente.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${clienteInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="cliente.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" value="${clienteInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'noExt', 'error')} ">
	<label for="noExt">
		<g:message code="cliente.noExt.label" default="No Ext" />
		
	</label>
	<g:textField name="noExt" value="${clienteInstance?.noExt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'noInt', 'error')} ">
	<label for="noInt">
		<g:message code="cliente.noInt.label" default="No Int" />
		
	</label>
	<g:textField name="noInt" value="${clienteInstance?.noInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'rfc', 'error')} ">
	<label for="rfc">
		<g:message code="cliente.rfc.label" default="Rfc" />
		
	</label>
	<g:textField name="rfc" maxlength="13" value="${clienteInstance?.rfc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="cliente.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${clienteInstance?.email}"/>
</div>

<g:if test="${clienteInstance?.id}">
	<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefonos', 'error')} ">
		<label for="telefonos">
			<g:message code="cliente.telefonos.label" default="Telefonos" />
			
		</label>
		
	<ul class="one-to-many">
	<g:each in="${clienteInstance?.telefonos?}" var="t">
	    <li><g:link controller="telefonoPersona" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
	</g:each>
	<li class="add">
	<g:link controller="telefonoPersona" action="create" params="['cliente.id': clienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona')])}</g:link>
	</li>
	</ul>

	</div>
</g:if>


