package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class DetalleFechaOrdenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [detalleFechaOrdenInstanceList: DetalleFechaOrden.list(params), detalleFechaOrdenInstanceTotal: DetalleFechaOrden.count()]
    }

    def create() {
        [detalleFechaOrdenInstance: new DetalleFechaOrden(params)]
    }

    def save() {
        def detalleFechaOrdenInstance = new DetalleFechaOrden(params)
        if (!detalleFechaOrdenInstance.save(flush: true)) {
            render(view: "create", model: [detalleFechaOrdenInstance: detalleFechaOrdenInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden'), detalleFechaOrdenInstance.id])
        redirect(action: "show", id: detalleFechaOrdenInstance.id)
    }

    def show() {
        def detalleFechaOrdenInstance = DetalleFechaOrden.get(params.id)
        if (!detalleFechaOrdenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden'), params.id])
            redirect(action: "list")
            return
        }

        [detalleFechaOrdenInstance: detalleFechaOrdenInstance]
    }

    def edit() {
        def detalleFechaOrdenInstance = DetalleFechaOrden.get(params.id)
        if (!detalleFechaOrdenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden'), params.id])
            redirect(action: "list")
            return
        }

        [detalleFechaOrdenInstance: detalleFechaOrdenInstance]
    }

    def update() {
        def detalleFechaOrdenInstance = DetalleFechaOrden.get(params.id)
        if (!detalleFechaOrdenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (detalleFechaOrdenInstance.version > version) {
                detalleFechaOrdenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden')] as Object[],
                          "Another user has updated this DetalleFechaOrden while you were editing")
                render(view: "edit", model: [detalleFechaOrdenInstance: detalleFechaOrdenInstance])
                return
            }
        }

        detalleFechaOrdenInstance.properties = params

        if (!detalleFechaOrdenInstance.save(flush: true)) {
            render(view: "edit", model: [detalleFechaOrdenInstance: detalleFechaOrdenInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden'), detalleFechaOrdenInstance.id])
        redirect(action: "show", id: detalleFechaOrdenInstance.id)
    }

    def delete() {
        def detalleFechaOrdenInstance = DetalleFechaOrden.get(params.id)
        if (!detalleFechaOrdenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden'), params.id])
            redirect(action: "list")
            return
        }

        try {
            detalleFechaOrdenInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalleFechaOrden.label', default: 'DetalleFechaOrden'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
