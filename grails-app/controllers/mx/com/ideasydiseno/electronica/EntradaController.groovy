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
        println ("params " + params)
        def user =springSecurityService.currentUser
        def entradaInstance = new Entrada(params)
        if (!entradaInstance.save(flush: true)) {
            render(view: "create", model: [entradaInstance: entradaInstance])
            return
        }else{
            if (user) {
                def tipoFechaInstance = TipoFecha.findByTipoUso(FECHA_TIPO_ENTRADA)
                if (tipoFechaInstance) {
                    //Guardando Detalle fecha entrada
                    def detalleFechaEntrada = new DetalleFechaEntrada()
                    detalleFechaEntrada.fecha = new Date()
                    detalleFechaEntrada.personal= user
                    detalleFechaEntrada.tipoFecha= tipoFechaInstance
                    detalleFechaEntrada.entrada = entradaInstance
                    detalleFechaEntrada.save()



                    //Guardando pago
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
        def user =springSecurityService.currentUser
        println "******" + params
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
            if (user) {
                if (params.tipoFecha != null) {
                    def fechaInstance = TipoFecha.get(params.tipoFecha.id)
                    if (fechaInstance) {
                    //Guardando Detalle fecha entrada
                    def detalleFechaEntrada = new DetalleFechaEntrada()
                    detalleFechaEntrada.fecha = params.fecha
                    detalleFechaEntrada.personal= user
                    detalleFechaEntrada.tipoFecha= fechaInstance
                    detalleFechaEntrada.entrada = entradaInstance
                    detalleFechaEntrada.save()
                 } 
                }
                
                 //Guardando pagos
                if (params.tipoPago != "" && params.totalPago != "0") {
                    def pagoProverdorInstance = new PagoProveedor()
                    pagoProverdorInstance.tipoPago=params.tipoPago
                    pagoProverdorInstance.total=params.totalPago.toLong()
                    pagoProverdorInstance.fechaPago=params.fechaPago
                    pagoProverdorInstance.entrada=entradaInstance
                    pagoProverdorInstance.realizo=user
                    pagoProverdorInstance.save()   
                }
                //Guardando Herramientas




            }
        }
        entradaInstance.properties = params
        println "entradaInstance.properties" + entradaInstance.properties 

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


    def addRefaccion(){
        println ("params refaccion ==> " + params)
        def htmlRender=''
        def user =springSecurityService.currentUser
        def detalleEntrada = new DetalleEntrada()

        def refaccionAlmacen = new RefaccionAlmacen()
        if (params) {
            println ("los params son diferentes de null")
            def entradaInstance = Entrada.get(params.id)
            def refaccionInstance = Refaccion.get(params.refaccion)
            detalleEntrada.entrada= entradaInstance
            detalleEntrada.refaccion= refaccionInstance
            detalleEntrada.cantidad= params.cantidad as int
            detalleEntrada.precioUnitario = params.precio as double
            detalleEntrada.total = detalleEntrada.cantidad * detalleEntrada.precioUnitario 
            detalleEntrada.save()

            refaccionAlmacen.almacen = user?.sucursal?.almacen
            refaccionAlmacen.refaccion = refaccionInstance
            refaccionAlmacen.cantidad = params.cantidad as int
            refaccionAlmacen.precio = params.precio as double
            refaccionAlmacen.entrada = detalleEntrada
            refaccionAlmacen.save()

            println ("refacciones: " + detalleEntrada)
        }
        htmlRender = "<tr><td><a href=/electronica-adn/detalleEntrada/show/"+detalleEntrada.id+"><spam>"+detalleEntrada.refaccion.descripcion+"</<spam></a></td> <td><spam>"+detalleEntrada.precioUnitario+"</spam></td> <td><spam>"+detalleEntrada.cantidad+"</spam></td> <td><spam>"+detalleEntrada.total+"</spam></td></tr>"

        render ([html:htmlRender] as JSON) 
    }

    def saveFechaEntrada(){
        def user =springSecurityService.currentUser
		def htmlRender
        println ("***" + params)

        def fechaInstance = TipoFecha.get(params.tipoFechaEntrada)
        println("fechaInstance: " + fechaInstance )
        def entradaInstance = Entrada.get(params.id)
        println("entradaInstance: " + entradaInstance)
        println("User persona: " + user)
        def fecha = new Date().parse("d/M/yyyy", params.fechaEntrada) 
        println("fecha en date: " + fecha)

        def detalleFechaEntrada = new DetalleFechaEntrada()
            detalleFechaEntrada.fecha = fecha
            detalleFechaEntrada.personal= user
            detalleFechaEntrada.tipoFecha= fechaInstance
            detalleFechaEntrada.entrada = entradaInstance
            detalleFechaEntrada.save()


        println (detalleFechaEntrada.id)
        htmlRender = "<li><a href=/electronica-adn/detalleFechaEntrada/show/"+detalleFechaEntrada.id+"><spam>"+detalleFechaEntrada+"</<spam></a></li>"
        htmlRender = detalleEntrada
        render ([html:htmlRender] as JSON)
    }

    def saveFechaEntradaShow(){
        println("Entra a guardar fecha show")

        def user =springSecurityService.currentUser
        def htmlRender =''
        println ("***" + params)

        def fechaInstance = TipoFecha.get(params.tipoFechaEntrada)
        println("fechaInstance: " + fechaInstance )
        def entradaInstance = Entrada.get(params.id)
        println("entradaInstance: " + entradaInstance)
        println("User persona: " + user)
        def fecha = new Date().parse("d/M/yyyy", params.fechaEntrada) 
        println("fecha en date: " + fecha)

        def detalleFechaEntrada = new DetalleFechaEntrada()
            detalleFechaEntrada.fecha = fecha
            detalleFechaEntrada.personal= user
            detalleFechaEntrada.tipoFecha= fechaInstance
            detalleFechaEntrada.entrada = entradaInstance
            detalleFechaEntrada.save()

        println (detalleFechaEntrada.id)
        htmlRender = "<spam id='delete-detalleFechaEntrada-"+detalleFechaEntrada.id+"' class='property-value' aria-labelledby='fechas-label'><a href=/electronica-adn/detalleFechaEntrada/show/"+detalleFechaEntrada.id+"><spam>"+detalleFechaEntrada+"</spam></a>  <img id='detalleFechaEntrada-"+detalleFechaEntrada.id+"' href='#' class='imgDelete' src='/electronica-adn/static/images/Recycle-Closed.png' alt='Eliminar Fecha' height='20px' width='20px'/> </spam>"
        //htmlRender = 'ola ke ace'
        render ([html:htmlRender] as JSON)
    }

    def savePago(){
        println ("**Pago** ==> " + params)
        def user =springSecurityService.currentUser
        def htmlRender = ''
        def entradaInstance = Entrada.get(params.id)
        def fecha = new Date().parse("d/M/yyyy", params.fechaPago) 
        def totalPago = params.totalPago as int
        
        def pagoProveedor = new PagoProveedor()
        pagoProveedor.realizo=user
        pagoProveedor.entrada=entradaInstance
        pagoProveedor.tipoPago=params.tipoPago
        pagoProveedor.total=totalPago
        pagoProveedor.fechaPago=fecha
        pagoProveedor.save()

        println(pagoProveedor.id)
        htmlRender = "<li><a href=/electronica-adn/pagoProveedor/show/"+pagoProveedor.id+"><spam>"+pagoProveedor+"</<spam></a></li>"

        render ([html:htmlRender] as JSON)   
    }

    def savePagoShow(){
        println ("**Pago** ==> " + params)
        def user =springSecurityService.currentUser
        def htmlRender = ''
        def entradaInstance = Entrada.get(params.id)
        def fecha = new Date().parse("d/M/yyyy", params.fechaPago) 
        def totalPago = params.totalPago as int
        
        def pagoProveedor = new PagoProveedor()
        pagoProveedor.realizo=user
        pagoProveedor.entrada=entradaInstance
        pagoProveedor.tipoPago=params.tipoPago
        pagoProveedor.total=totalPago
        pagoProveedor.fechaPago=fecha
        pagoProveedor.save()

        println(pagoProveedor.id)
        htmlRender = "<spam class='property-value' aria-labelledby='fechas-label'><a href=/electronica-adn/detalleFechaEntrada/show/"+pagoProveedor.id+"><spam>"+pagoProveedor+"</spam></a>  <img id='detalleFechaEntrada-"+pagoProveedor.id+"' href='#' class='imgDelete' src='/electronica-adn/static/images/Recycle-Closed.png' alt='Eliminar Fecha' height='20px' width='20px'/> </spam>"
        render ([html:htmlRender] as JSON)   
    }

    def nextFechaShow(){
        def htmlRender=''
        def imgState='visible'
        def user =springSecurityService.currentUser
        def detalleFechaEntrada = new DetalleFechaEntrada()
        println ("**NEXT FECHA** ==> " + params)
        def entradaInstance = Entrada.get(params.id)
        def totalFechas = entradaInstance.fechas.size()
        def listFechaEntrada = TipoFecha.findAllByTipoUso(FECHA_TIPO_ENTRADA).size()
        if((totalFechas + 1) == listFechaEntrada){
            imgState = 'none'
        }

        println ("Total de fechas" + totalFechas)
        def tipoFechaInstance = TipoFecha.findByOrdenCronologicoAndTipoUso(totalFechas + 1,FECHA_TIPO_ENTRADA)
        println("tamaño de la fecha" + tipoFechaInstance)
                
        if (tipoFechaInstance != null) {
            println("tamaño de la fecha" + tipoFechaInstance)
            println ("*******")
            
            detalleFechaEntrada.fecha = new Date()
            detalleFechaEntrada.personal= user
            detalleFechaEntrada.tipoFecha= tipoFechaInstance
            detalleFechaEntrada.entrada = entradaInstance
            detalleFechaEntrada.save()    
        }


        htmlRender = "<spam id='delete-detalleFechaEntrada-"+detalleFechaEntrada.id+"' class='property-value' aria-labelledby='fechas-label'><a href=/electronica-adn/detalleFechaEntrada/show/"+detalleFechaEntrada.id+"><spam>"+detalleFechaEntrada+"</spam></a></spam>"
        render ([html:htmlRender, img:imgState] as JSON)
    }

    def nextFecha(){
        def htmlRender=''
        def imgState='visible'
        def user =springSecurityService.currentUser
        def detalleFechaEntrada = new DetalleFechaEntrada()
        println ("**NEXT FECHA** ==> " + params)
        def entradaInstance = Entrada.get(params.id)
        def totalFechas = entradaInstance.fechas.size()
        def listFechaEntrada = TipoFecha.findAllByTipoUso(FECHA_TIPO_ENTRADA).size()
        if((totalFechas + 1) == listFechaEntrada){
            imgState = 'none'
        }

        println ("Total de fechas" + totalFechas)
        def tipoFechaInstance = TipoFecha.findByOrdenCronologicoAndTipoUso(totalFechas + 1,FECHA_TIPO_ENTRADA)
        println("tamaño de la fecha" + tipoFechaInstance)
                
        if (tipoFechaInstance != null) {
            println("tamaño de la fecha" + tipoFechaInstance)
            println ("*******")
            
            detalleFechaEntrada.fecha = new Date()
            detalleFechaEntrada.personal= user
            detalleFechaEntrada.tipoFecha= tipoFechaInstance
            detalleFechaEntrada.entrada = entradaInstance
            detalleFechaEntrada.save()    
        }


        htmlRender = "<li><a href=/electronica-adn/detalleFechaEntrada/show/"+detalleFechaEntrada.id+"><spam>"+detalleFechaEntrada+"</<spam></a></li>"
        render ([html:htmlRender, img:imgState] as JSON)
    }

    def hasNext(){
        def htmlRender='visible'
        def entradaInstance = Entrada.get(params.id)
        def totalFechas = entradaInstance.fechas.size()
        def listFechaEntrada = TipoFecha.findAllByTipoUso(FECHA_TIPO_ENTRADA).size()
        if(totalFechas >= listFechaEntrada){
            htmlRender = 'none'
        }
        println ("Lista de fecha entrada: " + listFechaEntrada + "  total de fechas: " + totalFechas + "     " + (totalFechas >= listFechaEntrada))
        render ([html:htmlRender] as JSON)    
    }
}
