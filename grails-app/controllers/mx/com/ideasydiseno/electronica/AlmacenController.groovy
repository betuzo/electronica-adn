package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.*

class AlmacenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [almacenInstanceList: Almacen.list(params), almacenInstanceTotal: Almacen.count()]
    }

    def create() {
        [almacenInstance: new Almacen(params)]
    }

    def save() {
        def almacenInstance = new Almacen(params)
        if (!almacenInstance.save(flush: true)) {
            render(view: "create", model: [almacenInstance: almacenInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'almacen.label', default: 'Almacen'), almacenInstance.id])
        redirect(action: "show", id: almacenInstance.id)
    }

    def show() {
        def almacenInstance = Almacen.get(params.id)
        if (!almacenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), params.id])
            redirect(action: "list")
            return
        }

        [almacenInstance: almacenInstance]
    }

    def edit() {
        def almacenInstance = Almacen.get(params.id)
        if (!almacenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), params.id])
            redirect(action: "list")
            return
        }

        [almacenInstance: almacenInstance]
    }

    def update() {
        def almacenInstance = Almacen.get(params.id)
        if (!almacenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (almacenInstance.version > version) {
                almacenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'almacen.label', default: 'Almacen')] as Object[],
                          "Another user has updated this Almacen while you were editing")
                render(view: "edit", model: [almacenInstance: almacenInstance])
                return
            }
        }

        almacenInstance.properties = params

        if (!almacenInstance.save(flush: true)) {
            render(view: "edit", model: [almacenInstance: almacenInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'almacen.label', default: 'Almacen'), almacenInstance.id])
        redirect(action: "show", id: almacenInstance.id)
    }

    def delete() {
        def almacenInstance = Almacen.get(params.id)
        if (!almacenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), params.id])
            redirect(action: "list")
            return
        }

        try {
            almacenInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'almacen.label', default: 'Almacen'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'almacen.label', default: 'Almacen'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def detalleAlmacen(){
        
    }

    def jsonAlmacen(){
        def almacenList = Almacen.findAll()
        def listAlmacen = []
        def mapAlmacen = [:]
        almacenList.each{ it ->
            println "==> Nombre Sucursal: $it.sucursal"
            println "==> Refaccion: $it.refacciones.refaccion"
            println "==> Cantidad: $it.refacciones.cantidad"
            println "==> Precio: $it.refacciones.precio"
            println "==> Nombre Proveedor: $it.refacciones.entrada"
            it.refacciones.eachWithIndex{ref, i ->
                println "refacciones $ref.refaccion.clave - $ref.refaccion.descripcion"
                mapAlmacen.put("sucursal", "sucursal")
                mapAlmacen.put("refaccion","$ref.refaccion.clave - $ref.refaccion.descripcion")
                mapAlmacen.put("cantidad",ref.cantidad)
                mapAlmacen.put("precio",ref.precio)
                mapAlmacen.put("proveedor",ref.entrada.entrada.proveedor.nombre)
                mapAlmacen.put("id",(i + 1) )
                listAlmacen << mapAlmacen
            }
        }
        listAlmacen.each{ it ->
            println "**** lista del mapa "+ it
        }
        render ([html:listAlmacen] as JSON)
    }
}