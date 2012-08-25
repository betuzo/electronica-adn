package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(TelefonoPersonaController)
@Mock(TelefonoPersona)
class TelefonoPersonaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/telefonoPersona/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.telefonoPersonaInstanceList.size() == 0
        assert model.telefonoPersonaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.telefonoPersonaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.telefonoPersonaInstance != null
        assert view == '/telefonoPersona/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/telefonoPersona/show/1'
        assert controller.flash.message != null
        assert TelefonoPersona.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoPersona/list'


        populateValidParams(params)
        def telefonoPersona = new TelefonoPersona(params)

        assert telefonoPersona.save() != null

        params.id = telefonoPersona.id

        def model = controller.show()

        assert model.telefonoPersonaInstance == telefonoPersona
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoPersona/list'


        populateValidParams(params)
        def telefonoPersona = new TelefonoPersona(params)

        assert telefonoPersona.save() != null

        params.id = telefonoPersona.id

        def model = controller.edit()

        assert model.telefonoPersonaInstance == telefonoPersona
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoPersona/list'

        response.reset()


        populateValidParams(params)
        def telefonoPersona = new TelefonoPersona(params)

        assert telefonoPersona.save() != null

        // test invalid parameters in update
        params.id = telefonoPersona.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/telefonoPersona/edit"
        assert model.telefonoPersonaInstance != null

        telefonoPersona.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/telefonoPersona/show/$telefonoPersona.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        telefonoPersona.clearErrors()

        populateValidParams(params)
        params.id = telefonoPersona.id
        params.version = -1
        controller.update()

        assert view == "/telefonoPersona/edit"
        assert model.telefonoPersonaInstance != null
        assert model.telefonoPersonaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/telefonoPersona/list'

        response.reset()

        populateValidParams(params)
        def telefonoPersona = new TelefonoPersona(params)

        assert telefonoPersona.save() != null
        assert TelefonoPersona.count() == 1

        params.id = telefonoPersona.id

        controller.delete()

        assert TelefonoPersona.count() == 0
        assert TelefonoPersona.get(telefonoPersona.id) == null
        assert response.redirectedUrl == '/telefonoPersona/list'
    }
}
