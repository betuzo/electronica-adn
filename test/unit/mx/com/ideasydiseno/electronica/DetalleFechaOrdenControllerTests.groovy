package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(DetalleFechaOrdenController)
@Mock(DetalleFechaOrden)
class DetalleFechaOrdenControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/detalleFechaOrden/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.detalleFechaOrdenInstanceList.size() == 0
        assert model.detalleFechaOrdenInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.detalleFechaOrdenInstance != null
    }

    void testSave() {
        controller.save()

        assert model.detalleFechaOrdenInstance != null
        assert view == '/detalleFechaOrden/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/detalleFechaOrden/show/1'
        assert controller.flash.message != null
        assert DetalleFechaOrden.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleFechaOrden/list'


        populateValidParams(params)
        def detalleFechaOrden = new DetalleFechaOrden(params)

        assert detalleFechaOrden.save() != null

        params.id = detalleFechaOrden.id

        def model = controller.show()

        assert model.detalleFechaOrdenInstance == detalleFechaOrden
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleFechaOrden/list'


        populateValidParams(params)
        def detalleFechaOrden = new DetalleFechaOrden(params)

        assert detalleFechaOrden.save() != null

        params.id = detalleFechaOrden.id

        def model = controller.edit()

        assert model.detalleFechaOrdenInstance == detalleFechaOrden
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleFechaOrden/list'

        response.reset()


        populateValidParams(params)
        def detalleFechaOrden = new DetalleFechaOrden(params)

        assert detalleFechaOrden.save() != null

        // test invalid parameters in update
        params.id = detalleFechaOrden.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/detalleFechaOrden/edit"
        assert model.detalleFechaOrdenInstance != null

        detalleFechaOrden.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/detalleFechaOrden/show/$detalleFechaOrden.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        detalleFechaOrden.clearErrors()

        populateValidParams(params)
        params.id = detalleFechaOrden.id
        params.version = -1
        controller.update()

        assert view == "/detalleFechaOrden/edit"
        assert model.detalleFechaOrdenInstance != null
        assert model.detalleFechaOrdenInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/detalleFechaOrden/list'

        response.reset()

        populateValidParams(params)
        def detalleFechaOrden = new DetalleFechaOrden(params)

        assert detalleFechaOrden.save() != null
        assert DetalleFechaOrden.count() == 1

        params.id = detalleFechaOrden.id

        controller.delete()

        assert DetalleFechaOrden.count() == 0
        assert DetalleFechaOrden.get(detalleFechaOrden.id) == null
        assert response.redirectedUrl == '/detalleFechaOrden/list'
    }
}
