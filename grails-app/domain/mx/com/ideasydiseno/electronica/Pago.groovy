package mx.com.ideasydiseno.electronica

class Pago {
	String tipoPago
	double total
	Date fechaPago

    static constraints = {
    	tipoPago blank:false
    	total blank:false
        fechaPago blank:false
    }

    String toString(){
        return "${tipoPago} ${total} ${fechaPago}"
    }
}
