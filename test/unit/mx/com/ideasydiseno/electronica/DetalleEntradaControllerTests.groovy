package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(DetalleEntradaController)
@Mock(DetalleEntrada)
class DetalleEntradaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/detalleEntrada/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.detalleEntradaInstanceList.size() == 0
        assert model.detalleEntradaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.detalleEntradaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.detalleEntradaInstance != null
        assert view == '/detalleEntrada/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/detalleEntrada/show/1'
        assert controller.flash.message != null
        assert DetalleEntrada.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleEntrada/list'


        populateValidParams(params)
        def detalleEntrada = new DetalleEntrada(params)

        assert detalleEntrada.save() != null

        params.id = detalleEntrada.id

        def model = controller.show()

        assert model.detalleEntradaInstance == detalleEntrada
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleEntrada/list'


        populateValidParams(params)
        def detalleEntrada = new DetalleEntrada(params)

        assert detalleEntrada.save() != null

        params.id = detalleEntrada.id

        def model = controller.edit()

        assert model.detalleEntradaInstance == detalleEntrada
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleEntrada/list'

        response.reset()


        populateValidParams(params)
        def detalleEntrada = new DetalleEntrada(params)

        assert detalleEntrada.save() != null

        // test invalid parameters in update
        params.id = detalleEntrada.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/detalleEntrada/edit"
        assert model.detalleEntradaInstance != null

        detalleEntrada.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/detalleEntrada/show/$detalleEntrada.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        detalleEntrada.clearErrors()

        populateValidParams(params)
        params.id = detalleEntrada.id
        params.version = -1
        controller.update()

        assert view == "/detalleEntrada/edit"
        assert model.detalleEntradaInstance != null
        assert model.detalleEntradaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/detalleEntrada/list'

        response.reset()

        populateValidParams(params)
        def detalleEntrada = new DetalleEntrada(params)

        assert detalleEntrada.save() != null
        assert DetalleEntrada.count() == 1

        params.id = detalleEntrada.id

        controller.delete()

        assert DetalleEntrada.count() == 0
        assert DetalleEntrada.get(detalleEntrada.id) == null
        assert response.redirectedUrl == '/detalleEntrada/list'
    }
}
