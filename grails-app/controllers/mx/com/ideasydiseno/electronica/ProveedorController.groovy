package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class ProveedorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [proveedorInstanceList: Proveedor.list(params)]
    }

    def create() {
        [proveedorInstance: new Proveedor(params)]
    }

    def save() {
        println "param *********  " + params
        def user =springSecurityService.currentUser
        params.fechaRegistro = new Date()

        println " " +new Date() 

        def proveedorInstance = new Proveedor(params)
        if (!proveedorInstance.save(flush: true)) {
            render(view: "create", model: [proveedorInstance: proveedorInstance])
            return
        }else{
            if (user) {
                println "aquí los params: " + params
                println "parametros insitutcion: " + proveedorInstance
                println "telefono: " + params.telefono
                println "Tipo telefono: " + params.tipoTelefono
                //guardando telefonoIstitucion
                def telefonoInstitucion = new TelefonoInstitucion()
                telefonoInstitucion.tipoTelefono = params.tipoTelefono
                telefonoInstitucion.telefono = params.telefono
                telefonoInstitucion.institucion = proveedorInstance 
                telefonoInstitucion.save(flus:true)


            }

        }


		flash.message = message(code: 'default.created.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), proveedorInstance.id])
        redirect(action: "show", id: proveedorInstance.id)

    }

    def show() {
        def proveedorInstance = Proveedor.get(params.id)
        if (!proveedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), params.id])
            redirect(action: "list")
            return
        }

        [proveedorInstance: proveedorInstance]
    }

    def edit() {
        def proveedorInstance = Proveedor.get(params.id)
        if (!proveedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), params.id])
            redirect(action: "list")
            return
        }

        [proveedorInstance: proveedorInstance]
    }

    def update() {
        def proveedorInstance = Proveedor.get(params.id)
        if (!proveedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (proveedorInstance.version > version) {
                proveedorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'proveedor.label', default: 'Proveedor')] as Object[],
                          "Another user has updated this Proveedor while you were editing")
                render(view: "edit", model: [proveedorInstance: proveedorInstance])
                return
            }
        }

        proveedorInstance.properties = params

        if (!proveedorInstance.save(flush: true)) {
            render(view: "edit", model: [proveedorInstance: proveedorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), proveedorInstance.id])
        redirect(action: "show", id: proveedorInstance.id)
    }

    def delete() {
        def proveedorInstance = Proveedor.get(params.id)
        if (!proveedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), params.id])
            redirect(action: "list")
            return
        }

        try {
            proveedorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
