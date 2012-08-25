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

    String toString(){
        return "${nombre}"
    }
}
