package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(RefaccionAlmacenController)
@Mock(RefaccionAlmacen)
class RefaccionAlmacenControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/refaccionAlmacen/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.refaccionAlmacenInstanceList.size() == 0
        assert model.refaccionAlmacenInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.refaccionAlmacenInstance != null
    }

    void testSave() {
        controller.save()

        assert model.refaccionAlmacenInstance != null
        assert view == '/refaccionAlmacen/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/refaccionAlmacen/show/1'
        assert controller.flash.message != null
        assert RefaccionAlmacen.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/refaccionAlmacen/list'


        populateValidParams(params)
        def refaccionAlmacen = new RefaccionAlmacen(params)

        assert refaccionAlmacen.save() != null

        params.id = refaccionAlmacen.id

        def model = controller.show()

        assert model.refaccionAlmacenInstance == refaccionAlmacen
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/refaccionAlmacen/list'


        populateValidParams(params)
        def refaccionAlmacen = new RefaccionAlmacen(params)

        assert refaccionAlmacen.save() != null

        params.id = refaccionAlmacen.id

        def model = controller.edit()

        assert model.refaccionAlmacenInstance == refaccionAlmacen
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/refaccionAlmacen/list'

        response.reset()


        populateValidParams(params)
        def refaccionAlmacen = new RefaccionAlmacen(params)

        assert refaccionAlmacen.save() != null

        // test invalid parameters in update
        params.id = refaccionAlmacen.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/refaccionAlmacen/edit"
        assert model.refaccionAlmacenInstance != null

        refaccionAlmacen.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/refaccionAlmacen/show/$refaccionAlmacen.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        refaccionAlmacen.clearErrors()

        populateValidParams(params)
        params.id = refaccionAlmacen.id
        params.version = -1
        controller.update()

        assert view == "/refaccionAlmacen/edit"
        assert model.refaccionAlmacenInstance != null
        assert model.refaccionAlmacenInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/refaccionAlmacen/list'

        response.reset()

        populateValidParams(params)
        def refaccionAlmacen = new RefaccionAlmacen(params)

        assert refaccionAlmacen.save() != null
        assert RefaccionAlmacen.count() == 1

        params.id = refaccionAlmacen.id

        controller.delete()

        assert RefaccionAlmacen.count() == 0
        assert RefaccionAlmacen.get(refaccionAlmacen.id) == null
        assert response.redirectedUrl == '/refaccionAlmacen/list'
    }
}
