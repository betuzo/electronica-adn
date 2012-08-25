package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(DetalleFechaEntradaController)
@Mock(DetalleFechaEntrada)
class DetalleFechaEntradaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/detalleFechaEntrada/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.detalleFechaEntradaInstanceList.size() == 0
        assert model.detalleFechaEntradaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.detalleFechaEntradaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.detalleFechaEntradaInstance != null
        assert view == '/detalleFechaEntrada/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/detalleFechaEntrada/show/1'
        assert controller.flash.message != null
        assert DetalleFechaEntrada.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleFechaEntrada/list'


        populateValidParams(params)
        def detalleFechaEntrada = new DetalleFechaEntrada(params)

        assert detalleFechaEntrada.save() != null

        params.id = detalleFechaEntrada.id

        def model = controller.show()

        assert model.detalleFechaEntradaInstance == detalleFechaEntrada
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleFechaEntrada/list'


        populateValidParams(params)
        def detalleFechaEntrada = new DetalleFechaEntrada(params)

        assert detalleFechaEntrada.save() != null

        params.id = detalleFechaEntrada.id

        def model = controller.edit()

        assert model.detalleFechaEntradaInstance == detalleFechaEntrada
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleFechaEntrada/list'

        response.reset()


        populateValidParams(params)
        def detalleFechaEntrada = new DetalleFechaEntrada(params)

        assert detalleFechaEntrada.save() != null

        // test invalid parameters in update
        params.id = detalleFechaEntrada.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/detalleFechaEntrada/edit"
        assert model.detalleFechaEntradaInstance != null

        detalleFechaEntrada.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/detalleFechaEntrada/show/$detalleFechaEntrada.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        detalleFechaEntrada.clearErrors()

        populateValidParams(params)
        params.id = detalleFechaEntrada.id
        params.version = -1
        controller.update()

        assert view == "/detalleFechaEntrada/edit"
        assert model.detalleFechaEntradaInstance != null
        assert model.detalleFechaEntradaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/detalleFechaEntrada/list'

        response.reset()

        populateValidParams(params)
        def detalleFechaEntrada = new DetalleFechaEntrada(params)

        assert detalleFechaEntrada.save() != null
        assert DetalleFechaEntrada.count() == 1

        params.id = detalleFechaEntrada.id

        controller.delete()

        assert DetalleFechaEntrada.count() == 0
        assert DetalleFechaEntrada.get(detalleFechaEntrada.id) == null
        assert response.redirectedUrl == '/detalleFechaEntrada/list'
    }
}
