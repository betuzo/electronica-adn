package mx.com.ideasydiseno.electronica

class Sucursal extends Institucion{

	Almacen almacen

	static hasMany = [personal: Personal, 
				entradas: Entrada,
				ordenes: Orden]

    static constraints = {
    	almacen blank:true, nullable:true
    }
}
