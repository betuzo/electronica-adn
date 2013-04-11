package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class PersonalRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [personalRoleInstanceList: PersonalRole.list(params)]
    }

    def create() {
        [personalRoleInstance: new PersonalRole(params)]
    }

    def save() {
        def personalRoleInstance = new PersonalRole(params)
        if (!personalRoleInstance.save(flush: true)) {
            render(view: "create", model: [personalRoleInstance: personalRoleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'personalRole.label', default: 'PersonalRole'), personalRoleInstance.id])
        redirect(action: "show", id: personalRoleInstance.id)
    }

    def show() {
        def personalRoleInstance = PersonalRole.get(params.id)
        if (!personalRoleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'personalRole.label', default: 'PersonalRole'), params.id])
            redirect(action: "list")
            return
        }

        [personalRoleInstance: personalRoleInstance]
    }

    def edit() {
        def personalRoleInstance = PersonalRole.get(params.id)
        if (!personalRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personalRole.label', default: 'PersonalRole'), params.id])
            redirect(action: "list")
            return
        }

        [personalRoleInstance: personalRoleInstance]
    }

    def update() {
        def personalRoleInstance = PersonalRole.get(params.id)
        if (!personalRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personalRole.label', default: 'PersonalRole'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (personalRoleInstance.version > version) {
                personalRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'personalRole.label', default: 'PersonalRole')] as Object[],
                          "Another user has updated this PersonalRole while you were editing")
                render(view: "edit", model: [personalRoleInstance: personalRoleInstance])
                return
            }
        }

        personalRoleInstance.properties = params

        if (!personalRoleInstance.save(flush: true)) {
            render(view: "edit", model: [personalRoleInstance: personalRoleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'personalRole.label', default: 'PersonalRole'), personalRoleInstance.id])
        redirect(action: "show", id: personalRoleInstance.id)
    }

    def delete() {
        def personalRoleInstance = PersonalRole.get(params.id)
        if (!personalRoleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'personalRole.label', default: 'PersonalRole'), params.id])
            redirect(action: "list")
            return
        }

        try {
            personalRoleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'personalRole.label', default: 'PersonalRole'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'personalRole.label', default: 'PersonalRole'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
