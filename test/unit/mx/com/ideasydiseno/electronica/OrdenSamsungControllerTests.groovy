package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(OrdenSamsungController)
@Mock(OrdenSamsung)
class OrdenSamsungControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ordenSamsung/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ordenSamsungInstanceList.size() == 0
        assert model.ordenSamsungInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ordenSamsungInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ordenSamsungInstance != null
        assert view == '/ordenSamsung/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ordenSamsung/show/1'
        assert controller.flash.message != null
        assert OrdenSamsung.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenSamsung/list'


        populateValidParams(params)
        def ordenSamsung = new OrdenSamsung(params)

        assert ordenSamsung.save() != null

        params.id = ordenSamsung.id

        def model = controller.show()

        assert model.ordenSamsungInstance == ordenSamsung
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenSamsung/list'


        populateValidParams(params)
        def ordenSamsung = new OrdenSamsung(params)

        assert ordenSamsung.save() != null

        params.id = ordenSamsung.id

        def model = controller.edit()

        assert model.ordenSamsungInstance == ordenSamsung
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ordenSamsung/list'

        response.reset()


        populateValidParams(params)
        def ordenSamsung = new OrdenSamsung(params)

        assert ordenSamsung.save() != null

        // test invalid parameters in update
        params.id = ordenSamsung.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ordenSamsung/edit"
        assert model.ordenSamsungInstance != null

        ordenSamsung.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ordenSamsung/show/$ordenSamsung.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ordenSamsung.clearErrors()

        populateValidParams(params)
        params.id = ordenSamsung.id
        params.version = -1
        controller.update()

        assert view == "/ordenSamsung/edit"
        assert model.ordenSamsungInstance != null
        assert model.ordenSamsungInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ordenSamsung/list'

        response.reset()

        populateValidParams(params)
        def ordenSamsung = new OrdenSamsung(params)

        assert ordenSamsung.save() != null
        assert OrdenSamsung.count() == 1

        params.id = ordenSamsung.id

        controller.delete()

        assert OrdenSamsung.count() == 0
        assert OrdenSamsung.get(ordenSamsung.id) == null
        assert response.redirectedUrl == '/ordenSamsung/list'
    }
}
