<%@ page import="mx.com.ideasydiseno.electronica.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript>
			var caja = document.getElementById('totalPago');
			var text = document.getElementById('tipoPago');
			document.getElementById('form-pagos').style.display='none';
			document.getElementById('form-refacciones').style.display='none';
			text.value = " ";
			caja.value = 0;

			function overlay() {
				el = document.getElementById("overlay");
				el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
			}

			function obtenerElemento() { 
			alert("hola por que no pasa por aqui");
				alert(" hola  " +  document.getElementById('cantidad').value);
			}

			$(document).ready(function(){
				$("#slide-pagos-open").click(function(){
					text.value = "";
					caja.value = "";
					$("#form-pagos").slideDown();
				});
				
				$("#slide-pagos-close").click(function(){
					$("#form-pagos").slideUp();
					text.value = " ";
					caja.value = 0;
				});

				$("#slide-refacciones-open").click(function(){
					$("#form-refacciones").slideDown();
				});
				
				$("#slide-refacciones-close").click(function(){
					$("#form-refacciones").slideUp();
				});

				$("#open-modal").click(function(){
					el = document.getElementById("overlay");
					el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
				}); 
			});



						num=0;
			function crear(obj) {
				num++;
				fi = document.getElementById('fiel'); // 1
				contenedor = document.createElement('div'); // 2
				contenedor.id = 'div'+num; // 3

				fi.appendChild(contenedor); // 4
				lbl = document.createElement('label');
				lbl.innerHTML = 'Refaccion: ';
				lbl.setAttribute('class', 'label-refacciones')
				contenedor.appendChild(lbl);

				ele = document.createElement('select'); // 5
				ele.name = 'refaccion'+num; // 6
				ele.setAttribute('class', 'many-to-one');
				
				ele.setAttribute('optionKey','id');
				ele.setAttribute('value','${detalleEntradaInstance?.refaccion?.id}');
				ele.value='${detalleEntradaInstance?.refaccion?.id}';
				lbl.appendChild(ele);
				contenedor.appendChild(ele); // 7

				lbl = document.createElement('label');
				lbl.innerHTML = 'Cantidad: ';
				contenedor.appendChild(lbl);
				ele = document.createElement('input'); // 5
				ele.type = 'text'; // 6
				ele.name = 'cantidad'+num; // 6
				ele.size='6';
				lbl.appendChild(ele);
				contenedor.appendChild(ele); // 7

				lbl = document.createElement('label');
				lbl.innerHTML = 'Precio';
				contenedor.appendChild(lbl);
				ele = document.createElement('input'); // 5
				ele.type = 'text'; // 6
				ele.name = 'precio'+num; // 6
				ele.size='6';
				lbl.appendChild(ele);
				contenedor.appendChild(ele); // 7

				lbl = document.createElement('label');
				lbl.innerHTML = 'Total: ';
				contenedor.appendChild(lbl);
				ele = document.createElement('input'); // 5
				ele.type = 'text'; // 6
				ele.name = 'total'+num; // 6
				ele.size='6';
				lbl.appendChild(ele);
				contenedor.appendChild(ele); // 7



				ele = document.createElement('input'); // 5
				ele.type = 'button'; // 6
				ele.value = 'Eliminar'; // 8
				ele.name = 'div'+num; // 8
				ele.size='6';
				ele.onclick = function () {borrar(this.name)} // 9
				contenedor.appendChild(ele); // 7
			}

			function borrar(obj) {
				fi = document.getElementById('fiel'); // 1
				fi.removeChild(document.getElementById(obj)); // 10
			}
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
						<g:field type="number" name="total" required="" value="${fieldValue(bean: entradaInstance, field: 'total')}"/>
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

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'fechas', 'error')} ">
						<label for="fechas">
							<g:message code="entrada.fechas.label" default="Fecha" />	
						</label>
						<g:datePicker name="fecha" precision="day"  value="${detalleFechaEntradaInstance?.fecha}"  />
					</div>

<!-- form pagos -->
					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'pagos', 'error')} ">
						<label for="pagos">
							<g:message code="entrada.pagos.label" default="Pagos" />
						</label>
						<!-- <g:link controller="pagoProveedor" action="create" params="['entrada.id': entradaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor')])}</g:link> -->
						Agregar pagos <img id="slide-pagos-open" href="#"src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar Pagos" height="30px" width="30px"/>
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
								<g:field type="number" required="" name="totalPago" value="${fieldValue(bean: pagoProveedorInstance, field: 'total')}"/>
							</div>

							<div class="fieldcontain ${hasErrors(bean: pagoProveedorInstance, field: 'fechaPago', 'error')} required">
								<label for="fechaPago">
									<g:message code="pagoProveedor.fechaPago.label" default="Fecha Pago" />
									<span class="required-indicator">*</span>
								</label>
								<g:datePicker name="fechaPago" precision="day"  value="${pagoProveedorInstance?.fechaPago}"  />
							</div>
							<div class="fieldcontain">
								<img id="slide-pagos-close" href="#" src="${resource(dir: 'images', file: 'Xion.png')}" alt="Agregar Pagos" height="30px" width="30px"/>
							</div>

						</div>
						
					</div>

					<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'refacciones', 'error')} ">
						<label for="refacciones">
							<g:message code="entrada.refacciones.label" default="Refacciones" />
						</label>
						Agregar refacciones <img id="slide-refacciones-open" href="#"src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar refacciones" height="30px" width="30px"/> 
						<div id= "form-refacciones">
						<br>
							<div id="fiel">
								<input type="button" value="Generar Acción" onclick="crear(this)" />
							</div>
						<br>
						<div class="fieldcontain">
							<img id="slide-refacciones-close" href="#" src="${resource(dir: 'images', file: 'Xion.png')}" alt="Cerrar" height="30px" width="30px"/>
							<img id="open-modal" href="#"src="${resource(dir: 'images', file: 'Search.png')}" alt="Buscar Refaccion" height="30px" width="30px"/>
						</div>

						</div>

					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			<br>
			<div id="fiel">
			<input type="button" value="Generar Acción" onclick="crear(this)" />
			</div>
			<br>
<!-- Agregar refacciones -->
			<div id="overlay">
				<div id="overlayContainer">
					<p>
						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'refaccion', 'error')} required">
							<label for="refaccion">
								<g:message code="detalleEntrada.refaccion.label" default="Refaccion" />
								<span class="required-indicator">*</span>
							</label>
							<g:select id="refaccion" name="refaccion.id" from="${mx.com.ideasydiseno.electronica.Refaccion.list()}" optionKey="id" required="" value="${detalleEntradaInstance?.refaccion?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'cantidad', 'error')} required">
							<label for="cantidad">
								<g:message code="detalleEntrada.cantidad.label" default="Cantidad" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'cantidad')}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'precioUnitario', 'error')} required">
							<label for="precioUnitario">
								<g:message code="detalleEntrada.precioUnitario.label" default="Precio Unitario" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" name="precioUnitario" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'precioUnitario')}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleEntradaInstance, field: 'total', 'error')} required">
							<label for="total">
								<g:message code="detalleEntrada.total.label" default="Total" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" name="total" required="" value="${fieldValue(bean: detalleEntradaInstance, field: 'total')}"/>
						</div>
						<br>
						<div class="fielcontain">
						<fieldset class="buttons">
							<input type="button" id="agregar-refaccion" class="ready" value="Listo" onClick="obtenerElemento()"/>
							<input type="button" id="open-modal" class="close" value="Cerrar" onclick="overlay()" />
						</fieldset>
						</div>
						
					</p>
				</div>
			</div>

		</div>
	</body>
</html>
