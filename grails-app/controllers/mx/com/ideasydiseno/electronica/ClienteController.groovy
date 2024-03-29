package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.*

class ClienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [clienteInstanceList: Cliente.list(params)]
    }

    def clienteOrden() {
        def response = [:]
        def html = ''
        response.exito = "1"

        def query = Cliente.where {
            (nombre == params.nombre && apellidoPaterno == params.apellidoPaterno
               && sexo== params.sexo)
        }

        def results = query.list(sort:"apellidoPaterno")
        println "******* resultados de la busqueda " + results



        if (results.size() == 0)
        {
            params.fechaRegistro = new Date()
            params.noInt = " "
            def clienteInstance = new Cliente(params)
            if (!clienteInstance.save(flush: true, failOnError:true)) {
                response.exito = "0"
            }
            response.nuevo = "1"
            response.cliente = clienteInstance
        }else{
            response.nuevo = "0"
            response.cliente = results
        }

        println "response cliente " + response

        response.html = g.select(optionKey: 'id',
                        from: response.cliente,
                        id: 'cliente',
                        name: 'cliente.id',
                        class: 'many-to-one',
                        required: '',
                        value: response.cliente.id)
        render response as JSON
    }

    def create() {
        [clienteInstance: new Cliente(params)]
    }

    def save() {
        params.fechaRegistro = new Date()
        def clienteInstance = new Cliente(params)
        if (!clienteInstance.save(flush: true)) {
            render(view: "create", model: [clienteInstance: clienteInstance])
            return
        }

        def telefonoPersonaInstance = new TelefonoPersona()

        telefonoPersonaInstance.persona = clienteInstance
        telefonoPersonaInstance.tipoTelefono = 'Principal'
        telefonoPersonaInstance.telefono = params.telefono

        if (!telefonoPersonaInstance.save(flush: true)) {
            flash.message = message(code: 'default.paidfail.message', args: [clienteInstance.id, params.telefono])
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
        redirect(action: "show", id: clienteInstance.id)
    }

    def show() {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
            return
        }

        [clienteInstance: clienteInstance]
    }

    def edit() {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
            return
        }

        [clienteInstance: clienteInstance]
    }

    def update() {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (clienteInstance.version > version) {
                clienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cliente.label', default: 'Cliente')] as Object[],
                          "Another user has updated this Cliente while you were editing")
                render(view: "edit", model: [clienteInstance: clienteInstance])
                return
            }
        }

        clienteInstance.properties = params

        if (!clienteInstance.save(flush: true)) {
            render(view: "edit", model: [clienteInstance: clienteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
        redirect(action: "show", id: clienteInstance.id)
    }

    def delete() {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
            return
        }

        try {
            clienteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
