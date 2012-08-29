<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'dimove_icon.png')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'dimove_icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'dimove_icon.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:javascript src='jquery-1.7.1.min.js'/>
		<g:javascript>
			$(document).ready(function() { 	
				$('#pais').ready(function() {
					$("#pais").change();
				});
			    $("#pais").change(function() {
			    	$.ajax({
			        	url: "/electronica-adn/address/paisSelected",
			            data: { id: this.value, idEstado: $("#estado").val() },
			            cache: false,
			            success: function(html) {
			            	$("#estado").html(html);
			            	$("#estado").change();
			            }
			        });
			    });
			    $("#estado").change(function() {
			    	$.ajax({
			        	url: "/electronica-adn/address/estadoSelected",
			            data: { id: this.value, idMunicipio: $("#municipio").val() },
			            cache: false,
			            success: function(html) {
			            	$("#municipio").html(html);
			            	$("#municipio").change();
			            }
			        });
			    });
			    $("#municipio").change(function() {
			    	$.ajax({
			        	url: "/electronica-adn/address/municipioSelected",
			            data: { id: this.value, idColonia: $("#colonia").val() },
			            cache: false,
			            success: function(html) {
			            	$("#colonia").html(html);
			            }
			        });
			    });
			});
		</g:javascript>
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="#"><img src="${resource(dir: 'images', file: 'dimove_logo.png')}" alt="Grails" height="120px" width="500px"/></a></div>

		<div id="header">
			<div id="menu">
				<nav id="nav">
					<ul id="navigation">
						<li><g:link class="first" controller='ordenSamsung' action='create'>Levantar orden</g:link></li>
						<li><a href="#">Admin Ventas &raquo;</a>
							<ul>
								<li><g:link controller='cliente'>Cliente</g:link></li>
								<li><g:link controller='detalleCobro'>Detalle Cobro</g:link></li>
							</ul>				
						</li>
						<li><a href="#">Almacen &raquo;</a>
							<ul>
								<li><g:link controller='proveedor'>Proveedor</g:link></li>
								<li><g:link controller='entrada'>Entrada proveedor</g:link></li>
								<li><g:link controller='contactoProveedor'>Contacto proveedor</g:link></li>
								<li><g:link controller='almacen'>Almacen</g:link></li>
								<li><g:link controller='refaccion'>Refacciones</g:link></li>
								<li><g:link controller='refaccionAlmacen'>Refaccion - Almacen</g:link></li>

							</ul>				
						</li>
						<li><a href="#">Admin General &raquo;</a>
							<ul>
								<li><g:link controller='pais'>Pais</g:link></li>
								<li><g:link controller='estado'>Estado</g:link></li>
								<li><g:link controller='municipio'>Municipio</g:link></li>
								<li><g:link controller='colonia'>Colonia</g:link></li>
								<li><g:link controller='conceptoCobro'>conceptoCobro</g:link></li>
								<li><g:link controller='marca'>Marca</g:link></li>
								<li><g:link controller='modelo'>Modelo</g:link></li>	

							</ul>				
						</li>
						<li><a href="#">Administrador &raquo;</a>
							<ul>
								<li><g:link controller='personal'>Usuario</g:link></li>
								<li><g:link controller='role'>Rol</g:link></li>
								<li><g:link controller='personalRole'>Asig Seguridad</g:link></li>
								<li><g:link controller='requestmap'>Config Seguridad</g:link></li>
							</ul>				
						</li>
						<sec:ifLoggedIn>
						<li><g:link class="last" controller='logout'>Salir | <img src="${resource(dir: 'images', file: 'usr.png')}" alt="Usuario" heigth="18px" width="18px"/> <sec:username /></g:link></li>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
								<li><g:link class="last" controller='login' action='auth'>Entrar | <img src="${resource(dir: 'images', file: 'usr.png')}" alt="Usuario" heigth="18px" width="18px"/></g:link></li>
						</sec:ifNotLoggedIn>
					</ul>
				</nav>
			</div>
		</div>

		<div id="container">
			<div id="page">
				<br>
				<g:layoutBody/>
				<div class="footer" role="contentinfo"> Electronica Dimove, Efren Rebolledo #150 col. Centro Actopan Hgo, México</div>
				<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
				<g:javascript library="application"/>
		        <r:layoutResources />
			</div>
			
		</div>	
	</body>
</html>