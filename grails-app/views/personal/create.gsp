<%@ page import="mx.com.ideasydiseno.electronica.Personal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personal.label', default: 'Personal')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-personal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-personal" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personalInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personalInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form action="save" >
				<fieldset class="form">
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
						<input type="password" name="password" required="" value="${personalInstance?.password}" />
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


					<div class="fieldcontain ${hasErrors(bean: telefonoInstitucionInstance, field: 'tipoTelefono', 'error')} required">
						<label for="tipoTelefono">
							<g:message code="telefonoInstitucion.tipoTelefono.label" default="Tipo Telefono" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="tipoTelefono" required="" value="${telefonoInstitucionInstance?.tipoTelefono}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: telefonoInstitucionInstance, field: 'telefono', 'error')} required">
						<label for="telefono">
							<g:message code="telefonoInstitucion.telefono.label" default="Telefono" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="telefono" required="" value="${telefonoInstitucionInstance?.telefono}"/>
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
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
