package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class TipoFechaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoFechaInstanceList: TipoFecha.list(params), tipoFechaInstanceTotal: TipoFecha.count()]
    }

    def create() {
        [tipoFechaInstance: new TipoFecha(params)]
    }

    def save() {
        def tipoFechaInstance = new TipoFecha(params)
        if (!tipoFechaInstance.save(flush: true)) {
            render(view: "create", model: [tipoFechaInstance: tipoFechaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tipoFecha.label', default: 'TipoFecha'), tipoFechaInstance.id])
        redirect(action: "show", id: tipoFechaInstance.id)
    }

    def show() {
        def tipoFechaInstance = TipoFecha.get(params.id)
        if (!tipoFechaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoFecha.label', default: 'TipoFecha'), params.id])
            redirect(action: "list")
            return
        }

        [tipoFechaInstance: tipoFechaInstance]
    }

    def edit() {
        def tipoFechaInstance = TipoFecha.get(params.id)
        if (!tipoFechaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoFecha.label', default: 'TipoFecha'), params.id])
            redirect(action: "list")
            return
        }

        [tipoFechaInstance: tipoFechaInstance]
    }

    def update() {
        def tipoFechaInstance = TipoFecha.get(params.id)
        if (!tipoFechaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoFecha.label', default: 'TipoFecha'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tipoFechaInstance.version > version) {
                tipoFechaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoFecha.label', default: 'TipoFecha')] as Object[],
                          "Another user has updated this TipoFecha while you were editing")
                render(view: "edit", model: [tipoFechaInstance: tipoFechaInstance])
                return
            }
        }

        tipoFechaInstance.properties = params

        if (!tipoFechaInstance.save(flush: true)) {
            render(view: "edit", model: [tipoFechaInstance: tipoFechaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoFecha.label', default: 'TipoFecha'), tipoFechaInstance.id])
        redirect(action: "show", id: tipoFechaInstance.id)
    }

    def delete() {
        def tipoFechaInstance = TipoFecha.get(params.id)
        if (!tipoFechaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoFecha.label', default: 'TipoFecha'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tipoFechaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoFecha.label', default: 'TipoFecha'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoFecha.label', default: 'TipoFecha'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
