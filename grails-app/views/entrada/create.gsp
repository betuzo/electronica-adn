<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript>
			$(document).on('ready', function(){
				var tipoFecha = $("#tipoFechaEntrada").val();
				$("#totalPago").val("0");
				$("#tipoPago").val(" ");
				$("#form-fecha").css("display", "none");
				$("#form-pagos").css("display", "none");

				/*fechas*/
				$("#slide-fecha-open").on("click", function(){
					$("#form-fecha").slideDown();
				});

				$("#slide-fecha-close").on("click", function(){
					$("#form-fecha").slideUp();
				});

				/*pagos*/
				$("#slide-pagos-open").on("click", function(){
					$("#totalPago").val("");
					$("#tipoPago").val("");
					$("#form-pagos").slideDown();
				});

				$("#slide-pagos-close").on("click", function(){
					$("#totalPago").val("0");
					$("#tipoPago").val(" ");
					$("#form-pagos").slideUp();
				});

				$('#totalPago').keyup(function () {
				  this.value = this.value.replace(/[^0-9\.]/g,'');
				});

				$('#total').keyup(function () {
				  this.value = this.value.replace(/[^0-9\.]/g,'');
				});
			});
		</g:javascript>

	</head>
	<body>
		<a href="#create-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="create-entrada" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${entradaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${entradaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form name="form" action="save" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'proveedor', 'error')} required">
						<label for="proveedor">
							<g:message code="entrada.proveedor.label" default="Proveedor" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="proveedor" name="proveedor.id" from="${mx.com.ideasydiseno.electronica.Proveedor.list()}" optionKey="id" required="" value="${entradaInstance?.proveedor?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'sucursal', 'error')} required">
						<label for="sucursal">
							<g:message code="entrada.sucursal.label" default="Sucursal" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="sucursal" name="sucursal.id" from="${mx.com.ideasydiseno.electronica.Sucursal.list()}" optionKey="id" required="" value="${entradaInstance?.sucursal?.id}" class="many-to-one"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'total', 'error')} required">
						<label for="total">
							<g:message code="entrada.total.label" default="Total" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="number" id="total" name="total" required="" autocomplete="off" value="${fieldValue(bean: entradaInstance, field: 'total')}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'status', 'error')} required">
						<label for="status">
							<g:message code="entrada.status.label" default="Status" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="status" from="${entradaInstance.constraints.status.inList}" required="" value="${entradaInstance?.status}" valueMessagePrefix="entrada.status"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'observaciones', 'error')} ">
						<label for="observaciones">
							<g:message code="entrada.observaciones.label" default="Observaciones" />

						</label>
						<g:textField name="observaciones" maxlength="50" value="${entradaInstance?.observaciones}"/>
					</div>

<!--Agregar pagos-->

					Agregar pago <img id="slide-pagos-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar Pagos" height="30px" width="30px"/>
					<div id="form-pagos">
						<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'tipoPago', 'error')} required">
							<label for="tipoPago">
								<g:message code="pagoProveedor.tipoPago.label" default="Tipo Pago" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField id="tipoPago" required="" name="tipoPago" value="${pagoProveedorInstance?.tipoPago}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'total', 'error')} required">
							<label for="total">
								<g:message code="pagoProveedor.total.label" default="Total" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" required="" name="totalPago" autocomplete="off" value="${fieldValue(bean: pagoProveedorInstance, field: 'total')}"/>
						</div>

						<br>
						<fieldset class="buttons">
							<div id="slide-pagos-close" class="closeIcon">Cerrar</div>
						</fieldset>
					</div>

				</fieldset>
				<br><br>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
