package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoPersonalController)
@Mock(TipoPersonal)
class TipoPersonalControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoPersonal/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoPersonalInstanceList.size() == 0
        assert model.tipoPersonalInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tipoPersonalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoPersonalInstance != null
        assert view == '/tipoPersonal/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoPersonal/show/1'
        assert controller.flash.message != null
        assert TipoPersonal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPersonal/list'


        populateValidParams(params)
        def tipoPersonal = new TipoPersonal(params)

        assert tipoPersonal.save() != null

        params.id = tipoPersonal.id

        def model = controller.show()

        assert model.tipoPersonalInstance == tipoPersonal
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPersonal/list'


        populateValidParams(params)
        def tipoPersonal = new TipoPersonal(params)

        assert tipoPersonal.save() != null

        params.id = tipoPersonal.id

        def model = controller.edit()

        assert model.tipoPersonalInstance == tipoPersonal
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoPersonal/list'

        response.reset()


        populateValidParams(params)
        def tipoPersonal = new TipoPersonal(params)

        assert tipoPersonal.save() != null

        // test invalid parameters in update
        params.id = tipoPersonal.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoPersonal/edit"
        assert model.tipoPersonalInstance != null

        tipoPersonal.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoPersonal/show/$tipoPersonal.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoPersonal.clearErrors()

        populateValidParams(params)
        params.id = tipoPersonal.id
        params.version = -1
        controller.update()

        assert view == "/tipoPersonal/edit"
        assert model.tipoPersonalInstance != null
        assert model.tipoPersonalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoPersonal/list'

        response.reset()

        populateValidParams(params)
        def tipoPersonal = new TipoPersonal(params)

        assert tipoPersonal.save() != null
        assert TipoPersonal.count() == 1

        params.id = tipoPersonal.id

        controller.delete()

        assert TipoPersonal.count() == 0
        assert TipoPersonal.get(tipoPersonal.id) == null
        assert response.redirectedUrl == '/tipoPersonal/list'
    }
}
