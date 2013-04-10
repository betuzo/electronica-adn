package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class RefaccionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [refaccionInstanceList: Refaccion.list(params)]
    }

    def create() {
        [refaccionInstance: new Refaccion(params)]
    }

    def save() {
        def refaccionInstance = new Refaccion(params)
        if (!refaccionInstance.save(flush: true)) {
            render(view: "create", model: [refaccionInstance: refaccionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'refaccion.label', default: 'Refaccion'), refaccionInstance.id])
        redirect(action: "show", id: refaccionInstance.id)
    }

    def show() {
        def refaccionInstance = Refaccion.get(params.id)
        if (!refaccionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'refaccion.label', default: 'Refaccion'), params.id])
            redirect(action: "list")
            return
        }

        [refaccionInstance: refaccionInstance]
    }

    def edit() {
        def refaccionInstance = Refaccion.get(params.id)
        if (!refaccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refaccion.label', default: 'Refaccion'), params.id])
            redirect(action: "list")
            return
        }

        [refaccionInstance: refaccionInstance]
    }

    def update() {
        def refaccionInstance = Refaccion.get(params.id)
        if (!refaccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refaccion.label', default: 'Refaccion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (refaccionInstance.version > version) {
                refaccionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'refaccion.label', default: 'Refaccion')] as Object[],
                          "Another user has updated this Refaccion while you were editing")
                render(view: "edit", model: [refaccionInstance: refaccionInstance])
                return
            }
        }

        refaccionInstance.properties = params

        if (!refaccionInstance.save(flush: true)) {
            render(view: "edit", model: [refaccionInstance: refaccionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'refaccion.label', default: 'Refaccion'), refaccionInstance.id])
        redirect(action: "show", id: refaccionInstance.id)
    }

    def delete() {
        def refaccionInstance = Refaccion.get(params.id)
        if (!refaccionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'refaccion.label', default: 'Refaccion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            refaccionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'refaccion.label', default: 'Refaccion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'refaccion.label', default: 'Refaccion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
