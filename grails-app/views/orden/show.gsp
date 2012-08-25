
<%@ page import="mx.com.ideasydiseno.electronica.Orden" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'orden.label', default: 'Orden')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-orden" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-orden" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list orden">
			
				<g:if test="${ordenInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="orden.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${ordenInstance?.cliente?.id}">${ordenInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.sucursal}">
				<li class="fieldcontain">
					<span id="sucursal-label" class="property-label"><g:message code="orden.sucursal.label" default="Sucursal" /></span>
					
						<span class="property-value" aria-labelledby="sucursal-label"><g:link controller="sucursal" action="show" id="${ordenInstance?.sucursal?.id}">${ordenInstance?.sucursal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.marca}">
				<li class="fieldcontain">
					<span id="marca-label" class="property-label"><g:message code="orden.marca.label" default="Marca" /></span>
					
						<span class="property-value" aria-labelledby="marca-label"><g:link controller="marca" action="show" id="${ordenInstance?.marca?.id}">${ordenInstance?.marca?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.modelo}">
				<li class="fieldcontain">
					<span id="modelo-label" class="property-label"><g:message code="orden.modelo.label" default="Modelo" /></span>
					
						<span class="property-value" aria-labelledby="modelo-label"><g:link controller="modelo" action="show" id="${ordenInstance?.modelo?.id}">${ordenInstance?.modelo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="orden.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${ordenInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.noSerie}">
				<li class="fieldcontain">
					<span id="noSerie-label" class="property-label"><g:message code="orden.noSerie.label" default="No Serie" /></span>
					
						<span class="property-value" aria-labelledby="noSerie-label"><g:fieldValue bean="${ordenInstance}" field="noSerie"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="orden.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${ordenInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="orden.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${ordenInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="orden.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${ordenInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.cobros}">
				<li class="fieldcontain">
					<span id="cobros-label" class="property-label"><g:message code="orden.cobros.label" default="Cobros" /></span>
					
						<g:each in="${ordenInstance.cobros}" var="c">
						<span class="property-value" aria-labelledby="cobros-label"><g:link controller="detalleCobro" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.fallas}">
				<li class="fieldcontain">
					<span id="fallas-label" class="property-label"><g:message code="orden.fallas.label" default="Fallas" /></span>
					
						<g:each in="${ordenInstance.fallas}" var="f">
						<span class="property-value" aria-labelledby="fallas-label"><g:link controller="falla" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.fechas}">
				<li class="fieldcontain">
					<span id="fechas-label" class="property-label"><g:message code="orden.fechas.label" default="Fechas" /></span>
					
						<g:each in="${ordenInstance.fechas}" var="f">
						<span class="property-value" aria-labelledby="fechas-label"><g:link controller="detalleFechaOrden" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.pagos}">
				<li class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="orden.pagos.label" default="Pagos" /></span>
					
						<g:each in="${ordenInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pagoCliente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ordenInstance?.refacciones}">
				<li class="fieldcontain">
					<span id="refacciones-label" class="property-label"><g:message code="orden.refacciones.label" default="Refacciones" /></span>
					
						<g:each in="${ordenInstance.refacciones}" var="r">
						<span class="property-value" aria-labelledby="refacciones-label"><g:link controller="detalleOrden" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ordenInstance?.id}" />
					<g:link class="edit" action="edit" id="${ordenInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
