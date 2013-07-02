
package mx.com.ideasydiseno.electronica

class DetalleEntrada {

        static belongsTo = [entrada: Entrada]

        Refaccion refaccion
        int cantidad
        double precioUnitario
        double total

        static constraints = {
            entrada blank:false
            refaccion blank:false
            cantidad blank:false
            precioUnitario blank:false
            total blank:false
        }

        String toString(){
            //return "${refaccion} ${cantidad} ${total}"
            return "${refaccion}"
        }
}
