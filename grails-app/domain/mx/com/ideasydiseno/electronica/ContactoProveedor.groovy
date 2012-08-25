package mx.com.ideasydiseno.electronica

class ContactoProveedor extends Persona {

	static belongsTo = [proveedor: Proveedor]

    static constraints = {
    }
}
