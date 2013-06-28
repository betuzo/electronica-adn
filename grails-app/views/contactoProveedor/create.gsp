<%@ page import="mx.com.ideasydiseno.electronica.ContactoProveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contactoProveedor.label', default: 'ContactoProveedor')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-contactoProveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-contactoProveedor" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${contactoProveedorInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${contactoProveedorInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="forms">
					<div class="form-left">
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

						<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'telefonos', 'error')} required">
							<label for="telefono">
								Telefono
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="telefono" id="telefono" required="" maxlength="15" value="${contactoProveedorInstance?.telefonos}"/>
						</div>
					</div>

					<div class="form-right">
						<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'municipio.estado.pais', 'error')} required">
							<label for="pais">
								<g:message code="contactoProveedor.pais.label" default="Pais" />
							</label>
							<g:select id="pais" name="municipio.estado.pais.id" from="${mx.com.ideasydiseno.electronica.Pais.list()}" optionKey="id" required="" value="${contactoProveedorInstance?.colonia?.municipio?.estado?.pais?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'municipio.estado', 'error')} required">
							<label for="estado">
								<g:message code="contactoProveedor.estado.label" default="Estado" />
							</label>
							<g:select id="estado" name="municipio.estado.id" from="${contactoProveedorInstance?.colonia?.municipio?.estado?.pais?.estados}" optionKey="id" required="" value="${contactoProveedorInstance?.colonia?.municipio?.estado?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'municipio', 'error')} required">
							<label for="municipio">
								<g:message code="contactoProveedor.municipio.label" default="Municipio" />
							</label>
							<g:select id="municipio" name="municipio.id" from="${contactoProveedorInstance?.colonia?.municipio?.estado?.municipios}" optionKey="id" required="" value="${contactoProveedorInstance?.colonia?.municipio?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'colonia', 'error')} ">
							<label for="colonia">
								<g:message code="contactoProveedor.colonia.label" default="Colonia" />

							</label>
							<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.electronica.Colonia.list()}" optionKey="id" value="${contactoProveedorInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: contactoProveedorInstance, field: 'calle', 'error')} ">
							<label for="calle">
								<g:message code="contactoProveedor.calle.label" default="Calle" />

							</label>
							<g:textField name="calle" value="${contactoProveedorInstance?.calle}"/>
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
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
