package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class PagoProveedorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pagoProveedorInstanceList: PagoProveedor.list(params), pagoProveedorInstanceTotal: PagoProveedor.count()]
    }

    def create() {
        [pagoProveedorInstance: new PagoProveedor(params)]
    }

    def save() {
        def pagoProveedorInstance = new PagoProveedor(params)
        if (!pagoProveedorInstance.save(flush: true)) {
            render(view: "create", model: [pagoProveedorInstance: pagoProveedorInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor'), pagoProveedorInstance.id])
        redirect(action: "show", id: pagoProveedorInstance.id)
    }

    def show() {
        def pagoProveedorInstance = PagoProveedor.get(params.id)
        if (!pagoProveedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        [pagoProveedorInstance: pagoProveedorInstance]
    }

    def edit() {
        def pagoProveedorInstance = PagoProveedor.get(params.id)
        if (!pagoProveedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        [pagoProveedorInstance: pagoProveedorInstance]
    }

    def update() {
        def pagoProveedorInstance = PagoProveedor.get(params.id)
        if (!pagoProveedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pagoProveedorInstance.version > version) {
                pagoProveedorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pagoProveedor.label', default: 'PagoProveedor')] as Object[],
                          "Another user has updated this PagoProveedor while you were editing")
                render(view: "edit", model: [pagoProveedorInstance: pagoProveedorInstance])
                return
            }
        }

        pagoProveedorInstance.properties = params

        if (!pagoProveedorInstance.save(flush: true)) {
            render(view: "edit", model: [pagoProveedorInstance: pagoProveedorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor'), pagoProveedorInstance.id])
        redirect(action: "show", id: pagoProveedorInstance.id)
    }

    def delete() {
        def pagoProveedorInstance = PagoProveedor.get(params.id)
        if (!pagoProveedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pagoProveedorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pagoProveedor.label', default: 'PagoProveedor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
