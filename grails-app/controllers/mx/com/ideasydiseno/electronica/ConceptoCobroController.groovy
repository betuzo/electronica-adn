package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class ConceptoCobroController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [conceptoCobroInstanceList: ConceptoCobro.list(params)]
    }

    def create() {
        [conceptoCobroInstance: new ConceptoCobro(params)]
    }

    def save() {
        def conceptoCobroInstance = new ConceptoCobro(params)
        if (!conceptoCobroInstance.save(flush: true)) {
            render(view: "create", model: [conceptoCobroInstance: conceptoCobroInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoCobro.label', default: 'ConceptoCobro'), conceptoCobroInstance.id])
        redirect(action: "show", id: conceptoCobroInstance.id)
    }

    def show() {
        def conceptoCobroInstance = ConceptoCobro.get(params.id)
        if (!conceptoCobroInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoCobro.label', default: 'ConceptoCobro'), params.id])
            redirect(action: "list")
            return
        }

        [conceptoCobroInstance: conceptoCobroInstance]
    }

    def edit() {
        def conceptoCobroInstance = ConceptoCobro.get(params.id)
        if (!conceptoCobroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoCobro.label', default: 'ConceptoCobro'), params.id])
            redirect(action: "list")
            return
        }

        [conceptoCobroInstance: conceptoCobroInstance]
    }

    def update() {
        def conceptoCobroInstance = ConceptoCobro.get(params.id)
        if (!conceptoCobroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoCobro.label', default: 'ConceptoCobro'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (conceptoCobroInstance.version > version) {
                conceptoCobroInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'conceptoCobro.label', default: 'ConceptoCobro')] as Object[],
                          "Another user has updated this ConceptoCobro while you were editing")
                render(view: "edit", model: [conceptoCobroInstance: conceptoCobroInstance])
                return
            }
        }

        conceptoCobroInstance.properties = params

        if (!conceptoCobroInstance.save(flush: true)) {
            render(view: "edit", model: [conceptoCobroInstance: conceptoCobroInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'conceptoCobro.label', default: 'ConceptoCobro'), conceptoCobroInstance.id])
        redirect(action: "show", id: conceptoCobroInstance.id)
    }

    def delete() {
        def conceptoCobroInstance = ConceptoCobro.get(params.id)
        if (!conceptoCobroInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoCobro.label', default: 'ConceptoCobro'), params.id])
            redirect(action: "list")
            return
        }

        try {
            conceptoCobroInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'conceptoCobro.label', default: 'ConceptoCobro'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'conceptoCobro.label', default: 'ConceptoCobro'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
