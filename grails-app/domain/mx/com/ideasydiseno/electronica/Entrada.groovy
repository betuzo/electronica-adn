package mx.com.ideasydiseno.electronica

class Entrada {

	Proveedor proveedor
    Sucursal sucursal
	double total
	String status
	String observaciones

    
	static hasMany = [refacciones: DetalleEntrada, 
					  fechas: DetalleFechaEntrada,
					  pagos: PagoProveedor]

    static constraints = {
    	proveedor blank:false
        sucursal blank:false
    	total blank:false
    	status blank:false, inList: ["Abierto", "Cerrado"]
        observaciones blank:true, size:0..50
    }

    String toString(){
        return "${id} ${proveedor} ${status}"
    }
}
