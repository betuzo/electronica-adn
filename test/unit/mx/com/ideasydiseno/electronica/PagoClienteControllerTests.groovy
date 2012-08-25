package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(PagoClienteController)
@Mock(PagoCliente)
class PagoClienteControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pagoCliente/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pagoClienteInstanceList.size() == 0
        assert model.pagoClienteInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.pagoClienteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pagoClienteInstance != null
        assert view == '/pagoCliente/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pagoCliente/show/1'
        assert controller.flash.message != null
        assert PagoCliente.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pagoCliente/list'


        populateValidParams(params)
        def pagoCliente = new PagoCliente(params)

        assert pagoCliente.save() != null

        params.id = pagoCliente.id

        def model = controller.show()

        assert model.pagoClienteInstance == pagoCliente
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pagoCliente/list'


        populateValidParams(params)
        def pagoCliente = new PagoCliente(params)

        assert pagoCliente.save() != null

        params.id = pagoCliente.id

        def model = controller.edit()

        assert model.pagoClienteInstance == pagoCliente
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pagoCliente/list'

        response.reset()


        populateValidParams(params)
        def pagoCliente = new PagoCliente(params)

        assert pagoCliente.save() != null

        // test invalid parameters in update
        params.id = pagoCliente.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pagoCliente/edit"
        assert model.pagoClienteInstance != null

        pagoCliente.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pagoCliente/show/$pagoCliente.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pagoCliente.clearErrors()

        populateValidParams(params)
        params.id = pagoCliente.id
        params.version = -1
        controller.update()

        assert view == "/pagoCliente/edit"
        assert model.pagoClienteInstance != null
        assert model.pagoClienteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pagoCliente/list'

        response.reset()

        populateValidParams(params)
        def pagoCliente = new PagoCliente(params)

        assert pagoCliente.save() != null
        assert PagoCliente.count() == 1

        params.id = pagoCliente.id

        controller.delete()

        assert PagoCliente.count() == 0
        assert PagoCliente.get(pagoCliente.id) == null
        assert response.redirectedUrl == '/pagoCliente/list'
    }
}
