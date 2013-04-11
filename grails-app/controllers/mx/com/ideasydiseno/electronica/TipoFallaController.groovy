package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class TipoFallaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [tipoFallaInstanceList: TipoFalla.list(params)]
    }

    def create() {
        [tipoFallaInstance: new TipoFalla(params)]
    }

    def save() {
        def tipoFallaInstance = new TipoFalla(params)
        if (!tipoFallaInstance.save(flush: true)) {
            render(view: "create", model: [tipoFallaInstance: tipoFallaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tipoFalla.label', default: 'TipoFalla'), tipoFallaInstance.id])
        redirect(action: "show", id: tipoFallaInstance.id)
    }

    def show() {
        def tipoFallaInstance = TipoFalla.get(params.id)
        if (!tipoFallaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoFalla.label', default: 'TipoFalla'), params.id])
            redirect(action: "list")
            return
        }

        [tipoFallaInstance: tipoFallaInstance]
    }

    def edit() {
        def tipoFallaInstance = TipoFalla.get(params.id)
        if (!tipoFallaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoFalla.label', default: 'TipoFalla'), params.id])
            redirect(action: "list")
            return
        }

        [tipoFallaInstance: tipoFallaInstance]
    }

    def update() {
        def tipoFallaInstance = TipoFalla.get(params.id)
        if (!tipoFallaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoFalla.label', default: 'TipoFalla'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tipoFallaInstance.version > version) {
                tipoFallaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoFalla.label', default: 'TipoFalla')] as Object[],
                          "Another user has updated this TipoFalla while you were editing")
                render(view: "edit", model: [tipoFallaInstance: tipoFallaInstance])
                return
            }
        }

        tipoFallaInstance.properties = params

        if (!tipoFallaInstance.save(flush: true)) {
            render(view: "edit", model: [tipoFallaInstance: tipoFallaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoFalla.label', default: 'TipoFalla'), tipoFallaInstance.id])
        redirect(action: "show", id: tipoFallaInstance.id)
    }

    def delete() {
        def tipoFallaInstance = TipoFalla.get(params.id)
        if (!tipoFallaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoFalla.label', default: 'TipoFalla'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tipoFallaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoFalla.label', default: 'TipoFalla'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoFalla.label', default: 'TipoFalla'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
