package mx.com.ideasydiseno.electronica

class Orden {

	Cliente cliente
	Sucursal sucursal 
	Tienda tienda
	Marca marca
	Modelo modelo
	String descripcion
	String noSerie
	String observaciones
	String solucion
	double total
	String status
	boolean aplicaGarantia

	static hasMany = [fechas: DetalleFechaOrden,
					  refacciones: DetalleOrden,
					  fallas: Falla,
					  cobros: DetalleCobro,
					  pagos: PagoCliente]

    static constraints = {
    	cliente blank:false
    	sucursal blank:false
    	marca blank:true
    	modelo blank:true
    	descripcion blank:false
    	noSerie blank:false
    	total blank:false
    	status blank:false, inList: ["Abierto", "Cerrado"]
        observaciones blank:true, size:0..50
    }

    String toString(){
        return "${id} ${cliente} ${status}"
    }
}
