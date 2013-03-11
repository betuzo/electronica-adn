package mx.com.ideasydiseno.electronica

class Municipio {

	static belongsTo = [estado: Estado]

	String nombre
	String nombreCompleto

	static hasMany = [colonias: Colonia] 

    static constraints = {
    	nombre blank:false
    	nombreCompleto blank:true
	}

    static mapping = {
        colonias sort:'nombreCompleto', order:'asc'
    }

    String toString(){
        return "${nombre}"
    }
}
