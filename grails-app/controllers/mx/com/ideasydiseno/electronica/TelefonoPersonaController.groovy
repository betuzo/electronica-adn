package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class TelefonoPersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [telefonoPersonaInstanceList: TelefonoPersona.list(params), telefonoPersonaInstanceTotal: TelefonoPersona.count()]
    }

    def create() {
        [telefonoPersonaInstance: new TelefonoPersona(params)]
    }

    def save() {
        def telefonoPersonaInstance = new TelefonoPersona(params)
        if (!telefonoPersonaInstance.save(flush: true)) {
            render(view: "create", model: [telefonoPersonaInstance: telefonoPersonaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona'), telefonoPersonaInstance.id])
        redirect(action: "show", id: telefonoPersonaInstance.id)
    }

    def show() {
        def telefonoPersonaInstance = TelefonoPersona.get(params.id)
        if (!telefonoPersonaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona'), params.id])
            redirect(action: "list")
            return
        }

        [telefonoPersonaInstance: telefonoPersonaInstance]
    }

    def edit() {
        def telefonoPersonaInstance = TelefonoPersona.get(params.id)
        if (!telefonoPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona'), params.id])
            redirect(action: "list")
            return
        }

        [telefonoPersonaInstance: telefonoPersonaInstance]
    }

    def update() {
        def telefonoPersonaInstance = TelefonoPersona.get(params.id)
        if (!telefonoPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (telefonoPersonaInstance.version > version) {
                telefonoPersonaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'telefonoPersona.label', default: 'TelefonoPersona')] as Object[],
                          "Another user has updated this TelefonoPersona while you were editing")
                render(view: "edit", model: [telefonoPersonaInstance: telefonoPersonaInstance])
                return
            }
        }

        telefonoPersonaInstance.properties = params

        if (!telefonoPersonaInstance.save(flush: true)) {
            render(view: "edit", model: [telefonoPersonaInstance: telefonoPersonaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona'), telefonoPersonaInstance.id])
        redirect(action: "show", id: telefonoPersonaInstance.id)
    }

    def delete() {
        def telefonoPersonaInstance = TelefonoPersona.get(params.id)
        if (!telefonoPersonaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona'), params.id])
            redirect(action: "list")
            return
        }

        try {
            telefonoPersonaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'telefonoPersona.label', default: 'TelefonoPersona'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
