package mx.com.ideasydiseno.electronica

class DetalleCobro {

    static belongsTo = [orden: Orden]

	ConceptoCobro concepto
	double total
	Date date

    static constraints = {
    	concepto blank:false
    	total blank:false
    	date nullable:false
    }

    String toString(){
        return "${concepto} - \$ ${total}"
    }
}
