package mx.com.ideasydiseno.electronica

class TipoFecha {

	String tipoFecha
	int ordenCronologico
	String tipoUso

	static hasMany = [fechas: DetalleFecha]

    static constraints = {
    	tipoFecha blank:false, unique:true
    	ordenCronologico blank:false
    	tipoUso blank:false, inList: ["Orden", "Entrada"]
    }

    String toString(){
        return "${tipoFecha}"
    }
}
