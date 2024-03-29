package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class ContactoProveedorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [contactoProveedorInstanceList: ContactoProveedor.list(params)]
    }

    def create() {
        [contactoProveedorInstance: new ContactoProveedor(params)]
    }

    def save() {
        println "***************************"+params
        params.fechaRegistro = new Date()
        def contactoProveedorInstance = new ContactoProveedor(params)
        if (!contactoProveedorInstance.save(flush: true)) {
            render(view: "create", model: [contactoProveedorInstance: contactoProveedorInstance])
            return
        }

         //guardando telefonoContactoProveedor
         println "telefono: " + params.telefono
        def telefonoProveedor = new TelefonoPersona()
        telefonoProveedor.tipoTelefono = "Principal"
        telefonoProveedor.telefono = params.telefono
        telefonoProveedor.persona = contactoProveedorInstance
        telefonoProveedor.save(flus:true)


        flash.message = message(code: 'default.created.message', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor'), contactoProveedorInstance.id])
        redirect(action: "show", id: contactoProveedorInstance.id)
    }

    def show() {
        def contactoProveedorInstance = ContactoProveedor.get(params.id)
        if (!contactoProveedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        [contactoProveedorInstance: contactoProveedorInstance]
    }

    def edit() {
        def contactoProveedorInstance = ContactoProveedor.get(params.id)
        if (!contactoProveedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        [contactoProveedorInstance: contactoProveedorInstance]
    }

    def update() {
        def contactoProveedorInstance = ContactoProveedor.get(params.id)
        if (!contactoProveedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contactoProveedorInstance.version > version) {
                contactoProveedorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contactoProveedor.label', default: 'ContactoProveedor')] as Object[],
                          "Another user has updated this ContactoProveedor while you were editing")
                render(view: "edit", model: [contactoProveedorInstance: contactoProveedorInstance])
                return
            }
        }

        contactoProveedorInstance.properties = params

        if (!contactoProveedorInstance.save(flush: true)) {
            render(view: "edit", model: [contactoProveedorInstance: contactoProveedorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor'), contactoProveedorInstance.id])
        redirect(action: "show", id: contactoProveedorInstance.id)
    }

    def delete() {
        def contactoProveedorInstance = ContactoProveedor.get(params.id)
        if (!contactoProveedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        try {
            contactoProveedorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contactoProveedor.label', default: 'ContactoProveedor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
