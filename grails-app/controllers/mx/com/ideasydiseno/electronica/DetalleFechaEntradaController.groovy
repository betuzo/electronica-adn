package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.*

class DetalleFechaEntradaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [detalleFechaEntradaInstanceList: DetalleFechaEntrada.list(params), detalleFechaEntradaInstanceTotal: DetalleFechaEntrada.count()]
    }

    def create() {
        [detalleFechaEntradaInstance: new DetalleFechaEntrada(params)]
    }

    def save() {
        def detalleFechaEntradaInstance = new DetalleFechaEntrada(params)
        if (!detalleFechaEntradaInstance.save(flush: true)) {
            render(view: "create", model: [detalleFechaEntradaInstance: detalleFechaEntradaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada'), detalleFechaEntradaInstance.id])
        redirect(action: "show", id: detalleFechaEntradaInstance.id)
    }

    def show() {
        def detalleFechaEntradaInstance = DetalleFechaEntrada.get(params.id)
        if (!detalleFechaEntradaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada'), params.id])
            redirect(action: "list")
            return
        }

        [detalleFechaEntradaInstance: detalleFechaEntradaInstance]
    }

    def edit() {
        def detalleFechaEntradaInstance = DetalleFechaEntrada.get(params.id)
        if (!detalleFechaEntradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada'), params.id])
            redirect(action: "list")
            return
        }

        [detalleFechaEntradaInstance: detalleFechaEntradaInstance]
    }

    def update() {
        def detalleFechaEntradaInstance = DetalleFechaEntrada.get(params.id)
        if (!detalleFechaEntradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (detalleFechaEntradaInstance.version > version) {
                detalleFechaEntradaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada')] as Object[],
                          "Another user has updated this DetalleFechaEntrada while you were editing")
                render(view: "edit", model: [detalleFechaEntradaInstance: detalleFechaEntradaInstance])
                return
            }
        }

        detalleFechaEntradaInstance.properties = params

        if (!detalleFechaEntradaInstance.save(flush: true)) {
            render(view: "edit", model: [detalleFechaEntradaInstance: detalleFechaEntradaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada'), detalleFechaEntradaInstance.id])
        redirect(action: "show", id: detalleFechaEntradaInstance.id)
    }

    def delete() {

        println ("entra a eliminar DetalleFechaEntrada: " + params)

        def detalleFechaEntradaInstance = DetalleFechaEntrada.get(params.id)
        if (!detalleFechaEntradaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada'), params.id])
            redirect(action: "list")
            return
        }

        try {
            detalleFechaEntradaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalleFechaEntrada.label', default: 'DetalleFechaEntrada'), params.id])
            redirect(action: "show", id: params.id)
        }

        println ("llega hasta el final")

        def data = 'hola data'

        render ([html:data] as JSON)
    }
}
