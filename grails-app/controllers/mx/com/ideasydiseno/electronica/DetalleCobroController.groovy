package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class DetalleCobroController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [detalleCobroInstanceList: DetalleCobro.list(params), detalleCobroInstanceTotal: DetalleCobro.count()]
    }

    def create() {
        [detalleCobroInstance: new DetalleCobro(params)]
    }

    def save() {
        def detalleCobroInstance = new DetalleCobro(params)
        if (!detalleCobroInstance.save(flush: true)) {
            render(view: "create", model: [detalleCobroInstance: detalleCobroInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro'), detalleCobroInstance.id])
        redirect(action: "show", id: detalleCobroInstance.id)
    }

    def show() {
        def detalleCobroInstance = DetalleCobro.get(params.id)
        if (!detalleCobroInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro'), params.id])
            redirect(action: "list")
            return
        }

        [detalleCobroInstance: detalleCobroInstance]
    }

    def edit() {
        def detalleCobroInstance = DetalleCobro.get(params.id)
        if (!detalleCobroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro'), params.id])
            redirect(action: "list")
            return
        }

        [detalleCobroInstance: detalleCobroInstance]
    }

    def update() {
        def detalleCobroInstance = DetalleCobro.get(params.id)
        if (!detalleCobroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (detalleCobroInstance.version > version) {
                detalleCobroInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalleCobro.label', default: 'DetalleCobro')] as Object[],
                          "Another user has updated this DetalleCobro while you were editing")
                render(view: "edit", model: [detalleCobroInstance: detalleCobroInstance])
                return
            }
        }

        detalleCobroInstance.properties = params

        if (!detalleCobroInstance.save(flush: true)) {
            render(view: "edit", model: [detalleCobroInstance: detalleCobroInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro'), detalleCobroInstance.id])
        redirect(action: "show", id: detalleCobroInstance.id)
    }

    def delete() {
        def detalleCobroInstance = DetalleCobro.get(params.id)
        if (!detalleCobroInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro'), params.id])
            redirect(action: "list")
            return
        }

        try {
            detalleCobroInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalleCobro.label', default: 'DetalleCobro'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
