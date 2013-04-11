package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class TiendaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [tiendaInstanceList: Tienda.list(params)]
    }

    def create() {
        [tiendaInstance: new Tienda(params)]
    }

    def save() {
        def tiendaInstance = new Tienda(params)
        if (!tiendaInstance.save(flush: true)) {
            render(view: "create", model: [tiendaInstance: tiendaInstance])
            return
        }

         def telefonoInstitucion = new TelefonoInstitucion()
            telefonoInstitucion.tipoTelefono = params.tipoTelefono
            telefonoInstitucion.telefono = params.telefono
            telefonoInstitucion.institucion = tiendaInstance 
            telefonoInstitucion.save(flus:true)

		flash.message = message(code: 'default.created.message', args: [message(code: 'tienda.label', default: 'Tienda'), tiendaInstance.id])
        redirect(action: "show", id: tiendaInstance.id)
    }

    def show() {
        def tiendaInstance = Tienda.get(params.id)
        if (!tiendaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tienda.label', default: 'Tienda'), params.id])
            redirect(action: "list")
            return
        }

        [tiendaInstance: tiendaInstance]
    }

    def edit() {
        def tiendaInstance = Tienda.get(params.id)
        if (!tiendaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tienda.label', default: 'Tienda'), params.id])
            redirect(action: "list")
            return
        }

        [tiendaInstance: tiendaInstance]
    }

    def update() {
        def tiendaInstance = Tienda.get(params.id)
        if (!tiendaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tienda.label', default: 'Tienda'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tiendaInstance.version > version) {
                tiendaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tienda.label', default: 'Tienda')] as Object[],
                          "Another user has updated this Tienda while you were editing")
                render(view: "edit", model: [tiendaInstance: tiendaInstance])
                return
            }
        }

        tiendaInstance.properties = params

        if (!tiendaInstance.save(flush: true)) {
            render(view: "edit", model: [tiendaInstance: tiendaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tienda.label', default: 'Tienda'), tiendaInstance.id])
        redirect(action: "show", id: tiendaInstance.id)
    }

    def delete() {
        def tiendaInstance = Tienda.get(params.id)
        if (!tiendaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tienda.label', default: 'Tienda'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tiendaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tienda.label', default: 'Tienda'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tienda.label', default: 'Tienda'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
