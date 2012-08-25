package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(TiendaController)
@Mock(Tienda)
class TiendaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tienda/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tiendaInstanceList.size() == 0
        assert model.tiendaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tiendaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tiendaInstance != null
        assert view == '/tienda/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tienda/show/1'
        assert controller.flash.message != null
        assert Tienda.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tienda/list'


        populateValidParams(params)
        def tienda = new Tienda(params)

        assert tienda.save() != null

        params.id = tienda.id

        def model = controller.show()

        assert model.tiendaInstance == tienda
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tienda/list'


        populateValidParams(params)
        def tienda = new Tienda(params)

        assert tienda.save() != null

        params.id = tienda.id

        def model = controller.edit()

        assert model.tiendaInstance == tienda
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tienda/list'

        response.reset()


        populateValidParams(params)
        def tienda = new Tienda(params)

        assert tienda.save() != null

        // test invalid parameters in update
        params.id = tienda.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tienda/edit"
        assert model.tiendaInstance != null

        tienda.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tienda/show/$tienda.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tienda.clearErrors()

        populateValidParams(params)
        params.id = tienda.id
        params.version = -1
        controller.update()

        assert view == "/tienda/edit"
        assert model.tiendaInstance != null
        assert model.tiendaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tienda/list'

        response.reset()

        populateValidParams(params)
        def tienda = new Tienda(params)

        assert tienda.save() != null
        assert Tienda.count() == 1

        params.id = tienda.id

        controller.delete()

        assert Tienda.count() == 0
        assert Tienda.get(tienda.id) == null
        assert response.redirectedUrl == '/tienda/list'
    }
}
