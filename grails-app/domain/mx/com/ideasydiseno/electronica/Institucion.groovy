package mx.com.ideasydiseno.electronica

class Institucion {

	String nombre
	String descripcion
	Date fechaRegistro
	Colonia colonia
	String calle
	String codigoPostal
	String noExt
	String noInt
	String referencias
	String email

	static hasMany = [telefonos: TelefonoInstitucion]

    static constraints = {
     	nombre blank:false
    	descripcion blank:false
    	fechaRegistro blank:false
    	calle blank:true
    	colonia nullable:true
        codigoPostal blank:true
    	noExt blank:true
    	noInt blank:true
    	referencias blank:true, size:0..50
    	email email:true, blank:true
    }

    String toString(){
        return "${nombre}"
    }
}
