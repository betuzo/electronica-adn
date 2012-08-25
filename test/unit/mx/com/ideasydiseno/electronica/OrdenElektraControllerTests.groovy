package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(OrdenElektraController)
@Mock(OrdenElektra)
class OrdenElektraControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ordenElektra/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ordenElektraInstanceList.size() == 0
        assert model.ordenElektraInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ordenElektraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ordenElektraInstance != null
        assert view == '/ordenElektra/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ordenElektra/show/1'
        assert controller.flash.message != null
        assert OrdenElektra.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenElektra/list'


        populateValidParams(params)
        def ordenElektra = new OrdenElektra(params)

        assert ordenElektra.save() != null

        params.id = ordenElektra.id

        def model = controller.show()

        assert model.ordenElektraInstance == ordenElektra
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenElektra/list'


        populateValidParams(params)
        def ordenElektra = new OrdenElektra(params)

        assert ordenElektra.save() != null

        params.id = ordenElektra.id

        def model = controller.edit()

        assert model.ordenElektraInstance == ordenElektra
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenElektra/list'

        response.reset()


        populateValidParams(params)
        def ordenElektra = new OrdenElektra(params)

        assert ordenElektra.save() != null

        // test invalid parameters in update
        params.id = ordenElektra.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ordenElektra/edit"
        assert model.ordenElektraInstance != null

        ordenElektra.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ordenElektra/show/$ordenElektra.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ordenElektra.clearErrors()

        populateValidParams(params)
        params.id = ordenElektra.id
        params.version = -1
        controller.update()

        assert view == "/ordenElektra/edit"
        assert model.ordenElektraInstance != null
        assert model.ordenElektraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ordenElektra/list'

        response.reset()

        populateValidParams(params)
        def ordenElektra = new OrdenElektra(params)

        assert ordenElektra.save() != null
        assert OrdenElektra.count() == 1

        params.id = ordenElektra.id

        controller.delete()

        assert OrdenElektra.count() == 0
        assert OrdenElektra.get(ordenElektra.id) == null
        assert response.redirectedUrl == '/ordenElektra/list'
    }
}
