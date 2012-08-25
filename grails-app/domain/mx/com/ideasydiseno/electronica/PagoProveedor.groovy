package mx.com.ideasydiseno.electronica

class PagoProveedor extends Pago {

static belongsTo = [entrada: Entrada]

	Personal realizo

    static constraints = {
    	realizo blank:false
    }

    String toString(){
        return "${super.toString()} ${realizo}"
    }
}
