
import mx.com.ideasydiseno.electronica.*

class BootStrap {

    def init = { servletContext ->
    	//Roles
        def rolAdmin = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        def rolUser = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)

        //Pais, Estado, Municipio
        def pais = new Pais(nombre:'México', nombreCompleto:'Estados Unidos Mexicanos').save(failOnError:true)

        def estadoH = new Estado(nombre:'Hidalgo', abreviatura:'HGO', pais: pais).save(failOnError:true)
        def estadoM = new Estado(nombre:'Estado de Mexico', abreviatura:'EDOMEX', pais:pais).save(failOnError:true)

        // def municipioH1 = new Municipio(nombre:'Actopan', nombreCompleto:'Actopan Hgo' )
        // def municipioH2 = new Municipio(nombre:'Pachuca', nombreCompleto:'Pachuca de Soto' )
        // def municipioE1 = new Municipio(nombre:'Tultitlán', nombreCompleto:'Tultitlán de Mariano Escobedo')
        // def municipioE2 = new Municipio(nombre:'Ecatepec', nombreCompleto:'Ecatepec de Morelos')

        // estado.addToMunicipios(municipio).save(failOnError:true)
        // estado.addToMunicipios(municipio2).save(failOnError:true)

        // def colonia = new Colonia(nombreCompleto:'Centro Actopan')
        // def colonia2 = new Colonia(nombreCompleto:'Centro Mizquiahuala')
        // municipio.addToColonias(colonia).save(failOnError:true)
        // municipio2.addToColonias(colonia2).save(failOnError:true)
    }
    def destroy = {
    }
}
