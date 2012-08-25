package mx.com.ideasydiseno.electronica

class PagoCliente extends Pago{

	static belongsTo = [orden: Orden]

	Personal recibio

    static constraints = {
    	recibio blank:false
    }

    String toString(){
        return "${super.toString()} ${recibio}"
    }
}
