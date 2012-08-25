package mx.com.ideasydiseno.electronica

class ConceptoCobro {
	
	String concepto

    static constraints = {
    	concepto blank:false, unique:true
    }

    String toString(){
        return "${concepto}"
    }
}
