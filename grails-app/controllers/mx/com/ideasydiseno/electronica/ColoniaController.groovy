package mx.com.ideasydiseno.electronica

import org.springframework.dao.DataIntegrityViolationException

class ColoniaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [coloniaInstanceList: Colonia.list(params), coloniaInstanceTotal: Colonia.count()]
    }

    def create() {
        [coloniaInstance: new Colonia(params)]
    }

    def save() {
        def coloniaInstance = new Colonia(params)
        if (!coloniaInstance.save(flush: true)) {
            render(view: "create", model: [coloniaInstance: coloniaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'colonia.label', default: 'Colonia'), coloniaInstance.id])
        redirect(action: "show", id: coloniaInstance.id)
    }

    def show() {
        def coloniaInstance = Colonia.get(params.id)
        if (!coloniaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'colonia.label', default: 'Colonia'), params.id])
            redirect(action: "list")
            return
        }

        [coloniaInstance: coloniaInstance]
    }

    def edit() {
        def coloniaInstance = Colonia.get(params.id)
        if (!coloniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'colonia.label', default: 'Colonia'), params.id])
            redirect(action: "list")
            return
        }

        [coloniaInstance: coloniaInstance]
    }

    def update() {
        def coloniaInstance = Colonia.get(params.id)
        if (!coloniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'colonia.label', default: 'Colonia'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (coloniaInstance.version > version) {
                coloniaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'colonia.label', default: 'Colonia')] as Object[],
                          "Another user has updated this Colonia while you were editing")
                render(view: "edit", model: [coloniaInstance: coloniaInstance])
                return
            }
        }

        coloniaInstance.properties = params

        if (!coloniaInstance.save(flush: true)) {
            render(view: "edit", model: [coloniaInstance: coloniaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'colonia.label', default: 'Colonia'), coloniaInstance.id])
        redirect(action: "show", id: coloniaInstance.id)
    }

    def delete() {
        def coloniaInstance = Colonia.get(params.id)
        if (!coloniaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'colonia.label', default: 'Colonia'), params.id])
            redirect(action: "list")
            return
        }

        try {
            coloniaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'colonia.label', default: 'Colonia'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'colonia.label', default: 'Colonia'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def cargarColonia() {
        println "INICIA"
        def nombreMunicipio = ''

        new File('./').eachFileRecurse{ println it.path }

        def estadoIntance = Estado.findByNombre(params.estado)
        println params

        if (!estadoIntance) {
            println "Error estado no cargado"
            return
        }
        println "Estado encontrado"

        def colonias = new XmlSlurper().parse(new File("./web-app/${params.estado}.xml"))
        def allRecords = colonias.table.size()

        def municipioInstance
        colonias.table.each( { 
            println it.d_tipo_asenta
            println it.D_mnpio
            println it.d_asenta
            if (nombreMunicipio != it.D_mnpio){
                municipioInstance = new Municipio()
                municipioInstance.estado = estadoIntance
                municipioInstance.nombre = it.D_mnpio
                municipioInstance.nombreCompleto = it.D_mnpio
                if (!municipioInstance.save(flush: true)) {
                    println "Error al guardar municipios" + municipioInstance
                }
                println "Municipio nuevo"
            }
            def coloniaInstance = new Colonia()
            coloniaInstance.municipio = municipioInstance
            coloniaInstance.nombreCompleto = it.d_asenta
            coloniaInstance.tipoColonia = it.d_tipo_asenta
            if (!coloniaInstance.save(flush: true)) {
                println "Error al guardar municipios" + coloniaInstance
            }
            println "Colonia nuevo"
            nombreMunicipio = it.D_mnpio
        })

        println allRecords

        println "FIN"
    }
}
