package mx.com.ideasydiseno.electronica

class TelefonoPersona extends Telefono{

	static belongsTo = [persona: Persona]

    static constraints = {
    }
}
