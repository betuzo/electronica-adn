package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class OrdenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [ordenInstanceList: Orden.list(params)]
    }

    def create() {
        [ordenInstance: new Orden(params)]
    }

    def save() {
        def ordenInstance = new Orden(params)
        if (!ordenInstance.save(flush: true)) {
            render(view: "create", model: [ordenInstance: ordenInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'orden.label', default: 'Orden'), ordenInstance.id])
        redirect(action: "show", id: ordenInstance.id)
    }

    def show() {
        def ordenInstance = Orden.get(params.id)
        def controllerName = ''
        def packageName = "class mx.com.ideasydiseno.electronica"
        if (ordenInstance) {
            switch(ordenInstance.class) {
                case "${packageName}.OrdenDimove":
                    controllerName = "ordenDimove"
                break
                case "${packageName}.OrdenAoc":
                    controllerName = "ordenAoc"
                break
                case "${packageName}.OrdenElektra":
                    controllerName = "ordenElektra"
                break
                case "${packageName}.OrdenPanasonic":
                    controllerName = "ordenPanasonic"
                break
                case "${packageName}.OrdenSamsung":
                    controllerName = "ordenSamsung"
                break
            }
            redirect(controller: controllerName, action: "show", params: params)
        }
    }

    def edit() {
        def ordenInstance = Orden.get(params.id)
        if (!ordenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orden.label', default: 'Orden'), params.id])
            redirect(action: "list")
            return
        }

        [ordenInstance: ordenInstance]
    }

    def update() {
        def ordenInstance = Orden.get(params.id)
        if (!ordenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orden.label', default: 'Orden'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ordenInstance.version > version) {
                ordenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'orden.label', default: 'Orden')] as Object[],
                          "Another user has updated this Orden while you were editing")
                render(view: "edit", model: [ordenInstance: ordenInstance])
                return
            }
        }

        ordenInstance.properties = params

        if (!ordenInstance.save(flush: true)) {
            render(view: "edit", model: [ordenInstance: ordenInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'orden.label', default: 'Orden'), ordenInstance.id])
        redirect(action: "show", id: ordenInstance.id)
    }

    def delete() {
        def ordenInstance = Orden.get(params.id)
        if (!ordenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'orden.label', default: 'Orden'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ordenInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'orden.label', default: 'Orden'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'orden.label', default: 'Orden'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
