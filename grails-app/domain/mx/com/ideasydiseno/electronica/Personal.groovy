package mx.com.ideasydiseno.electronica

class Personal extends Persona{

	transient springSecurityService

	TipoPersonal tipoPersonal
	Sucursal sucursal
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [compras: DetalleFechaEntrada,
					  ordenes: DetalleFechaOrden]

	static constraints = {
		username blank: false, unique: true
		password blank: false
		tipoPersonal blank: false
    	sucursal blank:false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		PersonalRole.findAllByPersonal(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	String toString(){
        return "${super.toString()} ${tipoPersonal}"
    }
}
