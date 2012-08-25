package mx.com.ideasydiseno.electronica

class Marca {
	String nombreMarca

    static constraints = {
    	nombreMarca blank:false, unique:true
    }

    String toString(){
        return "${nombreMarca}"
    }
}
