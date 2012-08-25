package mx.com.ideasydiseno.electronica

class OrdenSamsung extends Orden{

    String noOrdenServicio

    static constraints = {
    	noOrdenServicio blank:true
    }
}
