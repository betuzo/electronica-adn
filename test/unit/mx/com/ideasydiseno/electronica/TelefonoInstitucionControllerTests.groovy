package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(TelefonoInstitucionController)
@Mock(TelefonoInstitucion)
class TelefonoInstitucionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/telefonoInstitucion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.telefonoInstitucionInstanceList.size() == 0
        assert model.telefonoInstitucionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.telefonoInstitucionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.telefonoInstitucionInstance != null
        assert view == '/telefonoInstitucion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/telefonoInstitucion/show/1'
        assert controller.flash.message != null
        assert TelefonoInstitucion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoInstitucion/list'


        populateValidParams(params)
        def telefonoInstitucion = new TelefonoInstitucion(params)

        assert telefonoInstitucion.save() != null

        params.id = telefonoInstitucion.id

        def model = controller.show()

        assert model.telefonoInstitucionInstance == telefonoInstitucion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoInstitucion/list'


        populateValidParams(params)
        def telefonoInstitucion = new TelefonoInstitucion(params)

        assert telefonoInstitucion.save() != null

        params.id = telefonoInstitucion.id

        def model = controller.edit()

        assert model.telefonoInstitucionInstance == telefonoInstitucion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoInstitucion/list'

        response.reset()


        populateValidParams(params)
        def telefonoInstitucion = new TelefonoInstitucion(params)

        assert telefonoInstitucion.save() != null

        // test invalid parameters in update
        params.id = telefonoInstitucion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/telefonoInstitucion/edit"
        assert model.telefonoInstitucionInstance != null

        telefonoInstitucion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/telefonoInstitucion/show/$telefonoInstitucion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        telefonoInstitucion.clearErrors()

        populateValidParams(params)
        params.id = telefonoInstitucion.id
        params.version = -1
        controller.update()

        assert view == "/telefonoInstitucion/edit"
        assert model.telefonoInstitucionInstance != null
        assert model.telefonoInstitucionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/telefonoInstitucion/list'

        response.reset()

        populateValidParams(params)
        def telefonoInstitucion = new TelefonoInstitucion(params)

        assert telefonoInstitucion.save() != null
        assert TelefonoInstitucion.count() == 1

        params.id = telefonoInstitucion.id

        controller.delete()

        assert TelefonoInstitucion.count() == 0
        assert TelefonoInstitucion.get(telefonoInstitucion.id) == null
        assert response.redirectedUrl == '/telefonoInstitucion/list'
    }
}
