package mx.com.ideasydiseno.electronica

class Proveedor extends Institucion {

	static hasMany = [entradas: Entrada,
					  contactos: ContactoProveedor]

    static constraints = {
    }
}
