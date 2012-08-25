package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoFechaController)
@Mock(TipoFecha)
class TipoFechaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoFecha/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoFechaInstanceList.size() == 0
        assert model.tipoFechaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tipoFechaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoFechaInstance != null
        assert view == '/tipoFecha/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoFecha/show/1'
        assert controller.flash.message != null
        assert TipoFecha.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoFecha/list'


        populateValidParams(params)
        def tipoFecha = new TipoFecha(params)

        assert tipoFecha.save() != null

        params.id = tipoFecha.id

        def model = controller.show()

        assert model.tipoFechaInstance == tipoFecha
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoFecha/list'


        populateValidParams(params)
        def tipoFecha = new TipoFecha(params)

        assert tipoFecha.save() != null

        params.id = tipoFecha.id

        def model = controller.edit()

        assert model.tipoFechaInstance == tipoFecha
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoFecha/list'

        response.reset()


        populateValidParams(params)
        def tipoFecha = new TipoFecha(params)

        assert tipoFecha.save() != null

        // test invalid parameters in update
        params.id = tipoFecha.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoFecha/edit"
        assert model.tipoFechaInstance != null

        tipoFecha.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoFecha/show/$tipoFecha.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoFecha.clearErrors()

        populateValidParams(params)
        params.id = tipoFecha.id
        params.version = -1
        controller.update()

        assert view == "/tipoFecha/edit"
        assert model.tipoFechaInstance != null
        assert model.tipoFechaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoFecha/list'

        response.reset()

        populateValidParams(params)
        def tipoFecha = new TipoFecha(params)

        assert tipoFecha.save() != null
        assert TipoFecha.count() == 1

        params.id = tipoFecha.id

        controller.delete()

        assert TipoFecha.count() == 0
        assert TipoFecha.get(tipoFecha.id) == null
        assert response.redirectedUrl == '/tipoFecha/list'
    }
}
