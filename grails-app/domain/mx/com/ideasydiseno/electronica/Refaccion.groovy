package mx.com.ideasydiseno.electronica

class Refaccion {

	String clave
	String descripcion

	static hasMany = [compras: DetalleEntrada,
					  ordenes: DetalleOrden,
					  lotesAlmacen: RefaccionAlmacen]

    static constraints = {
    	clave blank:false
    	descripcion blank:true
    }

    String toString(){
        return "${clave} - ${descripcion}"
    }
}
