package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class DetalleOrdenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [detalleOrdenInstanceList: DetalleOrden.list(params)]
    }

    def create() {
        [detalleOrdenInstance: new DetalleOrden(params)]
    }

    def save() {
        def detalleOrdenInstance = new DetalleOrden(params)
        if (!detalleOrdenInstance.save(flush: true)) {
            render(view: "create", model: [detalleOrdenInstance: detalleOrdenInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden'), detalleOrdenInstance.id])
        redirect(controller: "ordenSamsung", action: "show", id: detalleOrdenInstance.orden.id)
    }

    def show() {
        def detalleOrdenInstance = DetalleOrden.get(params.id)
        if (!detalleOrdenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden'), params.id])
            redirect(action: "list")
            return
        }

        [detalleOrdenInstance: detalleOrdenInstance]
    }

    def edit() {
        def detalleOrdenInstance = DetalleOrden.get(params.id)
        if (!detalleOrdenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden'), params.id])
            redirect(action: "list")
            return
        }

        [detalleOrdenInstance: detalleOrdenInstance]
    }

    def update() {
        def detalleOrdenInstance = DetalleOrden.get(params.id)
        if (!detalleOrdenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (detalleOrdenInstance.version > version) {
                detalleOrdenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalleOrden.label', default: 'DetalleOrden')] as Object[],
                          "Another user has updated this DetalleOrden while you were editing")
                render(view: "edit", model: [detalleOrdenInstance: detalleOrdenInstance])
                return
            }
        }

        detalleOrdenInstance.properties = params

        if (!detalleOrdenInstance.save(flush: true)) {
            render(view: "edit", model: [detalleOrdenInstance: detalleOrdenInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden'), detalleOrdenInstance.id])
        redirect(controller: "ordenSamsung", action: "show", id: detalleOrdenInstance.orden.id)
    }

    def delete() {
        def detalleOrdenInstance = DetalleOrden.get(params.id)
        if (!detalleOrdenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden'), params.id])
            redirect(action: "list")
            return
        }

        try {
            detalleOrdenInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalleOrden.label', default: 'DetalleOrden'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
