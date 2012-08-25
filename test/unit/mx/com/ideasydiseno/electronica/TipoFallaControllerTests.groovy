package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoFallaController)
@Mock(TipoFalla)
class TipoFallaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoFalla/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoFallaInstanceList.size() == 0
        assert model.tipoFallaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tipoFallaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoFallaInstance != null
        assert view == '/tipoFalla/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoFalla/show/1'
        assert controller.flash.message != null
        assert TipoFalla.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoFalla/list'


        populateValidParams(params)
        def tipoFalla = new TipoFalla(params)

        assert tipoFalla.save() != null

        params.id = tipoFalla.id

        def model = controller.show()

        assert model.tipoFallaInstance == tipoFalla
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoFalla/list'


        populateValidParams(params)
        def tipoFalla = new TipoFalla(params)

        assert tipoFalla.save() != null

        params.id = tipoFalla.id

        def model = controller.edit()

        assert model.tipoFallaInstance == tipoFalla
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoFalla/list'

        response.reset()


        populateValidParams(params)
        def tipoFalla = new TipoFalla(params)

        assert tipoFalla.save() != null

        // test invalid parameters in update
        params.id = tipoFalla.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoFalla/edit"
        assert model.tipoFallaInstance != null

        tipoFalla.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoFalla/show/$tipoFalla.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoFalla.clearErrors()

        populateValidParams(params)
        params.id = tipoFalla.id
        params.version = -1
        controller.update()

        assert view == "/tipoFalla/edit"
        assert model.tipoFallaInstance != null
        assert model.tipoFallaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoFalla/list'

        response.reset()

        populateValidParams(params)
        def tipoFalla = new TipoFalla(params)

        assert tipoFalla.save() != null
        assert TipoFalla.count() == 1

        params.id = tipoFalla.id

        controller.delete()

        assert TipoFalla.count() == 0
        assert TipoFalla.get(tipoFalla.id) == null
        assert response.redirectedUrl == '/tipoFalla/list'
    }
}
