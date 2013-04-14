package mx.com.ideasydiseno.electronica

class Persona {

	String nombre
	String apellidoPaterno
	String apellidoMaterno
	String sexo
	Colonia colonia
	String calle
	String codigoPostal
	String noExt
	String noInt
	String rfc
	String email
	Date fechaRegistro

	static hasMany = [telefonos: TelefonoPersona]

    static constraints = {
     	nombre blank:false
    	apellidoPaterno blank:false
    	apellidoMaterno blank:true
    	sexo blank:false, inList: ["Femenino", "Masculino"]
    	fechaRegistro blank:false
    	calle blank:true
    	colonia nullable:true
        codigoPostal blank:true
    	noExt blank:true
    	noInt blank:true
    	rfc blank:true
    	email email:true, blank:true
    }

    String toString(){
        return "${nombre} ${apellidoPaterno}"
    }
}
