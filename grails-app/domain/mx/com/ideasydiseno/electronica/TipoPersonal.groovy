package mx.com.ideasydiseno.electronica

class TipoPersonal {

	String tipo
	String descripcion

	static hasMany = [personal: Personal]

    static constraints = {
    	tipo blank:false
    	descripcion blank:false
    }

    String toString(){
        return "${tipo}"
    }
}
