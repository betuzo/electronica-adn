package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(RefaccionController)
@Mock(Refaccion)
class RefaccionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/refaccion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.refaccionInstanceList.size() == 0
        assert model.refaccionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.refaccionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.refaccionInstance != null
        assert view == '/refaccion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/refaccion/show/1'
        assert controller.flash.message != null
        assert Refaccion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/refaccion/list'


        populateValidParams(params)
        def refaccion = new Refaccion(params)

        assert refaccion.save() != null

        params.id = refaccion.id

        def model = controller.show()

        assert model.refaccionInstance == refaccion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/refaccion/list'


        populateValidParams(params)
        def refaccion = new Refaccion(params)

        assert refaccion.save() != null

        params.id = refaccion.id

        def model = controller.edit()

        assert model.refaccionInstance == refaccion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/refaccion/list'

        response.reset()


        populateValidParams(params)
        def refaccion = new Refaccion(params)

        assert refaccion.save() != null

        // test invalid parameters in update
        params.id = refaccion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/refaccion/edit"
        assert model.refaccionInstance != null

        refaccion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/refaccion/show/$refaccion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        refaccion.clearErrors()

        populateValidParams(params)
        params.id = refaccion.id
        params.version = -1
        controller.update()

        assert view == "/refaccion/edit"
        assert model.refaccionInstance != null
        assert model.refaccionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/refaccion/list'

        response.reset()

        populateValidParams(params)
        def refaccion = new Refaccion(params)

        assert refaccion.save() != null
        assert Refaccion.count() == 1

        params.id = refaccion.id

        controller.delete()

        assert Refaccion.count() == 0
        assert Refaccion.get(refaccion.id) == null
        assert response.redirectedUrl == '/refaccion/list'
    }
}
