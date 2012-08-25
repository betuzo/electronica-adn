package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(DetalleOrdenController)
@Mock(DetalleOrden)
class DetalleOrdenControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/detalleOrden/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.detalleOrdenInstanceList.size() == 0
        assert model.detalleOrdenInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.detalleOrdenInstance != null
    }

    void testSave() {
        controller.save()

        assert model.detalleOrdenInstance != null
        assert view == '/detalleOrden/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/detalleOrden/show/1'
        assert controller.flash.message != null
        assert DetalleOrden.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleOrden/list'


        populateValidParams(params)
        def detalleOrden = new DetalleOrden(params)

        assert detalleOrden.save() != null

        params.id = detalleOrden.id

        def model = controller.show()

        assert model.detalleOrdenInstance == detalleOrden
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleOrden/list'


        populateValidParams(params)
        def detalleOrden = new DetalleOrden(params)

        assert detalleOrden.save() != null

        params.id = detalleOrden.id

        def model = controller.edit()

        assert model.detalleOrdenInstance == detalleOrden
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleOrden/list'

        response.reset()


        populateValidParams(params)
        def detalleOrden = new DetalleOrden(params)

        assert detalleOrden.save() != null

        // test invalid parameters in update
        params.id = detalleOrden.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/detalleOrden/edit"
        assert model.detalleOrdenInstance != null

        detalleOrden.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/detalleOrden/show/$detalleOrden.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        detalleOrden.clearErrors()

        populateValidParams(params)
        params.id = detalleOrden.id
        params.version = -1
        controller.update()

        assert view == "/detalleOrden/edit"
        assert model.detalleOrdenInstance != null
        assert model.detalleOrdenInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/detalleOrden/list'

        response.reset()

        populateValidParams(params)
        def detalleOrden = new DetalleOrden(params)

        assert detalleOrden.save() != null
        assert DetalleOrden.count() == 1

        params.id = detalleOrden.id

        controller.delete()

        assert DetalleOrden.count() == 0
        assert DetalleOrden.get(detalleOrden.id) == null
        assert response.redirectedUrl == '/detalleOrden/list'
    }
}
