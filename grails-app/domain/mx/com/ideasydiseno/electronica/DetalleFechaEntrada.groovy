package mx.com.ideasydiseno.electronica

class DetalleFechaEntrada extends DetalleFecha{

	static belongsTo = [entrada: Entrada]

    static constraints = {
    }
}
