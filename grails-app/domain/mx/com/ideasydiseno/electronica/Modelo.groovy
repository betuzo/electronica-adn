package mx.com.ideasydiseno.electronica

class Modelo {
	String nombreModelo

    static constraints = {
    	nombreModelo blank:false, unique:true
    }

    String toString(){
        return "${nombreModelo}"
    }
}
