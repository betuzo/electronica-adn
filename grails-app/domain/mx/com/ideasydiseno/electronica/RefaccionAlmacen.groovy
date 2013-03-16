package mx.com.ideasydiseno.electronica

class RefaccionAlmacen {

	static belongsTo = [almacen: Almacen]

	Refaccion refaccion
	int cantidad
	double precio
    DetalleEntrada entrada

	static hasMany = [salidas: DetalleOrden]
    
    static constraints = {
    	refaccion blank:false
    	cantidad blank:false
    	precio blank:false
    }

    String toString(){
        return "Lote: ${id} ${refaccion} ${cantidad} ${precio} ${entrada?.entrada?.proveedor}"
    }
}
