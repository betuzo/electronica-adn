package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(OrdenPanasonicController)
@Mock(OrdenPanasonic)
class OrdenPanasonicControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ordenPanasonic/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ordenPanasonicInstanceList.size() == 0
        assert model.ordenPanasonicInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ordenPanasonicInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ordenPanasonicInstance != null
        assert view == '/ordenPanasonic/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ordenPanasonic/show/1'
        assert controller.flash.message != null
        assert OrdenPanasonic.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenPanasonic/list'


        populateValidParams(params)
        def ordenPanasonic = new OrdenPanasonic(params)

        assert ordenPanasonic.save() != null

        params.id = ordenPanasonic.id

        def model = controller.show()

        assert model.ordenPanasonicInstance == ordenPanasonic
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenPanasonic/list'


        populateValidParams(params)
        def ordenPanasonic = new OrdenPanasonic(params)

        assert ordenPanasonic.save() != null

        params.id = ordenPanasonic.id

        def model = controller.edit()

        assert model.ordenPanasonicInstance == ordenPanasonic
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenPanasonic/list'

        response.reset()


        populateValidParams(params)
        def ordenPanasonic = new OrdenPanasonic(params)

        assert ordenPanasonic.save() != null

        // test invalid parameters in update
        params.id = ordenPanasonic.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ordenPanasonic/edit"
        assert model.ordenPanasonicInstance != null

        ordenPanasonic.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ordenPanasonic/show/$ordenPanasonic.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ordenPanasonic.clearErrors()

        populateValidParams(params)
        params.id = ordenPanasonic.id
        params.version = -1
        controller.update()

        assert view == "/ordenPanasonic/edit"
        assert model.ordenPanasonicInstance != null
        assert model.ordenPanasonicInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ordenPanasonic/list'

        response.reset()

        populateValidParams(params)
        def ordenPanasonic = new OrdenPanasonic(params)

        assert ordenPanasonic.save() != null
        assert OrdenPanasonic.count() == 1

        params.id = ordenPanasonic.id

        controller.delete()

        assert OrdenPanasonic.count() == 0
        assert OrdenPanasonic.get(ordenPanasonic.id) == null
        assert response.redirectedUrl == '/ordenPanasonic/list'
    }
}
