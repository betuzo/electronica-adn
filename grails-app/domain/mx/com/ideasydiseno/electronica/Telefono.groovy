package mx.com.ideasydiseno.electronica

class Telefono {
	String tipoTelefono
	String telefono

    static constraints = {
    	tipoTelefono blank:false
    	telefono blank:false
    }

    String toString(){
        return "${telefono} ${tipoTelefono}"
    }
}
