package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class RefaccionAlmacenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [refaccionAlmacenInstanceList: RefaccionAlmacen.list(params), refaccionAlmacenInstanceTotal: RefaccionAlmacen.count()]
    }

    def create() {
        [refaccionAlmacenInstance: new RefaccionAlmacen(params)]
    }

    def save() {
        def refaccionAlmacenInstance = new RefaccionAlmacen(params)
        if (!refaccionAlmacenInstance.save(flush: true)) {
            render(view: "create", model: [refaccionAlmacenInstance: refaccionAlmacenInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen'), refaccionAlmacenInstance.id])
        redirect(action: "show", id: refaccionAlmacenInstance.id)
    }

    def show() {
        def refaccionAlmacenInstance = RefaccionAlmacen.get(params.id)
        if (!refaccionAlmacenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen'), params.id])
            redirect(action: "list")
            return
        }

        [refaccionAlmacenInstance: refaccionAlmacenInstance]
    }

    def edit() {
        def refaccionAlmacenInstance = RefaccionAlmacen.get(params.id)
        if (!refaccionAlmacenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen'), params.id])
            redirect(action: "list")
            return
        }

        [refaccionAlmacenInstance: refaccionAlmacenInstance]
    }

    def update() {
        def refaccionAlmacenInstance = RefaccionAlmacen.get(params.id)
        if (!refaccionAlmacenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (refaccionAlmacenInstance.version > version) {
                refaccionAlmacenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen')] as Object[],
                          "Another user has updated this RefaccionAlmacen while you were editing")
                render(view: "edit", model: [refaccionAlmacenInstance: refaccionAlmacenInstance])
                return
            }
        }

        refaccionAlmacenInstance.properties = params

        if (!refaccionAlmacenInstance.save(flush: true)) {
            render(view: "edit", model: [refaccionAlmacenInstance: refaccionAlmacenInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen'), refaccionAlmacenInstance.id])
        redirect(action: "show", id: refaccionAlmacenInstance.id)
    }

    def delete() {
        def refaccionAlmacenInstance = RefaccionAlmacen.get(params.id)
        if (!refaccionAlmacenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen'), params.id])
            redirect(action: "list")
            return
        }

        try {
            refaccionAlmacenInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'refaccionAlmacen.label', default: 'RefaccionAlmacen'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def lotesByRefaccion = {
        def refaccion = Refaccion.get(params.idRefaccion)
        def lotes = RefaccionAlmacen.findAllByRefaccion(refaccion)

        println "Lotes debug ${lotes}"

        render g.select(optionKey: 'id', 
                        from: lotes, 
                        id: 'lotes', 
                        name: 'lotes.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: '')
    }
}
