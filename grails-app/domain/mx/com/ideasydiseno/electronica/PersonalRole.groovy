package mx.com.ideasydiseno.electronica

import org.apache.commons.lang.builder.HashCodeBuilder

class PersonalRole implements Serializable {

	Personal personal
	Role role

	boolean equals(other) {
		if (!(other instanceof PersonalRole)) {
			return false
		}

		other.personal?.id == personal?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (personal) builder.append(personal.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static PersonalRole get(long personalId, long roleId) {
		find 'from PersonalRole where personal.id=:personalId and role.id=:roleId',
			[personalId: personalId, roleId: roleId]
	}

	static PersonalRole create(Personal personal, Role role, boolean flush = false) {
		new PersonalRole(personal: personal, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(Personal personal, Role role, boolean flush = false) {
		PersonalRole instance = PersonalRole.findByPersonalAndRole(personal, role)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Personal personal) {
		executeUpdate 'DELETE FROM PersonalRole WHERE personal=:personal', [personal: personal]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM PersonalRole WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'personal']
		version false
	}
}
