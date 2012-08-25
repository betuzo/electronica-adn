package mx.com.ideasydiseno.electronica

class Pais {

	String nombre
	String nombreCompleto

	static hasMany = [estados: Estado] 

    static constraints = {
    	nombre blank:false
    	nombreCompleto blank:true
	}

    String toString(){
        return "${nombre}"
    }
}
