package mx.com.ideasydiseno.electronica

class Pais {

	String nombre
	String nombreCompleto

	static hasMany = [estados: Estado]

    static constraints = {
    	nombre blank:false
    	nombreCompleto blank:true
	}

    static mapping = {
        estados sort:'nombre', order:'asc'
    }

    String toString(){
        return "${nombre}"
    }
}
