<%@ page import="mx.com.ideasydiseno.electronica.OrdenSamsung" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordenSamsung.label', default: 'OrdenSamsung')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

		<g:javascript>

		function overlayClient() {
				el = document.getElementById("overlayClient");
				el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
			}


		function responseClienteOrden(response) {
			if (response.exito == '1'){
				$("#cliente").html(response.html);
			}else{
				alert("Problema al buscar Cliente... favor de reportarlo con los guapos de sistemas =)");
			}
			overlayClient();
		}

		$(document).on('ready' , function(){

			$('#total').keyup(function () {
				/*this.value = this.value.replace(/[^0-9]/g,'');
				 this.value = this.value.replace(/\D/,''); */
				 this.value = this.value.replace(/[^0-9\.]/g,'');
			});

			$("#costoRevision").keyup(function(){
				this.value = this.value.replace(/[^0-9\.]/g,'');
			});

			$("#anticipo").keyup(function(){
				this.value = this.value.replace(/[^0-9\.]/g,'');
			});
		});

		</g:javascript>

	</head>
	<body>
		<a href="#create-ordenSamsung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Lista de Ordenes</g:link></li>
			</ul>
		</div>
		<div id="create-ordenSamsung" class="content scaffold-create" role="main">
			<h1>Levantar Orden</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${ordenSamsungInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${ordenSamsungInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="forms" >
					<div class="form-left">
						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'cliente', 'error')} required">
							<label for="cliente">
								<g:message code="ordenSamsung.cliente.label" default="Cliente" />
								<span class="required-indicator">*</span>
								<input type="button" class="search" value="Buscar Cliente" onclick="overlayClient()" />
							</label>
							<g:select id="cliente" name="cliente.id" from="${mx.com.ideasydiseno.electronica.Cliente.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.cliente?.id}" class="many-to-one"/>
						</div>
						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'marca', 'error')} required">
							<label for="marca">
								<g:message code="ordenSamsung.marca.label" default="Marca" />
								<span class="required-indicator">*</span>
							</label>
							<g:select id="marca" name="marca.id" from="${mx.com.ideasydiseno.electronica.Marca.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.marca?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'modelo', 'error')} required">
							<label for="modelo">
								<g:message code="ordenSamsung.modelo.label" default="Modelo" />
								<span class="required-indicator">*</span>
							</label>
							<g:select id="modelo" name="modelo.id" from="${mx.com.ideasydiseno.electronica.Modelo.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.modelo?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'noSerie', 'error')} required">
							<label for="noSerie">
								<g:message code="ordenSamsung.noSerie.label" default="No Serie" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="noSerie" required="" value="${ordenSamsungInstance?.noSerie}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'descripcion', 'error')} required">
							<label for="descripcion">
								<g:message code="ordenSamsung.descripcion.label" default="Descripcion" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="descripcion" autocomplete="off" required="" value="${ordenSamsungInstance?.descripcion}"/>
						</div>

						<div class="fieldcontain">
							<label for="tipoFalla">
								<g:message code="ordenSamsung.tipoFalla.label" default="Tipo Falla" />
							</label>
							<g:select id="tipoFalla" name="tipoFalla.id" from="${mx.com.ideasydiseno.electronica.TipoFalla.list()}" optionKey="id" value="" class="many-to-one"/>
						</div>

						<div class="fieldcontain">
							<label for="descFalla">
								<g:message code="ordenSamsung.descFalla.label" default="Descripción Falla" />
							</label>
							<g:textField name="descFalla" value=""/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'aplicaGarantia', 'error')} ">
							<label for="aplicaGarantia">
								<g:message code="personal.aplicaGarantia.label" default="Aplica Garantia" />
							</label>
							<g:checkBox name="aplicaGarantia" value="${personalInstance?.aplicaGarantia}" />
						</div>

						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'observaciones', 'error')} ">
							<label for="observaciones">
								<g:message code="ordenSamsung.observaciones.label" default="Observaciones" />

							</label>
							<g:textArea name="observaciones" autocomplete="off" value="${ordenSamsungInstance?.observaciones}" rows="3" cols="40"/>
						</div>

					</div>

					<div class="form-right">
						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'solucion', 'error')} ">
							<label for="solucion">
								<g:message code="ordenSamsung.solucion.label" default="Solucion" />

							</label>
							<g:textArea name="solucion" value="${ordenSamsungInstance?.solucion}" rows="3" cols="40"/>
						</div>
						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'noOrdenServicio', 'error')} ">
							<label for="noOrdenServicio">
								<g:message code="ordenSamsung.noOrdenServicio.label" default="No Orden Servicio" />

							</label>
							<g:textField name="noOrdenServicio" value="${ordenSamsungInstance?.noOrdenServicio}"/>
						</div>
						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'status', 'error')} required">
							<label for="status">
								<g:message code="ordenSamsung.status.label" default="Status" />
								<span class="required-indicator">*</span>
							</label>
							<g:select name="status" from="${ordenSamsungInstance.constraints.status.inList}" required="" value="${ordenSamsungInstance?.status}" valueMessagePrefix="ordenSamsung.status"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'sucursal', 'error')} required">
							<label for="sucursal">
								<g:message code="ordenSamsung.sucursal.label" default="Sucursal" />
								<span class="required-indicator">*</span>
							</label>
							<g:select id="sucursal" name="sucursal.id" from="${mx.com.ideasydiseno.electronica.Sucursal.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.sucursal?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'tienda', 'error')} required">
							<label for="tienda">
								<g:message code="ordenSamsung.tienda.label" default="Tienda" />
								<span class="required-indicator">*</span>
							</label>
							<g:select id="tienda" name="tienda.id" from="${mx.com.ideasydiseno.electronica.Tienda.list()}" optionKey="id" required="" value="${ordenSamsungInstance?.tienda?.id}" class="many-to-one"/>
						</div>
						<div class="fieldcontain">
							<label for="costoRevision">
								<g:message code="ordenSamsung.costoRevision.label" default="Costo Revision" />
							</label>
							<g:field type="number" name="costoRevision"  autocomplete="off" value="0"/>
						</div>

						<div class="fieldcontain">
							<label for="anticipo">
								<g:message code="ordenSamsung.anticipo.label" default="Anticipo" />
							</label>
							<g:field type="number" name="anticipo" autocomplete="off"  value="0"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'total', 'error')} required">
							<label for="total">
								<g:message code="ordenSamsung.total.label" default="Total" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" name="total" required=""  autocomplete="off" value="${fieldValue(bean: ordenSamsungInstance, field: 'total')}"/>
						</div>

						<g:if test="${ordenSamsungInstance?.id}">

							<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'fallas', 'error')} ">
								<label for="fallas">
									<g:message code="ordenSamsung.fallas.label" default="Fallas" />

								</label>

							<ul class="one-to-many">
							<g:each in="${ordenSamsungInstance?.fallas?}" var="f">
							    <li><g:link controller="falla" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
							</g:each>
							<li class="add">
							<g:link controller="falla" action="create" params="['ordenSamsung.id': ordenSamsungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'falla.label', default: 'Falla')])}</g:link>
							</li>
							</ul>

							</div>

							<div class="fieldcontain ${hasErrors(bean: ordenSamsungInstance, field: 'fechas', 'error')} ">
								<label for="fechas">
									<g:message code="ordenSamsung.fechas.label" default="Fechas" />

								</label>

							<ul class="one-to-many">
							<g:each in="${ordenSamsungInstance?.fechas?}" var="f">
							    <li><g:link controller="detalleFechaOrden" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
							</g:each>
							<li class="add">
							<g:link controller="detalleFechaOrden" action="create" params="['ordenSamsung.id': ordenSamsungInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden')])}</g:link>
							</li>
							</ul>

							</div>
						</g:if>

					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<input type="button" class="search" value="Buscar Cliente" onclick="overlayClient()" />
				</fieldset>
			</g:form>

			<div id="overlayClient">
				<div>
					<p>
				  	<g:formRemote name="from_form" url="[controller:'cliente', action:'clienteOrden']" onSuccess="responseClienteOrden(data)">
					  	<fieldset class="forms">
					  		<div class="form-left">

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
									</label>
									<g:textField name="telefono" value=""/>
								</div>
								</g:if>

								<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'sexo', 'error')} required">
									<label for="sexo">
										<g:message code="cliente.sexo.label" default="Sexo" />
										<span class="required-indicator">*</span>
									</label>
									<g:select name="sexo" from="${clienteInstance.constraints.sexo.inList}" required="" value="${clienteInstance?.sexo}" valueMessagePrefix="cliente.sexo"/>
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
					  		</div>

					  		<div class="form-right">
								<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'municipio.estado.pais', 'error')} required">
									<label for="pais">
										<g:message code="usuario.pais.label" default="Pais" />
									</label>
									<g:select id="pais" name="municipio.estado.pais.id" from="${mx.com.ideasydiseno.electronica.Pais.list()}" optionKey="id" required="" value="${clienteInstance?.colonia?.municipio?.estado?.pais?.id}" class="many-to-one" />
								</div>

								<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'municipio.estado', 'error')} required">
									<label for="estado">
										<g:message code="usuario.estado.label" default="Estado" />
									</label>
									<g:select id="estado" name="municipio.estado.id" from="${clienteInstance?.colonia?.municipio?.estado?.pais?.estados}" optionKey="id" required="" value="${clienteInstance?.colonia?.municipio?.estado?.id}" class="many-to-one" />
								</div>

								<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'municipio', 'error')} required">
									<label for="municipio">
										<g:message code="usuario.municipio.label" default="Municipio" />
									</label>
									<g:select id="municipio" name="municipio.id" from="${clienteInstance?.colonia?.municipio?.estado?.municipios}" optionKey="id" required="" value="${clienteInstance?.colonia?.municipio?.id}" class="many-to-one"/>
								</div>

								<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'colonia', 'error')} ">
									<label for="colonia">
										<g:message code="tienda.colonia.label" default="Colonia" />

									</label>
									<g:select id="colonia" name="colonia.id" from="${clienteInstance?.colonia?.municipio?.colonias}" optionKey="id" value="${clienteInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
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
									<g:textField name="codigoPostal" value="${clienteInstance?.codigoPostal}" maxlength="50" />
								</div>

								<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'noExt', 'error')} ">
									<label for="noExt">
										<g:message code="cliente.noExt.label" default="No Ext" />

									</label>
									<g:textField name="noExt" value="${clienteInstance?.noExt}"/>
								</div>

								%{-- <div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'noInt', 'error')} ">
									<label for="noInt">
										<g:message code="cliente.noInt.label" default="No Int" />

									</label>
									<g:textField name="noInt" value="${clienteInstance?.noInt}"/>
								</div> --}%


					  		</div>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="saveIcon" value="${message(code: 'default.button.ready.label', default: 'Listo')}" />
							<input type="button" class="closeIcon" value="Cerrar" onclick="overlayClient()" />
						</fieldset>
					</g:formRemote>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>
