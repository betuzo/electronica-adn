package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class TelefonoInstitucionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [telefonoInstitucionInstanceList: TelefonoInstitucion.list(params)]
    }

    def create() {
        [telefonoInstitucionInstance: new TelefonoInstitucion(params)]
    }

    def save() {
        println params
        def telefonoInstitucionInstance = new TelefonoInstitucion(params)
        if (!telefonoInstitucionInstance.save(flush: true)) {
            render(view: "create", model: [telefonoInstitucionInstance: telefonoInstitucionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion'), telefonoInstitucionInstance.id])
        redirect(action: "show", id: telefonoInstitucionInstance.id)
    }

    def show() {
        def telefonoInstitucionInstance = TelefonoInstitucion.get(params.id)
        if (!telefonoInstitucionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion'), params.id])
            redirect(action: "list")
            return
        }

        [telefonoInstitucionInstance: telefonoInstitucionInstance]
    }

    def edit() {
        def telefonoInstitucionInstance = TelefonoInstitucion.get(params.id)
        if (!telefonoInstitucionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion'), params.id])
            redirect(action: "list")
            return
        }

        [telefonoInstitucionInstance: telefonoInstitucionInstance]
    }

    def update() {
        def telefonoInstitucionInstance = TelefonoInstitucion.get(params.id)
        if (!telefonoInstitucionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (telefonoInstitucionInstance.version > version) {
                telefonoInstitucionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion')] as Object[],
                          "Another user has updated this TelefonoInstitucion while you were editing")
                render(view: "edit", model: [telefonoInstitucionInstance: telefonoInstitucionInstance])
                return
            }
        }

        telefonoInstitucionInstance.properties = params

        if (!telefonoInstitucionInstance.save(flush: true)) {
            render(view: "edit", model: [telefonoInstitucionInstance: telefonoInstitucionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion'), telefonoInstitucionInstance.id])
        redirect(action: "show", id: telefonoInstitucionInstance.id)
    }

    def delete() {
        def telefonoInstitucionInstance = TelefonoInstitucion.get(params.id)
        if (!telefonoInstitucionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            telefonoInstitucionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'telefonoInstitucion.label', default: 'TelefonoInstitucion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
