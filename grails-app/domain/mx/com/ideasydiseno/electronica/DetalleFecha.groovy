package mx.com.ideasydiseno.electronica

class DetalleFecha {
	TipoFecha tipoFecha
	Date fecha
	Personal personal

    static constraints = {
    	tipoFecha blank:false
    	fecha blank:false
    	personal blank:false
    }

    String toString(){
        def formattedDate = fecha.format('yyyy-MM-dd')
        return "${tipoFecha} ${formattedDate} ${personal}"
    }

    static mapping = {
        sort fecha: "desc"
    }
}

