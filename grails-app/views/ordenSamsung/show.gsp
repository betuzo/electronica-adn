
<%@ page import="mx.com.ideasydiseno.electronica.OrdenSamsung" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordenSamsung.label', default: 'OrdenSamsung')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:javascript>
		function resultNextStep(data) {
			if (!data.success)
				alert("Se genero un problema, contacte el area de sistemas...");
			else{
				if (!data.next)
					$('#nextStep').hide();
			}

			$("#seccFechas").html(data.html);
			$("#statusOrden").text(data.valStatus);
	    }

	    $(document).on("ready", function(){
	    	$("#slide-refacciones-open").on("click", function(){
				$("#form-refacciones").slideDown();
			});

			$("#slide-refacciones-close").on("click", function(){
				$("#form-refacciones").slideUp();
			});

			$("#open-modal").on("click", function(){
				var show = ($("#overlay").css('visibility') == 'visible' ) ? 'hidden' : 'visible'; 
				$("#overlay").css('visibility', show);
				$("#cantidadRefaccion").val("");
				$("#precio").val("");
				$("#totalRefaccion").val(""); 

			});

			$("#close-modal").on("click", function(){
				var show = ($("#overlay").css('visibility') == 'visible' ) ? 'hidden' : 'visible'; 
				$("#overlay").css('visibility', show);
				$("#cantidadRefaccion").val("");
				$("#precioUnitario").val("");
				$("#totalRefaccion").val(""); 
			})

			$("#refaccion").on('change', function(){
				$("#cantidadRefaccion").val("");
				$("#precio").val("");
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

			$("#precio").on('change', function(){
				var cantidad = $("#cantidadRefaccion").val();
				var precio = $("#precio").val();
				var result = parseFloat(cantidad) * parseFloat(precio);
				$("#totalRefaccion").val(result);
			});

			$("#cantidadRefaccion").on("change", function(){
				var cantidad = $("#cantidadRefaccion").val();
				var precio = $("#precio").val();
				var result = parseFloat(cantidad) * parseFloat(precio);
				$("#totalRefaccion").val(result);
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
		});
		</g:javascript>
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

						<div id="seccFechas">
						<g:each in="${ordenSamsungInstance.fechas}" var="f">
						<span class="property-value" aria-labelledby="fechas-label"><g:link controller="detalleFechaOrden" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
						</div>

				</li>
				</g:if>
			
				<g:if test="${ordenSamsungInstance?.pagos}">
				<li class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="ordenSamsung.pagos.label" default="Pagos" /></span>
					
						<g:each in="${ordenSamsungInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pagoCliente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

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
					&nbsp; &nbsp; &nbsp;Agregar refacciones<img id="slide-refacciones-open" href="#" src="${resource(dir: 'images', file: 'Writing.png')}" alt="Agregar fecha" height="30px" width="30px"/>
						<g:each in="${ordenSamsungInstance.refacciones}" var="r">
						<span class="property-value" aria-labelledby="refacciones-label">
							<g:link controller="detalleOrden" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>
							<img id="delete-refacciones" href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar Refacción" height="20px" width="20px"/>
						</span>
						</g:each>
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
								<tr id="delete-detalleEntrada-${detalleOrdenInstance.id}" class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
									<td><g:link controller="detalleEntrada" action="show" id="${detalleEntradaInstance.id}">${fieldValue(bean: detalleOrdenInstance, field: "refaccion")}</g:link></td>
								
									<td>${fieldValue(bean: detalleOrdenInstance, field: "cantidad")}</td>
								
									<td>${fieldValue(bean: detalleOrdenInstance, field: "precio")}</td>
								
									<td>${fieldValue(bean: detalleOrdenInstance, field: "total")}</td>

									<td><img id="detalleEntrada-${detalleOrdenInstance.id}" class="imgDelete" href="#"src="${resource(dir: 'images', file: 'Recycle-Closed.png')}" alt="Eliminar refacciones" height="20px" width="20px"/></td>
								
								</tr>
							</g:each>
						</tbody>
					</table>
					<br>
					<div class="fieldcontain">
						<img id="slide-refacciones-close" href="#" src="${resource(dir: 'images', file: 'Xion.png')}" alt="Cerrar" height="30px" width="30px"/>
						<img id="open-modal" href="#" src="${resource(dir: 'images', file: 'Search.png')}" alt="Buscar Refaccion" height="25px" width="25px"/>
					</div>
				</div>

				<g:if test="${ordenSamsungInstance?.totalCobros}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="ordenSamsung.total.label" default="Total Cobros" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${ordenSamsungInstance.totalCobros}" type="currency" currencyCode="MXN" /></span>
					
				</li>
				</g:if>

				<g:if test="${ordenSamsungInstance?.totalRefacciones}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="ordenSamsung.total.label" default="Total Refacciones" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:formatNumber number="${ordenSamsungInstance.totalRefacciones}" type="currency" currencyCode="MXN" /></span>
					
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
					<g:hiddenField name="id" value="${ordenSamsungInstance?.id}" />
					<g:link class="edit" action="edit" id="${ordenSamsungInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:if test="${next}">
						<g:submitToRemote id="nextStep" class="edit" url="[controller: 'ordenSamsung', action: 'nextStep']" value="Siguiente" onSuccess="resultNextStep(data)" onFailure="resultNextStep(data)"/>
					</g:if>
					<g:link class="edit" action="generateReportByOrden" id="${ordenSamsungInstance?.id}"><g:message code="default.button.report.label" default="Nota de Venta" /></g:link>
				</fieldset>
			</g:form>
			<div id="overlay">
				<div id="overlayContainer">
					<p>
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
							<g:select name="lotes" from="" optionKey="id" size="3" value="" class="many-to-many"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'cantidad', 'error')} required">
							<label for="cantidad">
								<g:message code="detalleOrden.cantidad.label" default="Cantidad" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" id="cantidadRefaccion" name="cantidad" required="" value="${fieldValue(bean: detalleOrdenInstance, field: 'cantidad')}"/>
						</div>
						<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'precio', 'error')} required">
							<label for="precio">
								<g:message code="detalleOrden.precio.label" default="Precio Unitario" />
								<span class="required-indicator">*</span>
							</label>
							<g:field type="number" id="precio" name="precio" required="" value="${fieldValue(bean: detalleOrdenInstance, field: 'precio')}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: detalleOrdenInstance, field: 'total', 'error')} required">
							<label for="total">
								<g:message code="detalleOrden.total.label" default="Total" />
								<span class="required-indicator">*</span>
							</label>
							<input id="totalRefaccion" disable />
						</div>
						<br>
						<div class="fielcontain">
							<fieldset class="buttons">
								<input type="button" id="add-modal-refacciones" class="ready" value="Listo"/> 
								<input type="button" id="close-modal" class="close" value="Cerrar"/>
							</fieldset>
						</div>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>
