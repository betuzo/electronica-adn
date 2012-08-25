package mx.com.ideasydiseno.electronica

class Colonia {

	String nombreCompleto

    static belongsTo = [municipio: Municipio]

    static hasMany = [instituciones: Institucion]

    static constraints = {
    	nombreCompleto blank:false
    }

    String toString(){
        return "${nombreCompleto}"
    }
}
