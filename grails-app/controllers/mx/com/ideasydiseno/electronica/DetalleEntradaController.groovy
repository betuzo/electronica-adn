package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.*

class DetalleEntradaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [detalleEntradaInstanceList: DetalleEntrada.list(params)]
    }

    def create() {
        [detalleEntradaInstance: new DetalleEntrada(params)]
    }

    def save() {
        def detalleEntradaInstance = new DetalleEntrada(params)
        if (!detalleEntradaInstance.save(flush: true)) {
            render(view: "create", model: [detalleEntradaInstance: detalleEntradaInstance])
            return
        }

        def refaccionAlmacenInstance = new RefaccionAlmacen()
        refaccionAlmacenInstance.almacen = detalleEntradaInstance.entrada.sucursal.almacen
        refaccionAlmacenInstance.refaccion = detalleEntradaInstance.refaccion
        refaccionAlmacenInstance.cantidad = detalleEntradaInstance.cantidad
        refaccionAlmacenInstance.precio =  detalleEntradaInstance.precioUnitario
        refaccionAlmacenInstance.entrada =  detalleEntradaInstance
        if (!refaccionAlmacenInstance.save(flush: true)) {
            println refaccionAlmacenInstance.almacen
            println "No se guardo"              
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada'), detalleEntradaInstance.id])
        redirect(action: "show", id: detalleEntradaInstance.id)
    }

    def show() {
        def detalleEntradaInstance = DetalleEntrada.get(params.id)
        if (!detalleEntradaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada'), params.id])
            redirect(action: "list")
            return
        }

        [detalleEntradaInstance: detalleEntradaInstance]
    }

    def edit() {
        def detalleEntradaInstance = DetalleEntrada.get(params.id)
        if (!detalleEntradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada'), params.id])
            redirect(action: "list")
            return
        }

        [detalleEntradaInstance: detalleEntradaInstance]
    }

    def update() {
        def detalleEntradaInstance = DetalleEntrada.get(params.id)
        if (!detalleEntradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (detalleEntradaInstance.version > version) {
                detalleEntradaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalleEntrada.label', default: 'DetalleEntrada')] as Object[],
                          "Another user has updated this DetalleEntrada while you were editing")
                render(view: "edit", model: [detalleEntradaInstance: detalleEntradaInstance])
                return
            }
        }

        detalleEntradaInstance.properties = params

        if (!detalleEntradaInstance.save(flush: true)) {
            render(view: "edit", model: [detalleEntradaInstance: detalleEntradaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada'), detalleEntradaInstance.id])
        redirect(action: "show", id: detalleEntradaInstance.id)
    }

    def delete() {

        println ("entra a eliminar fecha entrada" +  params);

        def detalleEntradaInstance = DetalleEntrada.get(params.id)
        if (!detalleEntradaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada'), params.id])
            redirect(action: "list")
            return
        }

        try {
            detalleEntradaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalleEntrada.label', default: 'DetalleEntrada'), params.id])
            redirect(action: "show", id: params.id)
        }
        println ("sigue hasta el final del delete");
    }

}
