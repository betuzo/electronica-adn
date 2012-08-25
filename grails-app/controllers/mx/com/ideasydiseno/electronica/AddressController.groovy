package mx.com.ideasydiseno.electronica

class AddressController {

    def index() { }

     def municipioSelected = {
        def municipio = Municipio.get(params.id)
        render g.select(optionKey: 'id', 
                        from: municipio?.colonias, 
                        id: 'colonia', 
                        name: 'colonia.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: params.idColonia)
    }

     def estadoSelected = {
        def estado = Estado.get(params.id)
        render g.select(optionKey: 'id', 
                        from: estado?.municipios, 
                        id: 'municipio', 
                        name: 'municipio.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: params.idMunicipio)
    }

    def paisSelected = {
        def pais = Pais.get(params.id)
        if (params.idEstado == 'null')
            params.idEstado = pais.estados?.toArray()?.getAt(0)?.id
            
        render g.select(optionKey: 'id', 
                        from: pais?.estados, 
                        id: 'estado', 
                        name: 'municipio.estado.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: params.idEstado)
    }
}
