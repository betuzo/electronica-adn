package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.*

class EntradaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    public static final String FECHA_TIPO_ENTRADA = "Entrada"

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [entradaInstanceList: Entrada.list(params), entradaInstanceTotal: Entrada.count()]
    }

    def create() {
        [entradaInstance: new Entrada(params)]
    }

    def save() {
        def user =springSecurityService.currentUser
        

        def entradaInstance = new Entrada(params)
        //println "*****************" + params
        if (!entradaInstance.save(flush: true)) {
            render(view: "create", model: [entradaInstance: entradaInstance])
            return
        }else{
            if (user) {
                def tipoFechaInstance = TipoFecha.findByTipoUso(FECHA_TIPO_ENTRADA)
                println tipoFechaInstance
                if (tipoFechaInstance) {
                    
                    //Guardando Detalle fecha entrada
                    def detalleFechaEntrada = new DetalleFechaEntrada()
                    detalleFechaEntrada.fecha = params.fecha
                    detalleFechaEntrada.personal= user
                    detalleFechaEntrada.tipoFecha= tipoFechaInstance
                    detalleFechaEntrada.entrada = entradaInstance
                    detalleFechaEntrada.save()

                    //Guardando pago
                    println "params ******* " + params
                    if (params.tipoPago != "" && params.totalPago != "0") {
                        def pagoProverdorInstance = new PagoProveedor()
                        pagoProverdorInstance.tipoPago=params.tipoPago
                        pagoProverdorInstance.total=params.totalPago.toLong()
                        pagoProverdorInstance.fechaPago=params.fechaPago
                        pagoProverdorInstance.entrada=entradaInstance
                        pagoProverdorInstance.realizo=user
                        pagoProverdorInstance.save()   
                    }
                    
                    
                }


            }


            flash.message = message(code: 'default.created.message', args: [message(code: 'entrada.label', default: 'Entrada'), entradaInstance.id])
            redirect(action: "show", id: entradaInstance.id)
        }

    }

    def show() {
        def entradaInstance = Entrada.get(params.id)
        if (!entradaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrada.label', default: 'Entrada'), params.id])
            redirect(action: "list")
            return
        }

        [entradaInstance: entradaInstance]
    }

    def edit() {
        def entradaInstance = Entrada.get(params.id)
        if (!entradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrada.label', default: 'Entrada'), params.id])
            redirect(action: "list")
            return
        }

        [entradaInstance: entradaInstance]
    }

    def update() {
        def entradaInstance = Entrada.get(params.id)
        if (!entradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrada.label', default: 'Entrada'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (entradaInstance.version > version) {
                entradaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'entrada.label', default: 'Entrada')] as Object[],
                          "Another user has updated this Entrada while you were editing")
                render(view: "edit", model: [entradaInstance: entradaInstance])
                return
            }
        }

        entradaInstance.properties = params

        if (!entradaInstance.save(flush: true)) {
            render(view: "edit", model: [entradaInstance: entradaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'entrada.label', default: 'Entrada'), entradaInstance.id])
        redirect(action: "show", id: entradaInstance.id)
    }

    def delete() {
        def entradaInstance = Entrada.get(params.id)
        if (!entradaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrada.label', default: 'Entrada'), params.id])
            redirect(action: "list")
            return
        }

        try {
            entradaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'entrada.label', default: 'Entrada'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entrada.label', default: 'Entrada'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    
    def refaccionInstance = new DetalleEntrada()

    def refaccionTable(){
        def htmlRender = ''
        def success = true
        println params

        if (!params) {
            println "parametros diferentes de null"
            refaccionInstance.refaccion = params.refaccion
            refaccionInstance.cantidad = params.cantidad
            refaccionInstance.precioUnitario=params.precioUnitario
            refaccionInstance.total = params.total
        }
        
        

        htmlRender = "<td>hola</td>"

        render ([html:htmlRender] as JSON)
    }

   /* def nextStep() {
        Refaccion refaccion
        int cantidad
        double precioUnitario
        double total


        def success = true
        def next = true
        def htmlRender = ''
        def valStatus = ''

        def ordenSamsungInstance = OrdenSamsung.get(params.id)
        if (!ordenSamsungInstance) {
            success = false
            htmlRender = "<div class='property-value'>No existe la orden</div>"
        }else{
            def user = springSecurityService?.currentUser
            def totalFechas = ordenSamsungInstance.fechas.size()
            def tipoFechaInstance = TipoFecha.findByOrdenCronologicoAndTipoUso(totalFechas + 1, FECHA_TIPO_ORDEN)
            next = hasNext(tipoFechaInstance.ordenCronologico)
            if (!tipoFechaInstance)
            {
                success = false
                htmlRender = "<div class='property-value'>No existe la orden</div>"  
            }
            def detalleFechaOrdenInstance = new DetalleFechaOrden()
            detalleFechaOrdenInstance.tipoFecha = tipoFechaInstance
            detalleFechaOrdenInstance.fecha = new Date()
            detalleFechaOrdenInstance.personal = user
            detalleFechaOrdenInstance.orden = ordenSamsungInstance

            if (!detalleFechaOrdenInstance.save(flush: true)) {
                success = false
                htmlRender = "<div class='property-value'> No se puede guardar la sigueinte Fecha</div>"
            }
            ordenSamsungInstance.fechas.add(detalleFechaOrdenInstance)
            valStatus = detalleFechaOrdenInstance.toString()
        }

        try {
            ordenSamsungInstance.fechas.each {
                htmlRender = htmlRender + "<span class='property-value' aria-labelledby='fechas-label'>" + g.link([controller:"detalleFechaOrden", action:"show", id:it.id], it?.encodeAsHTML())+ "</span>"
            }
        }
        catch(Exception e) {
            e.printStackTrace()
        }

        render([success: success, html: htmlRender, next: next, valStatus: valStatus] as JSON)
    } */

}
