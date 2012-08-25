package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(OrdenDimoveController)
@Mock(OrdenDimove)
class OrdenDimoveControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ordenDimove/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ordenDimoveInstanceList.size() == 0
        assert model.ordenDimoveInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ordenDimoveInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ordenDimoveInstance != null
        assert view == '/ordenDimove/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ordenDimove/show/1'
        assert controller.flash.message != null
        assert OrdenDimove.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenDimove/list'


        populateValidParams(params)
        def ordenDimove = new OrdenDimove(params)

        assert ordenDimove.save() != null

        params.id = ordenDimove.id

        def model = controller.show()

        assert model.ordenDimoveInstance == ordenDimove
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenDimove/list'


        populateValidParams(params)
        def ordenDimove = new OrdenDimove(params)

        assert ordenDimove.save() != null

        params.id = ordenDimove.id

        def model = controller.edit()

        assert model.ordenDimoveInstance == ordenDimove
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenDimove/list'

        response.reset()


        populateValidParams(params)
        def ordenDimove = new OrdenDimove(params)

        assert ordenDimove.save() != null

        // test invalid parameters in update
        params.id = ordenDimove.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ordenDimove/edit"
        assert model.ordenDimoveInstance != null

        ordenDimove.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ordenDimove/show/$ordenDimove.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ordenDimove.clearErrors()

        populateValidParams(params)
        params.id = ordenDimove.id
        params.version = -1
        controller.update()

        assert view == "/ordenDimove/edit"
        assert model.ordenDimoveInstance != null
        assert model.ordenDimoveInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ordenDimove/list'

        response.reset()

        populateValidParams(params)
        def ordenDimove = new OrdenDimove(params)

        assert ordenDimove.save() != null
        assert OrdenDimove.count() == 1

        params.id = ordenDimove.id

        controller.delete()

        assert OrdenDimove.count() == 0
        assert OrdenDimove.get(ordenDimove.id) == null
        assert response.redirectedUrl == '/ordenDimove/list'
    }
}
