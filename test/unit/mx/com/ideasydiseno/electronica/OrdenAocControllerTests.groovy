package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(OrdenAocController)
@Mock(OrdenAoc)
class OrdenAocControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ordenAoc/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ordenAocInstanceList.size() == 0
        assert model.ordenAocInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ordenAocInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ordenAocInstance != null
        assert view == '/ordenAoc/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ordenAoc/show/1'
        assert controller.flash.message != null
        assert OrdenAoc.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenAoc/list'


        populateValidParams(params)
        def ordenAoc = new OrdenAoc(params)

        assert ordenAoc.save() != null

        params.id = ordenAoc.id

        def model = controller.show()

        assert model.ordenAocInstance == ordenAoc
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenAoc/list'


        populateValidParams(params)
        def ordenAoc = new OrdenAoc(params)

        assert ordenAoc.save() != null

        params.id = ordenAoc.id

        def model = controller.edit()

        assert model.ordenAocInstance == ordenAoc
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenAoc/list'

        response.reset()


        populateValidParams(params)
        def ordenAoc = new OrdenAoc(params)

        assert ordenAoc.save() != null

        // test invalid parameters in update
        params.id = ordenAoc.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ordenAoc/edit"
        assert model.ordenAocInstance != null

        ordenAoc.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ordenAoc/show/$ordenAoc.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ordenAoc.clearErrors()

        populateValidParams(params)
        params.id = ordenAoc.id
        params.version = -1
        controller.update()

        assert view == "/ordenAoc/edit"
        assert model.ordenAocInstance != null
        assert model.ordenAocInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ordenAoc/list'

        response.reset()

        populateValidParams(params)
        def ordenAoc = new OrdenAoc(params)

        assert ordenAoc.save() != null
        assert OrdenAoc.count() == 1

        params.id = ordenAoc.id

        controller.delete()

        assert OrdenAoc.count() == 0
        assert OrdenAoc.get(ordenAoc.id) == null
        assert response.redirectedUrl == '/ordenAoc/list'
    }
}
