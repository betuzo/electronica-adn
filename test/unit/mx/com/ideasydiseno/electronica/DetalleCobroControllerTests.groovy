package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(DetalleCobroController)
@Mock(DetalleCobro)
class DetalleCobroControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/detalleCobro/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.detalleCobroInstanceList.size() == 0
        assert model.detalleCobroInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.detalleCobroInstance != null
    }

    void testSave() {
        controller.save()

        assert model.detalleCobroInstance != null
        assert view == '/detalleCobro/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/detalleCobro/show/1'
        assert controller.flash.message != null
        assert DetalleCobro.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleCobro/list'


        populateValidParams(params)
        def detalleCobro = new DetalleCobro(params)

        assert detalleCobro.save() != null

        params.id = detalleCobro.id

        def model = controller.show()

        assert model.detalleCobroInstance == detalleCobro
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleCobro/list'


        populateValidParams(params)
        def detalleCobro = new DetalleCobro(params)

        assert detalleCobro.save() != null

        params.id = detalleCobro.id

        def model = controller.edit()

        assert model.detalleCobroInstance == detalleCobro
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleCobro/list'

        response.reset()


        populateValidParams(params)
        def detalleCobro = new DetalleCobro(params)

        assert detalleCobro.save() != null

        // test invalid parameters in update
        params.id = detalleCobro.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/detalleCobro/edit"
        assert model.detalleCobroInstance != null

        detalleCobro.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/detalleCobro/show/$detalleCobro.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        detalleCobro.clearErrors()

        populateValidParams(params)
        params.id = detalleCobro.id
        params.version = -1
        controller.update()

        assert view == "/detalleCobro/edit"
        assert model.detalleCobroInstance != null
        assert model.detalleCobroInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/detalleCobro/list'

        response.reset()

        populateValidParams(params)
        def detalleCobro = new DetalleCobro(params)

        assert detalleCobro.save() != null
        assert DetalleCobro.count() == 1

        params.id = detalleCobro.id

        controller.delete()

        assert DetalleCobro.count() == 0
        assert DetalleCobro.get(detalleCobro.id) == null
        assert response.redirectedUrl == '/detalleCobro/list'
    }
}
