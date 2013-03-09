<%@ page import="mx.com.ideasydiseno.electronica.Personal" %>



<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="personal.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${personalInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="personal.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${personalInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="personal.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${personalInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="personal.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${personalInstance.constraints.sexo.inList}" required="" value="${personalInstance?.sexo}" valueMessagePrefix="personal.sexo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="personal.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${personalInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="personal.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${personalInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'municipio.estado.pais', 'error')} required">
	<label for="pais">
		<g:message code="personal.pais.label" default="Pais" />
	</label>
	<g:select id="pais" name="municipio.estado.pais.id" from="${mx.com.ideasydiseno.electronica.Pais.list()}" optionKey="id" required="" value="${personalInstance?.colonia?.municipio?.estado?.pais?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'municipio.estado', 'error')} required">
	<label for="estado">
		<g:message code="personal.estado.label" default="Estado" />
	</label>
	<g:select id="estado" name="municipio.estado.id" from="${personalInstance?.colonia?.municipio?.estado?.pais?.estados}" optionKey="id" required="" value="${personalInstance?.colonia?.municipio?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="personal.municipio.label" default="Municipio" />
	</label>
	<g:select id="municipio" name="municipio.id" from="${personalInstance?.colonia?.municipio?.estado?.municipios}" optionKey="id" required="" value="${personalInstance?.colonia?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'colonia', 'error')} ">
	<label for="colonia">
		<g:message code="personal.colonia.label" default="Colonia" />
		
	</label>
	<g:select id="colonia" name="colonia.id" from="${personalInstance?.colonia?.municipio?.colonias}" optionKey="id" value="${personalInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="personal.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" value="${personalInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'noExt', 'error')} ">
	<label for="noExt">
		<g:message code="personal.noExt.label" default="No Ext" />
		
	</label>
	<g:textField name="noExt" value="${personalInstance?.noExt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'noInt', 'error')} ">
	<label for="noInt">
		<g:message code="personal.noInt.label" default="No Int" />
		
	</label>
	<g:textField name="noInt" value="${personalInstance?.noInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'rfc', 'error')} ">
	<label for="rfc">
		<g:message code="personal.rfc.label" default="Rfc" />
		
	</label>
	<g:textField name="rfc" maxlength="13" value="${personalInstance?.rfc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="personal.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${personalInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="personal.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${personalInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="personal.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${personalInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'tipoPersonal', 'error')} required">
	<label for="tipoPersonal">
		<g:message code="personal.tipoPersonal.label" default="Tipo Personal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoPersonal" name="tipoPersonal.id" from="${mx.com.ideasydiseno.electronica.TipoPersonal.list()}" optionKey="id" required="" value="${personalInstance?.tipoPersonal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'sucursal', 'error')} required">
	<label for="sucursal">
		<g:message code="personal.sucursal.label" default="Sucursal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sucursal" name="sucursal.id" from="${mx.com.ideasydiseno.electronica.Sucursal.list()}" optionKey="id" required="" value="${personalInstance?.sucursal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'compras', 'error')} ">
	<label for="compras">
		<g:message code="personal.compras.label" default="Compras" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personalInstance?.compras?}" var="c">
    <li><g:link controller="detalleFechaEntrada" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleFechaEntrada" action="create" params="['personal.id': personalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="personal.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personalInstance?.telefonos?}" var="t">
    <li><g:link controller="telefonoPersona" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefonoPersona" action="create" params="['personal.id': personalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona')])}</g:link>
</li>
</ul>

</div>


<g:if test="${personalInstance?.id > 0}">
			
<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="personal.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${personalInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="personal.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${personalInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="personal.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${personalInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="personal.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${personalInstance?.accountLocked}" />
</div>

</g:if>

