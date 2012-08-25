package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.*

class OrdenSamsungController {

    transient springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ordenSamsungInstanceList: OrdenSamsung.list(params), ordenSamsungInstanceTotal: OrdenSamsung.count()]
    }

    def create() {
        [ordenSamsungInstance: new OrdenSamsung(params), clienteInstance: new Cliente(params)]
    }

    def save() {
        def ordenSamsungInstance = new OrdenSamsung(params)
        if (!ordenSamsungInstance.save(flush: true)) {
            render(view: "create", model: [ordenSamsungInstance: ordenSamsungInstance])
            return
        }

        if (params.costoRevision.toDouble() > 0) {
            def conceptoCobroInstance = ConceptoCobro.findByConcepto('Revision')
            if (conceptoCobroInstance){
                def detalleCobroInstance = new DetalleCobro()
                detalleCobroInstance.orden = ordenSamsungInstance 
                detalleCobroInstance.concepto = conceptoCobroInstance
                detalleCobroInstance.total = params.costoRevision.toDouble()
                detalleCobroInstance.date = new Date()

                if (!detalleCobroInstance.save(flush: true)) {
                    
                    
                }

            }    
        }

        def tipoFallaInstance = TipoFalla.get(params.tipoFalla.id)
        if (tipoFallaInstance) {
            def fallaInstance = new Falla()
            fallaInstance.orden = ordenSamsungInstance
            fallaInstance.tipoFalla = tipoFallaInstance
            fallaInstance.descripcion = params.descFalla

            if (!fallaInstance.save(flush: true)) {
                    
                    
            }
        }
        
        def user = springSecurityService?.currentUser
        if (user) {
            def tipoFechaInstance = TipoFecha.findByTipoFecha('Registro Orden')
            if (tipoFechaInstance) {
                def detalleFechaOrdenInstance = new DetalleFechaOrden()
                detalleFechaOrdenInstance.orden = ordenSamsungInstance
                detalleFechaOrdenInstance.tipoFecha = tipoFechaInstance
                detalleFechaOrdenInstance.fecha = new Date()
                detalleFechaOrdenInstance.personal = user

                if (!detalleFechaOrdenInstance.save(flush: true)) {
                      
                }
            }

            if (params.anticipo.toDouble() > 0) {
                def pagoClienteInstance = new PagoCliente()
                pagoClienteInstance.orden = ordenSamsungInstance
                pagoClienteInstance.recibio = user
                pagoClienteInstance.tipoPago = 'Anticipo'
                pagoClienteInstance.total = params.anticipo.toDouble() 
                pagoClienteInstance.fechaPago = new Date()    

                if (!pagoClienteInstance.save(flush: true)) {
                      
                }
            }
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'ordenSamsung.label', default: 'OrdenSamsung'), ordenSamsungInstance.id])
        redirect(action: "show", id: ordenSamsungInstance.id)
    }

    def show() {
        def ordenSamsungInstance = OrdenSamsung.get(params.id)
        if (!ordenSamsungInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenSamsung.label', default: 'OrdenSamsung'), params.id])
            redirect(action: "list")
            return
        }

        [ordenSamsungInstance: ordenSamsungInstance]
    }

    def edit() {
        def ordenSamsungInstance = OrdenSamsung.get(params.id)
        if (!ordenSamsungInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenSamsung.label', default: 'OrdenSamsung'), params.id])
            redirect(action: "list")
            return
        }

        [ordenSamsungInstance: ordenSamsungInstance]
    }

    def update() {
        def ordenSamsungInstance = OrdenSamsung.get(params.id)
        if (!ordenSamsungInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenSamsung.label', default: 'OrdenSamsung'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ordenSamsungInstance.version > version) {
                ordenSamsungInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ordenSamsung.label', default: 'OrdenSamsung')] as Object[],
                          "Another user has updated this OrdenSamsung while you were editing")
                render(view: "edit", model: [ordenSamsungInstance: ordenSamsungInstance])
                return
            }
        }

        ordenSamsungInstance.properties = params

        if (!ordenSamsungInstance.save(flush: true)) {
            render(view: "edit", model: [ordenSamsungInstance: ordenSamsungInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ordenSamsung.label', default: 'OrdenSamsung'), ordenSamsungInstance.id])
        redirect(action: "show", id: ordenSamsungInstance.id)
    }

    def delete() {
        def ordenSamsungInstance = OrdenSamsung.get(params.id)
        if (!ordenSamsungInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenSamsung.label', default: 'OrdenSamsung'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ordenSamsungInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ordenSamsung.label', default: 'OrdenSamsung'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ordenSamsung.label', default: 'OrdenSamsung'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def nextStep() {
        def success = true
        def htmlRender = '' 

        def ordenSamsungInstance = OrdenSamsung.get(params.id)
        println "orderSamsunginstance" + ordenSamsungInstance
        if (!ordenSamsungInstance) {
            success = false
            htmlRender = "<div class='errorAjax'>No existe la orden</div>"
        }else{
            def user = springSecurityService?.currentUser
            def totalFechas = ordenSamsungInstance.fechas.size()
            def tipoFechaInstance = TipoFecha.findByOrdenCronologico(totalFechas + 1)
            def detalleFechaOrdenInstance = new DetalleFechaOrden()
            detalleFechaOrdenInstance.tipoFecha = tipoFechaInstance
            detalleFechaOrdenInstance.fecha = new Date()
            detalleFechaOrdenInstance.personal = user
            detalleFechaOrdenInstance.orden = ordenSamsungInstance

            if (!detalleFechaOrdenInstance.save(flush: true)) {
                success = false
                htmlRender = "<div class='errorAjax'> No se puede guardar la sigueinte Fecha</div>"
            }
            ordenSamsungInstance.fechas.add(detalleFechaOrdenInstance)
        }

        try {
            ordenSamsungInstance.fechas.each {
                htmlRender = htmlRender + "<span class='property-value' aria-labelledby='fechas-label'>" + g.link([controller:"detalleFechaOrden", action:"show", id:it.id], it?.encodeAsHTML())+ "</span>"
            }
        }
        catch(Exception e) {
            e.printStackTrace()
        }
        
        println htmlRender

        render([success: success, html: htmlRender] as JSON)
    }
}
