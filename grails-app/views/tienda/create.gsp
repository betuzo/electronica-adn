<%@ page import="mx.com.ideasydiseno.electronica.Tienda" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tienda.label', default: 'Tienda')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript>
			$(document).on('ready', function(){

				$("#telefono").keyup(function(){
					this.value = this.value.replace(/[^0-9\-]/g,'');
				});

				$("#codigoPostal").keyup(function(){
					this.value = this.value.replace(/[^0-9]/g,'');
				});
			});
		</g:javascript>
	</head>
	<body>
		<a href="#create-tienda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-tienda" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${tiendaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${tiendaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'nombre', 'error')} required">
						<label for="nombre">
							<g:message code="tienda.nombre.label" default="Nombre" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="nombre" required="" value="${tiendaInstance?.nombre}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'descripcion', 'error')} required">
						<label for="descripcion">
							<g:message code="tienda.descripcion.label" default="Descripcion" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="descripcion" required="" value="${tiendaInstance?.descripcion}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'calle', 'error')} ">
						<label for="calle">
							<g:message code="tienda.calle.label" default="Calle" />
							
						</label>
						<g:textField name="calle" value="${tiendaInstance?.calle}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'municipio.estado.pais', 'error')} required">
						<label for="pais">
							<g:message code="usuario.pais.label" default="Pais" />
						</label>
						<g:select id="pais" name="municipio.estado.pais.id" from="${mx.com.ideasydiseno.electronica.Pais.list()}" optionKey="id" required="" value="${tiendaInstance?.colonia?.municipio?.estado?.pais?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'municipio.estado', 'error')} required">
						<label for="estado">
							<g:message code="usuario.estado.label" default="Estado" />
						</label>
						<g:select id="estado" name="municipio.estado.id" from="${tiendaInstance?.colonia?.municipio?.estado?.pais?.estados}" optionKey="id" required="" value="${tiendaInstance?.colonia?.municipio?.estado?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'municipio', 'error')} required">
						<label for="municipio">
							<g:message code="usuario.municipio.label" default="Municipio" />
						</label>
						<g:select id="municipio" name="municipio.id" from="${tiendaInstance?.colonia?.municipio?.estado?.municipios}" optionKey="id" required="" value="${tiendaInstance?.colonia?.municipio?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'colonia', 'error')} ">
						<label for="colonia">
							<g:message code="tienda.colonia.label" default="Colonia" />
							
						</label>
						<g:select id="colonia" name="colonia.id" from="${tiendaInstance?.colonia?.municipio?.colonias}" optionKey="id" value="${tiendaInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'codigoPostal', 'error')} ">
						<label for="codigoPostal">
							<g:message code="tienda.codigoPostal.label" default="Codigo Postal" />
							
						</label>
						<g:textField name="codigoPostal" id="codigoPostal" maxlength="5" value="${tiendaInstance?.codigoPostal}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'noExt', 'error')} ">
						<label for="noExt">
							<g:message code="tienda.noExt.label" default="No Ext" />
							
						</label>
						<g:textField name="noExt" value="${tiendaInstance?.noExt}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'noInt', 'error')} ">
						<label for="noInt">
							<g:message code="tienda.noInt.label" default="No Int" />
							
						</label>
						<g:textField name="noInt" value="${tiendaInstance?.noInt}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'referencias', 'error')} ">
						<label for="referencias">
							<g:message code="tienda.referencias.label" default="Referencias" />
							
						</label>
						<g:textField name="referencias" maxlength="50" value="${tiendaInstance?.referencias}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: tiendaInstance, field: 'email', 'error')} ">
						<label for="email">
							<g:message code="tienda.email.label" default="Email" />
							
						</label>
						<g:field type="email" name="email" value="${tiendaInstance?.email}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: telefonoInstitucionInstance, field: 'telefono', 'error')} required">
						<label for="telefono">
							<g:message code="telefonoInstitucion.telefono.label" default="Telefono" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="telefono" id="telefono" maxlength="20" required="" value="${telefonoInstitucionInstance?.telefono}"/>
					</div>
					
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
