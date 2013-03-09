package mx.com.ideasydiseno.electronica

class DetalleOrden {

	static belongsTo = [orden: Orden]

	Refaccion refaccion
	int cantidad
	double precio
	double total
	RefaccionAlmacen lote

    static constraints = {
    	refaccion blank:false
    	cantidad blank:false
    	precio blank:false
       	total blank:false
	}

    String toString(){
        return "${refaccion} - ${total}"
    }
}
