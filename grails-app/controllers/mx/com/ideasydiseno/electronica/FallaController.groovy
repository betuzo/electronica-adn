package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class FallaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [fallaInstanceList: Falla.list(params)]
    }

    def create() {
        [fallaInstance: new Falla(params)]
    }

    def save() {
        def fallaInstance = new Falla(params)
        if (!fallaInstance.save(flush: true)) {
            render(view: "create", model: [fallaInstance: fallaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'falla.label', default: 'Falla'), fallaInstance.id])
        redirect(action: "show", id: fallaInstance.id)
    }

    def show() {
        def fallaInstance = Falla.get(params.id)
        if (!fallaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'falla.label', default: 'Falla'), params.id])
            redirect(action: "list")
            return
        }

        [fallaInstance: fallaInstance]
    }

    def edit() {
        def fallaInstance = Falla.get(params.id)
        if (!fallaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'falla.label', default: 'Falla'), params.id])
            redirect(action: "list")
            return
        }

        [fallaInstance: fallaInstance]
    }

    def update() {
        def fallaInstance = Falla.get(params.id)
        if (!fallaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'falla.label', default: 'Falla'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (fallaInstance.version > version) {
                fallaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'falla.label', default: 'Falla')] as Object[],
                          "Another user has updated this Falla while you were editing")
                render(view: "edit", model: [fallaInstance: fallaInstance])
                return
            }
        }

        fallaInstance.properties = params

        if (!fallaInstance.save(flush: true)) {
            render(view: "edit", model: [fallaInstance: fallaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'falla.label', default: 'Falla'), fallaInstance.id])
        redirect(action: "show", id: fallaInstance.id)
    }

    def delete() {
        def fallaInstance = Falla.get(params.id)
        if (!fallaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'falla.label', default: 'Falla'), params.id])
            redirect(action: "list")
            return
        }

        try {
            fallaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'falla.label', default: 'Falla'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'falla.label', default: 'Falla'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
