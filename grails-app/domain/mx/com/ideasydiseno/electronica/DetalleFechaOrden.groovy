package mx.com.ideasydiseno.electronica

class DetalleFechaOrden extends DetalleFecha{

	static belongsTo = [orden: Orden]

    static constraints = {
    }
}
