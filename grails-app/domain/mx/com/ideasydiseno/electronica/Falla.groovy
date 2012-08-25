package mx.com.ideasydiseno.electronica

class Falla {

    static belongsTo = [orden: Orden]

	TipoFalla tipoFalla
	String descripcion

    static constraints = {
    	tipoFalla blank:false
        descripcion blank:true, size:0..50
    }

    String toString(){
        return "${tipoFalla}"
    }
}
