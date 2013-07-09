package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

import org.codehaus.groovy.grails.plugins.jasper.*

import org.apache.commons.io.FileUtils

import grails.converters.*

class OrdenSamsungController {

    transient springSecurityService

    JasperService jasperService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    public static final String FECHA_TIPO_ORDEN = "Orden"

    public static final String ORDEN_CONCEPTO_COBRO_REVISION = "Revision"

    public static final String ORDEN_TIPO_FECHA_REGISTRO = "Registro Orden"

    public static final String ORDEN_PAGO_CLIENTE_ANTICIPO = "Anticipo"

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {

        def listOrdenSamsung = OrdenSamsung.list(params)?.sort{it.getProperty('maxFecha')?.getDate()}

        Collections.reverse(listOrdenSamsung)

        [ordenSamsungInstanceList: listOrdenSamsung]
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
            def conceptoCobroInstance = ConceptoCobro.findByConcepto(ORDEN_CONCEPTO_COBRO_REVISION)
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
            def tipoFechaInstance = TipoFecha.findByTipoFecha(ORDEN_TIPO_FECHA_REGISTRO)
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
                pagoClienteInstance.tipoPago = ORDEN_PAGO_CLIENTE_ANTICIPO
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
        def next
        println "maxFecha: " + ordenSamsungInstance.maxFecha
        if(ordenSamsungInstance.maxFecha != null){
            next = hasNext(ordenSamsungInstance.fechas?.tipoFecha?.ordenCronologico?.max())
        }
        [ordenSamsungInstance: ordenSamsungInstance, next: next]
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

    def hasNext(int ordenCronologico) {
        def maxTipoFecha = TipoFecha.createCriteria().get {
            projections {
                max('ordenCronologico')
            }
            and {
                eq("tipoUso", FECHA_TIPO_ORDEN)
            }
        }
        if (maxTipoFecha == ordenCronologico)
            return false
        else
            return true
    }

    //Agregando refaccion enEntrada Show
    // def addRefaccion={
    //     def htmlRender=''
    //     def success=true
    //     def user =springSecurityService.currentUser
    //     def detalleEntrada = new DetalleOrden()

    //     if (params) {
    //         def entradaInstance = Entrada.get(params.idEntradaRefaccion)

    //         def refaccionInstance = Refaccion.get(params.refaccion.id)
    //         detalleEntrada.entrada= entradaInstance
    //         detalleEntrada.refaccion= refaccionInstance
    //         detalleEntrada.cantidad= params.cantidad  as int
    //         detalleEntrada.precioUnitario = params.precioUnitario as double
    //         detalleEntrada.total = detalleEntrada.cantidad * detalleEntrada.precioUnitario
    //         detalleEntrada.save()
    //     }
    //     htmlRender = "<tr><td><a href=/electronica-adn/detalleEntrada/show/"+detalleEntrada.id+"><spam>"+detalleEntrada+"</<spam></a></td> <td><spam>"+detalleEntrada.precioUnitario+"</spam></td> <td><spam>"+detalleEntrada.cantidad+"</spam></td> <td><spam>"+detalleEntrada.total+"</spam></td></tr>"

    //     render ([html:htmlRender, success:success] as JSON)
    // }

    def nextStep() {
        println "nextStep params: ${params}"
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
            if (!next) {
                println "el next es false " + next
                ordenSamsungInstance.status = 'Cerrado'
                ordenSamsungInstance.save(failOnError:true)

            }

            if (!tipoFechaInstance)
            {
                success = false
                htmlRender = "<div class='property-value'>No existe la Orden</div>"
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
    }

    def generateReportByOrden() {
        println params.id
        def parametros = ['idOrden' : params.id?.toInteger()]
        println parametros
        def reportDef = new JasperReportDef(name:'notaOrden.jasper',fileFormat:JasperExportFormat.PDF_FORMAT, parameters:parametros)
        println reportDef.getFilePath()
        def data = jasperService.generateReport(reportDef)

        response.setHeader("Content-disposition", "attachment; filename=notaVenta.pdf");
        response.contentType = "application/pdf"
        response.characterEncoding = "UTF-8"
        response.outputStream << data
    }

    def addRefaccion() {
        println "agregando refaccion en orden samsung "
        println params
        println params.lotes
        def htmlRender=''
        def success = true
        def mgs=''
        def detalleOrden = new DetalleOrden()
        if (params) {
            def ordenInstance = Orden.get(params.idOrdenSamsung)
            println "ordenInstance: ${ordenInstance}"
            def refaccionInstance = Refaccion.get(params.refaccion.id)
            def refaccionAlmacenInstance = RefaccionAlmacen.get(params.lotes)
            println "refaccion almacen instance " +refaccionAlmacenInstance
            detalleOrden.orden = ordenInstance
            detalleOrden.refaccion = refaccionInstance
            detalleOrden.lote = refaccionAlmacenInstance
            detalleOrden.cantidad = params.cantidad as int
            detalleOrden.precio = params.precioUnitario as double
            detalleOrden.total = detalleOrden.cantidad * detalleOrden.precio
            def refCant = refaccionAlmacenInstance.cantidad - detalleOrden.cantidad
            println "*******************" + refCant
            if (refCant < 0) {
                println "no hay refacciones suficientes"
                mgs ="No hay refacciones suficientes"
                htmlRender = ''
            }else{
                detalleOrden.save(failOnError:true)
                htmlRender = "<tr><td><a href=/electronica-adn/detalleOrden/show/"+detalleOrden.id+"><spam>"+detalleOrden+"</<spam></a></td> <td><spam>"+detalleOrden.precio+"</spam></td> <td><spam>"+detalleOrden.cantidad+"</spam></td> <td><spam>"+detalleOrden.total+"</spam></td></tr>"
            }
            // refaccionAlmacenInstance.save()
        }else{
            success = false
        }
        render ([html:htmlRender, success:success , mgs:mgs] as JSON)
    }

    def savePagoShow(){
        println "params "  + params
        def user =springSecurityService.currentUser
        def htmlRender = ''
        def ordenInstance = Orden.get(params.idOrdenSamsungPagos)
        def totalPago = params.totalPago as double
        def success = true

        def pagoClienteInstance = new PagoCliente()
        pagoClienteInstance.orden = ordenInstance
        pagoClienteInstance.recibio = user
        pagoClienteInstance.tipoPago = params.tipoPago
        pagoClienteInstance.total = totalPago
        pagoClienteInstance.fechaPago = new Date()

        if(!pagoClienteInstance.save(failOnError:true,flush:true)){
            success=false
        }

        htmlRender = "<spam class='property-value' aria-labelledby='fechas-label'><a href=/electronica-adn/pagoCliente/show/"+pagoClienteInstance.id+"><spam>"+pagoClienteInstance+"</spam></a>  </spam>"
        println htmlRender
        render ([html:htmlRender, success:success] as JSON)
    }



}
