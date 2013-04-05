<%@ page import="mx.com.ideasydiseno.electronica.RefaccionAlmacen" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-refaccionAlmacen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-refaccionAlmacen" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${refaccionAlmacenInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${refaccionAlmacenInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					
					<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'refaccion', 'error')} required">
						<label for="refaccion">
							<g:message code="refaccionAlmacen.refaccion.label" default="Refaccion" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="refaccion" name="refaccion.id" from="${mx.com.ideasydiseno.electronica.Refaccion.list()}" optionKey="id" required="" value="${refaccionAlmacenInstance?.refaccion?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'cantidad', 'error')} required">
						<label for="cantidad">
							<g:message code="refaccionAlmacen.cantidad.label" default="Cantidad" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: refaccionAlmacenInstance, field: 'cantidad')}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'precio', 'error')} required">
						<label for="precio">
							<g:message code="refaccionAlmacen.precio.label" default="Precio" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="number" name="precio" required="" value="${fieldValue(bean: refaccionAlmacenInstance, field: 'precio')}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'almacen', 'error')} required">
						<label for="almacen">
							<g:message code="refaccionAlmacen.almacen.label" default="Almacen" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="almacen" name="almacen.id" from="${mx.com.ideasydiseno.electronica.Almacen.list()}" optionKey="id" required="" value="${refaccionAlmacenInstance?.almacen?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: refaccionAlmacenInstance, field: 'entrada', 'error')} required">
						<label for="entrada">
							<g:message code="refaccionAlmacen.entrada.label" default="Entrada" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="entrada" name="entrada.id" from="${mx.com.ideasydiseno.electronica.DetalleEntrada.list()}" optionKey="id" required="" value="${refaccionAlmacenInstance?.entrada?.id}" class="many-to-one"/>
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

				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
