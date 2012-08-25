package mx.com.ideasydiseno.electronica

class Almacen {

	static belongsTo = [sucursal: Sucursal]

	static hasMany = [refacciones: RefaccionAlmacen]

    static constraints = {
    }

    String toString(){
        return "Almacen: ${sucursal}"
    }
}
