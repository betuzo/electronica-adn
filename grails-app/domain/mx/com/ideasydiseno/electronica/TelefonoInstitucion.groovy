package mx.com.ideasydiseno.electronica

class TelefonoInstitucion extends Telefono{

	static belongsTo = [institucion: Institucion]

    static constraints = {
    }
}
