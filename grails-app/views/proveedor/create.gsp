<%@ page import="mx.com.ideasydiseno.electronica.Proveedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript>
			document.getElementById('form-telefono-proveedor').style.display='none';

			var tipoTelefono = document.getElementById('tipoTelefono');
			var telefono= document.getElementById('telefono');
			telefonoContacto.value = " ";
			tipoTelefonoContacto.value = " ";


			$(document).ready(function(){

				$('#slide-telefono-open').click(function(){
					$('#form-telefono-proveedor').slideDown();
					telefonoContacto.value = "";
					tipoTelefonoContacto.value = "";
				});

				$('#form-telefono-close').click(function(){
					$('#form-telefono-proveedor').slideUp();
					telefonoContacto.value = " ";
					tipoTelefonoContacto.value = " ";
				});

				
			});

		</g:javascript>
	</head>
	<body>
		<a href="#create-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-proveedor" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${proveedorInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${proveedorInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
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
<!-- Agregar telefonos-->
					<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'telefonos', 'error')} ">
						<label for="telefonos">
							<g:message code="proveedor.telefonos.label" default="Telefonos" />
							
						</label>
						
					<ul class="one-to-many">
					<g:each in="${proveedorInstance?.telefonos?}" var="t">
					    <li><g:link controller="telefonoInstitucion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					<li class="add">
					<!--
					<g:link controller="telefonoInstitucion" action="create" params="['proveedor.id': proveedorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion')])}</g:link>
					-->
					Agregar Telefono <img id="slide-telefono-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar Pagos" height="30px" width="30px"/>
						<div id="form-telefono-proveedor">
							<div class="fieldcontain ${hasErrors(bean: telefonoInstitucionInstance, field: 'tipoTelefono', 'error')} required">
								<label for="tipoTelefono">
									<g:message code="telefonoInstitucion.tipoTelefono.label" default="Tipo Telefono" />
									<span class="required-indicator">*</span>
								</label>
								<g:textField name="tipoTelefonoContacto" required="" value="${telefonoInstitucionInstance?.tipoTelefono}"/>
							</div>

							<div class="fieldcontain ${hasErrors(bean: telefonoInstitucionInstance, field: 'telefono', 'error')} required">
								<label for="telefono">
									<g:message code="telefonoInstitucion.telefono.label" default="Telefono" />
									<span class="required-indicator">*</span>
								</label>
								<g:textField name="telefonoContacto" required="" value="${telefonoInstitucionInstance?.telefono}"/>
							</div>
							<div>
								<img id="form-telefono-close" href="#" src="${resource (dir:'images', file:'Xion.png')}" alt="Cerrar" heigth="30px" width="30px"/>	
							</div>
						</div>
					</div>
					</li>
					</ul>

					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
