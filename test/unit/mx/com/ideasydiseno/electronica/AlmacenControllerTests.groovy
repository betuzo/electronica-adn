package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(AlmacenController)
@Mock(Almacen)
class AlmacenControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/almacen/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.almacenInstanceList.size() == 0
        assert model.almacenInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.almacenInstance != null
    }

    void testSave() {
        controller.save()

        assert model.almacenInstance != null
        assert view == '/almacen/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/almacen/show/1'
        assert controller.flash.message != null
        assert Almacen.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/almacen/list'


        populateValidParams(params)
        def almacen = new Almacen(params)

        assert almacen.save() != null

        params.id = almacen.id

        def model = controller.show()

        assert model.almacenInstance == almacen
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/almacen/list'


        populateValidParams(params)
        def almacen = new Almacen(params)

        assert almacen.save() != null

        params.id = almacen.id

        def model = controller.edit()

        assert model.almacenInstance == almacen
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/almacen/list'

        response.reset()


        populateValidParams(params)
        def almacen = new Almacen(params)

        assert almacen.save() != null

        // test invalid parameters in update
        params.id = almacen.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/almacen/edit"
        assert model.almacenInstance != null

        almacen.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/almacen/show/$almacen.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        almacen.clearErrors()

        populateValidParams(params)
        params.id = almacen.id
        params.version = -1
        controller.update()

        assert view == "/almacen/edit"
        assert model.almacenInstance != null
        assert model.almacenInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/almacen/list'

        response.reset()

        populateValidParams(params)
        def almacen = new Almacen(params)

        assert almacen.save() != null
        assert Almacen.count() == 1

        params.id = almacen.id

        controller.delete()

        assert Almacen.count() == 0
        assert Almacen.get(almacen.id) == null
        assert response.redirectedUrl == '/almacen/list'
    }
}
