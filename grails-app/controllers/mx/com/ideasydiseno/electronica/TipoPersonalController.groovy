package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class TipoPersonalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [tipoPersonalInstanceList: TipoPersonal.list(params)]
    }

    def create() {
        [tipoPersonalInstance: new TipoPersonal(params)]
    }

    def save() {
        def tipoPersonalInstance = new TipoPersonal(params)
        if (!tipoPersonalInstance.save(flush: true)) {
            render(view: "create", model: [tipoPersonalInstance: tipoPersonalInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tipoPersonal.label', default: 'TipoPersonal'), tipoPersonalInstance.id])
        redirect(action: "show", id: tipoPersonalInstance.id)
    }

    def show() {
        def tipoPersonalInstance = TipoPersonal.get(params.id)
        if (!tipoPersonalInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPersonal.label', default: 'TipoPersonal'), params.id])
            redirect(action: "list")
            return
        }

        [tipoPersonalInstance: tipoPersonalInstance]
    }

    def edit() {
        def tipoPersonalInstance = TipoPersonal.get(params.id)
        if (!tipoPersonalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPersonal.label', default: 'TipoPersonal'), params.id])
            redirect(action: "list")
            return
        }

        [tipoPersonalInstance: tipoPersonalInstance]
    }

    def update() {
        def tipoPersonalInstance = TipoPersonal.get(params.id)
        if (!tipoPersonalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPersonal.label', default: 'TipoPersonal'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tipoPersonalInstance.version > version) {
                tipoPersonalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoPersonal.label', default: 'TipoPersonal')] as Object[],
                          "Another user has updated this TipoPersonal while you were editing")
                render(view: "edit", model: [tipoPersonalInstance: tipoPersonalInstance])
                return
            }
        }

        tipoPersonalInstance.properties = params

        if (!tipoPersonalInstance.save(flush: true)) {
            render(view: "edit", model: [tipoPersonalInstance: tipoPersonalInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoPersonal.label', default: 'TipoPersonal'), tipoPersonalInstance.id])
        redirect(action: "show", id: tipoPersonalInstance.id)
    }

    def delete() {
        def tipoPersonalInstance = TipoPersonal.get(params.id)
        if (!tipoPersonalInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPersonal.label', default: 'TipoPersonal'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tipoPersonalInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoPersonal.label', default: 'TipoPersonal'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoPersonal.label', default: 'TipoPersonal'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
