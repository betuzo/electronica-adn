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
        [entradaInstanceList: Entrada.list(params)]
    }

    def create() {
        [entradaInstance: new Entrada(params)]
    }

    def save() {
        def user =springSecurityService.currentUser
        params.total ="0"
        params.status = "Abierto"
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

                    // //Guardando pago
                    // if (params.tipoPago != "" && params.totalPago != "0") {
                    //     def pagoProverdorInstance = new PagoProveedor()
                    //     pagoProverdorInstance.tipoPago=params.tipoPago
                    //     pagoProverdorInstance.total=params.totalPago.toLong()
                    //     pagoProverdorInstance.fechaPago= new Date()
                    //     pagoProverdorInstance.entrada=entradaInstance
                    //     pagoProverdorInstance.realizo=user
                    //     pagoProverdorInstance.save()
                    // }
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

        if (!params) {
            refaccionInstance.refaccion = params.refaccion
            refaccionInstance.cantidad = params.cantidad
            refaccionInstance.precioUnitario=params.precioUnitario
            refaccionInstance.total = params.total
        }

        htmlRender = "<td>hola</td>"
        render ([html:htmlRender] as JSON)
    }

    //Agregando refaccion enEntrada Show
    def addRefaccion(){
        def htmlRender=''
        def success=true
        def user =springSecurityService.currentUser
        def detalleEntrada = new DetalleEntrada()

        if (params) {
            def entradaInstance = Entrada.get(params.idEntradaRefaccion)

            def refaccionInstance = Refaccion.get(params.refaccion.id)
            detalleEntrada.entrada= entradaInstance
            detalleEntrada.refaccion= refaccionInstance
            detalleEntrada.cantidad= params.cantidad  as int
            detalleEntrada.precioUnitario = params.precioUnitario as double
            detalleEntrada.total = detalleEntrada.cantidad * detalleEntrada.precioUnitario
            detalleEntrada.save()
        }
        htmlRender = "<tr><td><a href=/electronica-adn/detalleEntrada/show/"+detalleEntrada.id+"><spam>"+detalleEntrada+"</<spam></a></td> <td><spam>"+detalleEntrada.precioUnitario+"</spam></td> <td><spam>"+detalleEntrada.cantidad+"</spam></td> <td><spam>"+detalleEntrada.total+"</spam></td></tr>"

        render ([html:htmlRender, success:success] as JSON)
    }

    def saveFechaEntrada(){
        def user =springSecurityService.currentUser
		def htmlRender

        def fechaInstance = TipoFecha.get(params.tipoFechaEntrada)
        def entradaInstance = Entrada.get(params.id)
        def fecha = new Date().parse("d/M/yyyy", params.fechaEntrada)

        def detalleFechaEntrada = new DetalleFechaEntrada()
            detalleFechaEntrada.fecha = fecha
            detalleFechaEntrada.personal= user
            detalleFechaEntrada.tipoFecha= fechaInstance
            detalleFechaEntrada.entrada = entradaInstance
            detalleFechaEntrada.save()


        htmlRender = "<li><a href=/electronica-adn/detalleFechaEntrada/show/"+detalleFechaEntrada.id+"><spam>"+detalleFechaEntrada+"</<spam></a></li>"
        htmlRender = detalleEntrada
        render ([html:htmlRender] as JSON)
    }

    def saveFechaEntradaShow(){
        def user =springSecurityService.currentUser
        def htmlRender =''

        def fechaInstance = TipoFecha.get(params.tipoFechaEntrada)
        def entradaInstance = Entrada.get(params.id)
        def fecha = new Date().parse("d/M/yyyy", params.fechaEntrada)

        def detalleFechaEntrada = new DetalleFechaEntrada()
            detalleFechaEntrada.fecha = fecha
            detalleFechaEntrada.personal= user
            detalleFechaEntrada.tipoFecha= fechaInstance
            detalleFechaEntrada.entrada = entradaInstance
            detalleFechaEntrada.save()

        htmlRender = "<spam id='delete-detalleFechaEntrada-"+detalleFechaEntrada.id+"' class='property-value' aria-labelledby='fechas-label'><a href=/electronica-adn/detalleFechaEntrada/show/"+detalleFechaEntrada.id+"><spam>"+detalleFechaEntrada+"</spam></a>  <img id='detalleFechaEntrada-"+detalleFechaEntrada.id+"' href='#' class='imgDelete' src='/electronica-adn/static/images/Recycle-Closed.png' alt='Eliminar Fecha' height='20px' width='20px'/> </spam>"
        //htmlRender = 'ola ke ace'
        render ([html:htmlRender] as JSON)
    }

    def savePago(){
        def user =springSecurityService.currentUser
        def htmlRender = ''
        def success = true
        def entradaInstance = Entrada.get(params.id)
        //def fecha = new Date().parse("d/M/yyyy", params.fechaPago)
        def totalPago = params.totalPago as double

        def pagoProveedor = new PagoProveedor()
        pagoProveedor.realizo=user
        pagoProveedor.entrada=entradaInstance
        pagoProveedor.tipoPago=params.tipoPago
        pagoProveedor.total=totalPago
        pagoProveedor.fechaPago= new Date()
        pagoProveedor.save()

        htmlRender = "<li><a href=/electronica-adn/pagoProveedor/show/"+pagoProveedor.id+"><spam>"+pagoProveedor+"</<spam></a></li>"

        render ([html:htmlRender, success:success] as JSON)
    }

    def savePagoShow(){
        def user =springSecurityService.currentUser
        def htmlRender = ''
        def entradaInstance = Entrada.get(params.idEntradaPago)
        def totalPago = params.totalPago as double
        def success = true

        def pagoProveedor = new PagoProveedor()
        pagoProveedor.realizo=user
        pagoProveedor.entrada=entradaInstance
        pagoProveedor.tipoPago=params.tipoPago
        pagoProveedor.total=totalPago
        pagoProveedor.fechaPago= new Date()
        if(!pagoProveedor.save(flush:true)){
            success=false
        }

        htmlRender = "<spam class='property-value' aria-labelledby='fechas-label'><a href=/electronica-adn/detalleFechaEntrada/show/"+pagoProveedor.id+"><spam>"+pagoProveedor+"</spam></a>  <img id='detalleFechaEntrada-"+pagoProveedor.id+"' href='#' class='imgDelete' src='/electronica-adn/static/images/Recycle-Closed.png' alt='Eliminar Fecha' height='20px' width='20px'/> </spam>"
        render ([html:htmlRender, success:success] as JSON)
    }

    def nextFechaShow(){
        def htmlRender=''
        def imgState='visible'
        def user =springSecurityService.currentUser
        def detalleFechaEntrada = new DetalleFechaEntrada()
        def entradaInstance = Entrada.get(params.id)
        def totalFechas = entradaInstance.fechas.size()
        def listFechaEntrada = TipoFecha.findAllByTipoUso(FECHA_TIPO_ENTRADA).size()

        if((totalFechas + 1) == listFechaEntrada){
            def refEntrada = entradaInstance?.refacciones

            refEntrada.each{ refDE ->
                def refaccionAlmacen = new RefaccionAlmacen()
                refaccionAlmacen.almacen = user?.sucursal?.almacen
                refaccionAlmacen.refaccion = refDE?.refaccion
                refaccionAlmacen.cantidad = refDE?.cantidad as int
                refaccionAlmacen.precio = refDE?.precioUnitario as double
                refaccionAlmacen.entrada = DetalleEntrada.get(refDE.id)
                refaccionAlmacen.save(failOnError: true)
            }
            //cambiamos estado de la entrada a cerrado
            entradaInstance.status = "Cerrado"
            entradaInstance.save(failOnError:true)
            imgState = 'none'
        }

        def tipoFechaInstance = TipoFecha.findByOrdenCronologicoAndTipoUso(totalFechas + 1,FECHA_TIPO_ENTRADA)
        if (tipoFechaInstance != null) {
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
        def entradaInstance = Entrada.get(params.id)
        def totalFechas = entradaInstance.fechas.size()
        def listFechaEntrada = TipoFecha.findAllByTipoUso(FECHA_TIPO_ENTRADA).size()


        if((totalFechas + 1) == listFechaEntrada){
            imgState = 'none'
        }

        def tipoFechaInstance = TipoFecha.findByOrdenCronologicoAndTipoUso(totalFechas + 1,FECHA_TIPO_ENTRADA)

        if (tipoFechaInstance != null) {

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

        render ([html:htmlRender] as JSON)
    }
}
