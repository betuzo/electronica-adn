package mx.com.ideasydiseno.electronica

class OrdenSamsung extends Orden{

    String noOrdenServicio

  	Date getMaxFecha() { fechas?.fecha?.max() }
    
    static transients = ['maxFecha']

    static constraints = {
    	noOrdenServicio blank:true
    }
}
