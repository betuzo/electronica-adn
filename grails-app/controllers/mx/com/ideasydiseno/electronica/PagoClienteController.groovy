package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class PagoClienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [pagoClienteInstanceList: PagoCliente.list(params)]
    }

    def create() {
        [pagoClienteInstance: new PagoCliente(params)]
    }

    def save() {
        params.fechaPago = new Date()
        def pagoClienteInstance = new PagoCliente(params)
        if (!pagoClienteInstance.save(flush: true)) {
            render(view: "create", model: [pagoClienteInstance: pagoClienteInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'pagoCliente.label', default: 'PagoCliente'), pagoClienteInstance.id])
        redirect(controller: "ordenSamsung", action: "show", id: pagoClienteInstance.orden.id)
    }

    def show() {
        def pagoClienteInstance = PagoCliente.get(params.id)
        if (!pagoClienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoCliente.label', default: 'PagoCliente'), params.id])
            redirect(action: "list")
            return
        }

        [pagoClienteInstance: pagoClienteInstance]
    }

    def edit() {
        def pagoClienteInstance = PagoCliente.get(params.id)
        if (!pagoClienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoCliente.label', default: 'PagoCliente'), params.id])
            redirect(action: "list")
            return
        }

        [pagoClienteInstance: pagoClienteInstance]
    }

    def update() {
        def pagoClienteInstance = PagoCliente.get(params.id)
        if (!pagoClienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoCliente.label', default: 'PagoCliente'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pagoClienteInstance.version > version) {
                pagoClienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pagoCliente.label', default: 'PagoCliente')] as Object[],
                          "Another user has updated this PagoCliente while you were editing")
                render(view: "edit", model: [pagoClienteInstance: pagoClienteInstance])
                return
            }
        }

        pagoClienteInstance.properties = params

        if (!pagoClienteInstance.save(flush: true)) {
            render(view: "edit", model: [pagoClienteInstance: pagoClienteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'pagoCliente.label', default: 'PagoCliente'), pagoClienteInstance.id])
        redirect(controller: "ordenSamsung", action: "show", id: pagoClienteInstance.orden.id)
    }

    def delete() {
        def pagoClienteInstance = PagoCliente.get(params.id)
        if (!pagoClienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagoCliente.label', default: 'PagoCliente'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pagoClienteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pagoCliente.label', default: 'PagoCliente'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pagoCliente.label', default: 'PagoCliente'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
