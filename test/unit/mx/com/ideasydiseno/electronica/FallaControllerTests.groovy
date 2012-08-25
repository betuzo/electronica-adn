package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(FallaController)
@Mock(Falla)
class FallaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/falla/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fallaInstanceList.size() == 0
        assert model.fallaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.fallaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fallaInstance != null
        assert view == '/falla/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/falla/show/1'
        assert controller.flash.message != null
        assert Falla.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/falla/list'


        populateValidParams(params)
        def falla = new Falla(params)

        assert falla.save() != null

        params.id = falla.id

        def model = controller.show()

        assert model.fallaInstance == falla
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/falla/list'


        populateValidParams(params)
        def falla = new Falla(params)

        assert falla.save() != null

        params.id = falla.id

        def model = controller.edit()

        assert model.fallaInstance == falla
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/falla/list'

        response.reset()


        populateValidParams(params)
        def falla = new Falla(params)

        assert falla.save() != null

        // test invalid parameters in update
        params.id = falla.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/falla/edit"
        assert model.fallaInstance != null

        falla.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/falla/show/$falla.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        falla.clearErrors()

        populateValidParams(params)
        params.id = falla.id
        params.version = -1
        controller.update()

        assert view == "/falla/edit"
        assert model.fallaInstance != null
        assert model.fallaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/falla/list'

        response.reset()

        populateValidParams(params)
        def falla = new Falla(params)

        assert falla.save() != null
        assert Falla.count() == 1

        params.id = falla.id

        controller.delete()

        assert Falla.count() == 0
        assert Falla.get(falla.id) == null
        assert response.redirectedUrl == '/falla/list'
    }
}
