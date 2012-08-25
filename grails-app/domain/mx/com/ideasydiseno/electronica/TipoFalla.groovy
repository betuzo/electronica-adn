package mx.com.ideasydiseno.electronica

class TipoFalla {

    String tipo

	static hasMany = [fallas: Falla]

    static constraints = {
    	tipo blank:false
    }

    String toString(){
        return "${tipo}"
    }
}
