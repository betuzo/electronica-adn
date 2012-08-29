select 
	od.id,
	od.cliente_id,
	pr.nombre,
	pr.apellido_paterno,
	pr.apellido_materno,
	pr.calle,
	pr.no_ext,
	pr.no_int,
	pr.codigo_postal,
	cl.nombre_completo,
	mp.nombre_completo,
	es.nombre,
	od.sucursal_id,
	sc.nombre,
	od.descripcion,
	od.marca_id,
	mr.nombre_marca,
	od.modelo_id,
	md.nombre_modelo,
	od.no_serie
from 	orden od,
	persona pr,
	colonia cl,
	municipio mp,
	estado es,
	institucion sc,
	marca mr,
	modelo md
where	od.id = $P{idOrden} and
	od.cliente_id = pr.id and
	pr.colonia_id = cl.id and
	cl.municipio_id = mp.id and
	mp.estado_id = es.id and
	od.sucursal_id = sc.id and
	od.marca_id = mr.id and
	od.modelo_id = md.id