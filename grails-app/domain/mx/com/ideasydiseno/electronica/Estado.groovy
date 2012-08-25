package mx.com.ideasydiseno.electronica

class Estado {

	static belongsTo = [pais: Pais]

	String nombre
	String abreviatura

	static hasMany = [municipios: Municipio] 

    static constraints = {
    	nombre blank:false
    	abreviatura blank:true
	}

    String toString(){
        return "${nombre}"
    }
}
