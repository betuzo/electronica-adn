
<%@ page import="mx.com.ideasydiseno.electronica.OrdenSamsung" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordenSamsung.label', default: 'OrdenSamsung')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:javascript src='jTPS.js'/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jTPS.css')}" type="text/css">
		<g:javascript>

		function addPago(data) {
			console.log("=====> " + data +"  "+data.success);
			if (!data.success){
				alert("Se genero un problema, contacte el area de sistemas...");
			}else{
				$("#add-pago").append(data.html);
				var tipoP = document.getElementById("tipoPago");
				var totalP = document.getElementById("totalPago");
				tipoP.value="";
				totalP.value="";
			}
		}

		function resultNextStep(data) {
			if (!data.success)
				alert("Se genero un problema, contacte el area de sistemas...");
			else{
				if (!data.next)
					$('#nextFechaOrden').hide();
			}

			$("#seccFechas").html(data.html);
			$("#statusOrden").text(data.valStatus);
	    }

	    function addRefaccion(data){
			console.log("=====> refaccion " + data +"  "+data.success);
			if (!data.success){
				alert("Se genero un problema, contacte el area de sistemas...");
			}else{
				if ($('#tableRefacciones >tbody >tr').length == 0){
					$("#tableRefacciones tbody").append(data.html)

				}else{
					$("#tableRefacciones tbody> tr:first").before(data.html);
				}

				$("#cantidadRefaccion").val("");
				$("#precioUnitario").val("");
				$("#totalRefaccion").val(0);

			}
	    }

	    $(document).on("ready", function(){

	    	$('#slide-pagos-open').tooltip('toggle');
	    	$('#nextFechaOrden').tooltip('toggle');


	    	$("#form-pagos").css("display", "none");

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

		$("#nextFechaOrden").on("click", function(){
			$.ajax({
				url:"${request.contextPath}/ordenSamsung/nextStep",
				dataType: "json",
				type:'post',
				data:{id: $('#id').val()},
				cache:false,
				success: function(data){
					console.log("success data: " + data);
					resultNextStep(data);
					console.log("despues del nextstep");

				},
				error: function(data){
					console.log("Error: " + data);
				}
			});
		});


	    	$("#slide-refacciones-open").on("click", function(){
				$("#form-refacciones").slideDown();
			});

			$("#slide-refacciones-close").on("click", function(){
				$("#form-refacciones").slideUp();
			});

			$("#open-modal").on("click", function(){
				var show = ($("#overlay-orden-show").css('visibility') == 'visible' ) ? 'hidden' : 'visible';
				$("#overlay-orden-show").css('visibility', show);
				$("#cantidadRefaccion").val("");
				$("#precio").val("");
				$("#totalRefaccion").val("");

			});

			$("#close-modal").on("click", function(){
				var show = ($("#overlay-orden-show").css('visibility') == 'visible' ) ? 'hidden' : 'visible';
				$("#overlay-orden-show").css('visibility', show);
				$("#cantidadRefaccion").val("");
				$("#precioUnitario").val("");
				$("#totalRefaccion").val("");
			})

			$("#refaccion").on('change', function(){
				$("#cantidadRefaccion").val("");
				$("#precioUnitario").val("");
				$("#totalRefaccion").val("");
				$.ajax({
					url:"${request.contextPath}/refaccionAlmacen/lotesByRefaccion",
					data:{idRefaccion: $('#refaccion').val()},
					cache:false,
					success: function(html) {
			            $("#lotes").html(html);
					},
					error: function(html){
						console.log("Error: " + html);
					}
				});
			});


			$('#precioUnitario').keyup(function () {
				this.value = this.value.replace(/[^0-9\.]/g,'');
				var cantidad = $("#cantidadRefaccion").val();
				var precio = $("#precioUnitario").val();
				var result = parseFloat(cantidad) * parseFloat(precio);
				if (!isNaN(result)){
					$("#totalRefaccion").val(result);
				}else{
					$("#totalRefaccion").val(0);
				}
			});

			$('#cantidadRefaccion').keyup(function () {
				this.value = this.value.replace(/[^0-9]/g,'');
				var cantidad = $("#cantidadRefaccion").val();
				var precio = $("#precioUnitario").val();
				var result = parseFloat(cantidad) * parseFloat(precio);
				if (!isNaN(result)){
					$("#totalRefaccion").val(result);
				}else{
					$("#totalRefaccion").val(0);
				}
				//console.log("lo del nan" + (isNaN(result)));
			});

			$("#totalPago").on('keyup', function(){
				this.value = this.value.replace(/[^0-9\.]/g,'');
			});



			$("#add-modal-refacciones").on("click", function(){
				$.ajax({
					url:"${request.contextPath}/ordenSamsung/addRefaccion",
					dataType:"json",
					type:"post",
					data:{id: $('#id').val(), refaccion:$("#refaccion").val(), lote:$("#lotes").val(), cantidad:$("#cantidadRefaccion").val(), precio: $("#precio").val()},
					cache:false,
					success: function(data){
						$("#tableRefacciones tbody:first").append(data.html)
					},
					error: function(data){
						console.log("Error: " + data);
					}
				});
			});

			$("#refaccion").change();
			/*jTPS*/
				$('#tableRefacciones').jTPS( {perPages:[5,10,20,50,'Todos'],scrollStep:1,scrollDelay:30,
					clickCallback:function () {
						// target table selector
						var table = '#tableRefacciones';
						// store pagination + sort in cookie
						document.cookie = 'jTPS=sortasc:' + $(table + ' .sortableHeader').index($(table + ' .sortAsc')) + ',' +
							'sortdesc:' + $(table + ' .sortableHeader').index($(table + ' .sortDesc')) + ',' +
							'page:' + $(table + ' .pageSelector').index($(table + ' .hilightPageSelector')) + ';';
					}
				});

				// reinstate sort and pagination if cookie exists
				var cookies = document.cookie.split(';');
				for (var ci = 0, cie = cookies.length; ci < cie; ci++) {
					var cookie = cookies[ci].split('=');
					if (cookie[0] == 'jTPS') {
						var commands = cookie[1].split(',');
						for (var cm = 0, cme = commands.length; cm < cme; cm++) {
							var command = commands[cm].split(':');
							if (command[0] == 'sortasc' && parseInt(command[1]) >= 0) {
								$('#tableRefacciones .sortableHeader:eq(' + parseInt(command[1]) + ')').click();
							} else if (command[0] == 'sortdesc' && parseInt(command[1]) >= 0) {
								$('#tableRefacciones .sortableHeader:eq(' + parseInt(command[1]) + ')').click().click();
							} else if (command[0] == 'page' && parseInt(command[1]) >= 0) {
								$('#tableRefacciones .pageSelector:eq(' + parseInt(command[1]) + ')').click();
							}
						}
					}
				}

				// bind mouseover for each tbody row and change cell (td) hover style
				$('#tableRefacciones tbody tr:not(.stubCell)').bind('mouseover mouseout',
					function (e) {
						// hilight the row
						e.type == 'mouseover' ? $(this).children('td').addClass('hilightRow') : $(this).children('td').removeClass('hilightRow');
					}
				);
		});
		</g:javascript>
		<style >
			#tableRefacciones thead th {
				white-space: nowrap;
				overflow-x:hidden;
				padding: 2px;
				font-family: Tahoma;
				font-size: 10pt;
			}

			#tableRefacciones tbody td {
				padding: 2px;
				font-family: Tahoma;
				font-size: 10pt;
			}

			#tableRefacciones tfoot td {
				font-family: Tahoma;
				font-size: 10pt;
			}
		</style>
	</head>
	<body>
		<a href="#show-ordenSamsung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ordenSamsung" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ordenSamsung">

				<g:if test="${ordenSamsungInstance?.maxFecha}">
				<li class="fieldcontain">

					<span id="statusOrden" class="${(fieldValue(bean: ordenSamsungInstance, field: 'status')) == 'Abierto' ? 'property-value-open' : 'property-value-close'}" aria-labelledby="maxFecha-label"><g:fieldValue bean="${ordenSamsungInstance}" field="maxDetalleFecha"/></span>

				</li>
				</g:if>
				<g:if test="${ordenSamsungInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="ordenSamsung.cliente.label" default="Cliente" /></span>

						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${ordenSamsungInstance?.cliente?.id}">${ordenSamsungInstance?.cliente?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.sucursal}">
				<li class="fieldcontain">
					<span id="sucursal-label" class="property-label"><g:message code="ordenSamsung.sucursal.label" default="Sucursal" /></span>

						<span class="property-value" aria-labelledby="sucursal-label"><g:link controller="sucursal" action="show" id="${ordenSamsungInstance?.sucursal?.id}">${ordenSamsungInstance?.sucursal?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.tienda}">
				<li class="fieldcontain">
					<span id="tienda-label" class="property-label"><g:message code="ordenSamsung.tienda.label" default="Tienda" /></span>

						<span class="property-value" aria-labelledby="tienda-label"><g:link controller="tienda" action="show" id="${ordenSamsungInstance?.tienda?.id}">${ordenSamsungInstance?.tienda?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>


				<g:if test="${ordenSamsungInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="ordenSamsung.marca.label" default="Marca" /></span>

						<span class="property-value" aria-labelledby="marca-label"><g:link controller="marca" action="show" id="${ordenSamsungInstance?.marca?.id}">${ordenSamsungInstance?.marca?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.modelo}">
				<li class="fieldcontain">
					<span id="modelo-label" class="property-label"><g:message code="ordenSamsung.modelo.label" default="Modelo" /></span>

						<span class="property-value" aria-labelledby="modelo-label"><g:link controller="modelo" action="show" id="${ordenSamsungInstance?.modelo?.id}">${ordenSamsungInstance?.modelo?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="ordenSamsung.descripcion.label" default="Descripcion" /></span>

						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${ordenSamsungInstance}" field="descripcion"/></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.noSerie}">
				<li class="fieldcontain">
					<span id="noSerie-label" class="property-label"><g:message code="ordenSamsung.noSerie.label" default="No Serie" /></span>

						<span class="property-value" aria-labelledby="noSerie-label"><g:fieldValue bean="${ordenSamsungInstance}" field="noSerie"/></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="ordenSamsung.observaciones.label" default="Observaciones" /></span>

						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${ordenSamsungInstance}" field="observaciones"/></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.noOrdenServicio}">
				<li class="fieldcontain">
					<span id="noOrdenServicio-label" class="property-label"><g:message code="ordenSamsung.noOrdenServicio.label" default="No Orden Servicio" /></span>

						<span class="property-value" aria-labelledby="noOrdenServicio-label"><g:fieldValue bean="${ordenSamsungInstance}" field="noOrdenServicio"/></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.fallas}">
				<li class="fieldcontain">
					<span id="fallas-label" class="property-label"><g:message code="ordenSamsung.fallas.label" default="Fallas" /></span>

						<g:each in="${ordenSamsungInstance.fallas}" var="f">
						<span class="property-value" aria-labelledby="fallas-label"><g:link controller="falla" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.fechas}">
				<li class="fieldcontain">
					<span id="fechas-label" class="property-label"><g:message code="ordenSamsung.fechas.label" default="Fechas" /></span>
						&nbsp; &nbsp; &nbsp;Fecha Orden
						<g:if test="${next}">
							<span id="nextFechaOrden" class="icon-electronicaarrow-right-3"></span>
						</g:if>
						<div id="seccFechas">
						<g:each in="${ordenSamsungInstance.fechas}" var="f">
						<span class="property-value" aria-labelledby="fechas-label"><g:link controller="detalleFechaOrden" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
						</div>

				</li>
				</g:if>

				%{-- <g:if test="${ordenSamsungInstance?.pagos}"> --}%
				<li id="add-pago" class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="ordenSamsung.pagos.label" default="Pagos" /></span>
					&nbsp; &nbsp; &nbsp;Agregar Pagos
						<g:if test="${next}">
							<span id="slide-pagos-open" class="icon-electronicaarrow-down-4"></span>
						</g:if>
						<g:each in="${ordenSamsungInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pagoCliente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				<!--Formulario agregar pagos-->
				<div id="form-pagos" >
					<div class="container-form-overlay">
						<g:formRemote name="formPagosAdd" url="[controller: 'ordenSamsung', action: 'savePagoShow']" onSuccess="addPago(data)" onFailure="addPago(data)">
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

								<g:hiddenField id="idOrdenSamsungPagos" name="idOrdenSamsungPagos" value="${ordenSamsungInstance?.id}" />
							<fieldset class="buttons">
								<div>
									<span class="icon-electronicadisk"></span>
									<g:submitButton name="guardarPago" value="Guardar"></g:submitButton>
									%{-- <g:submitButton name="guardarPago" class="saveIcon" value="Guardar"></g:submitButton> --}%
								</div>
								<div id="slide-pagos-close"><span class="icon-electronicaarrow-up-2"></span> Cerrar</div>
							</fieldset>
						</g:formRemote>
					</div>
				</div>
				%{-- </g:if> --}%

				<g:if test="${ordenSamsungInstance?.cobros}">
				<li class="fieldcontain">
					<span id="cobros-label" class="property-label"><g:message code="ordenSamsung.cobros.label" default="Cobros" /></span>

						<g:each in="${ordenSamsungInstance.cobros}" var="c">
						<span class="property-value" aria-labelledby="cobros-label"><g:link controller="detalleCobro" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="refacciones-label" class="property-label"><g:message code="ordenSamsung.refacciones.label" default="Refacciones" /></span>
					&nbsp; &nbsp; &nbsp; Agregar refacciones <span id="slide-refacciones-open" class="icon-electronicapencil" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on top"></span>
					%{-- <img id="slide-refacciones-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar fecha" height="30px" width="30px"/> --}%
				</li>
				<div id="form-refacciones">
					<table id="tableRefacciones">
						<thead>
							<tr>
								<th>Refaccion</th>

								<th>Precio</th>

								<th>Cantidad</th>

								<th>Total</th>
							</tr>
						</thead>
						<tbody>

							<g:each in="${ordenSamsungInstance?.refacciones?}" status="i" var="detalleOrdenInstance">
								<tr id="delete-detalleOrden-${detalleOrdenInstance.id}">

									<td><g:link controller="detalleOrden" action="show" id="${detalleOrdenInstance.id}">${fieldValue(bean: detalleOrdenInstance, field: "refaccion")}</g:link></td>

									<td>${fieldValue(bean: detalleOrdenInstance, field: "cantidad")}</td>

									<td>${fieldValue(bean: detalleOrdenInstance, field: "precio")}</td>

									<td>${fieldValue(bean: detalleOrdenInstance, field: "total")}</td>

								</tr>
							</g:each>
						</tbody>
						<tfoot class="navGrid">
							<tr>
								<td colspan=7>
									<div class="pagination"></div>
									<div class="paginationTitle">Pag </div>
									<div class="selectPerPage"></div>
									<div class="status"> </div>
									<fieldset class="buttonsGrid">
										<div id="slide-refacciones-close">
											<span class="icon-electronicacross"></span> Cerar</div>
											<g:if test="${next}">
												<div id="open-modal"><span class="icon-electronicasearch"></span> Agregar Refacciones</div>
											</g:if>
									</fieldset>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>

				<g:if test="${ordenSamsungInstance?.totalRefacciones}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="ordenSamsung.total.label" default="Total Refacciones" /></span>

						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${ordenSamsungInstance.totalRefacciones}" type="currency" currencyCode="MXN" /></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.totalCobros}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="ordenSamsung.total.label" default="Total Cobros" /></span>

						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${ordenSamsungInstance.totalCobros}" type="currency" currencyCode="MXN" /></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="ordenSamsung.total.label" default="Total" /></span>

						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${ordenSamsungInstance.total}" type="currency" currencyCode="MXN" /></span>

				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.totalPagos}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="ordenSamsung.total.label" default="Total Pagos" /></span>
						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${ordenSamsungInstance.totalPagos}" type="currency" currencyCode="MXN" /></span>
				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.totalAdeudo}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="ordenSamsung.total.label" default="Total Adeudo" /></span>

						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${ordenSamsungInstance.totalAdeudo}" type="currency" currencyCode="MXN" /></span>
				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" id="id"value="${ordenSamsungInstance?.id}" />
					<g:link class="edit" action="edit" id="${ordenSamsungInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					%{-- <g:if test="${next}">
						<g:submitToRemote id="nextStep" class="edit" url="[controller: 'ordenSamsung', action: 'nextStep']" value="Siguiente" onSuccess="resultNextStep(data)" onFailure="resultNextStep(data)"/>
					</g:if> --}%
					<g:link class="edit" action="generateReportByOrden" id="${ordenSamsungInstance?.id}"><g:message code="default.button.report.label" default="Nota de Venta" /></g:link>
				</fieldset>
			</g:form>

			<div id="overlay-orden-show">
				 %{-- addRefaccion="addRefaccion(data)" --}%
				<g:formRemote name="formRefaccionesAdd" url="[controller: 'ordenSamsung', action: 'addRefaccion']" onSuccess="addRefaccion(data)">
					<div class="container-form-overlay">
						<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'refaccion', 'error')} required">
							<label for="refaccion">
								<g:message code="detalleOrden.refaccion.label" default="Refaccion" />
								<span class="required-indicator">*</span>
							</label>
							<g:select id="refaccion" name="refaccion.id" from="${mx.com.ideasydiseno.electronica.Refaccion.list()}" optionKey="id" required="" value="${detalleOrdenInstance?.refaccion?.id}" class="many-to-one"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'municipiosAlcance', 'error')} ">
							<label for="lotes">
								<g:message code="detalleOrden.lotes.label" default="Lote" />
							</label>
							<g:select name="lotes" from="" optionKey="id" required="" size="3" value="" class="many-to-many"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'cantidad', 'error')} required">
							<label for="cantidad">
								<g:message code="detalleOrden.cantidad.label" default="Cantidad" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" id="cantidadRefaccion" autocomplete="off"  maxlength="9" name="cantidad" required="" value="${fieldValue(bean: detalleOrdenInstance, field: 'cantidad')}"/>
						</div>
						<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'precioUnitario', 'error')} required">
							<label for="precioUnitario">
								<g:message code="detalleOrden.precioUnitario.label"  default="Precio Unitario" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" id="precioUnitario" autocomplete="off" maxlength="9"  name="precioUnitario" required="" value="${fieldValue(bean: detalleOrdenInstance, field: 'precioUnitario')}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'total', 'error')} required">
							<label for="total">
								<g:message code="detalleOrden.total.label" default="Total" />
								<span class="required-indicator">*</span>
							</label>
							<input type="number" id="totalRefaccion" autocomplete="off" disabled="" />
						</div>
						<g:hiddenField id="idOrdenSamsung" name="idOrdenSamsung" value="${ordenSamsungInstance?.id}" />
						<br>
						<div class="fielcontain">
							<fieldset class="buttons">
								<g:submitButton name="guardarRefaccion" class="saveIcon" value="Guardar"></g:submitButton>
								<div id="close-modal" class="closeIcon">Cerrar</div>
							</fieldset>
						</div>
					</div>
				</g:formRemote>
			</div>
		</div>
	</body>
</html>
