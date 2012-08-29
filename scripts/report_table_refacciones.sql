select
	dor.orden_id,
	dor.id,
	dor.refaccion_id,
	r.clave,
	r.descripcion,
	dor.cantidad,
	dor.precio,
	dor.total
from detalle_orden dor,
	refaccion r
where 	dor.orden_id = $P{idOrden} and 
	dor.refaccion_id = r.id;