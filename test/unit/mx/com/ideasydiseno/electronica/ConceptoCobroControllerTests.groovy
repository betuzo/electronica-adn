package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(ConceptoCobroController)
@Mock(ConceptoCobro)
class ConceptoCobroControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/conceptoCobro/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.conceptoCobroInstanceList.size() == 0
        assert model.conceptoCobroInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.conceptoCobroInstance != null
    }

    void testSave() {
        controller.save()

        assert model.conceptoCobroInstance != null
        assert view == '/conceptoCobro/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/conceptoCobro/show/1'
        assert controller.flash.message != null
        assert ConceptoCobro.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptoCobro/list'


        populateValidParams(params)
        def conceptoCobro = new ConceptoCobro(params)

        assert conceptoCobro.save() != null

        params.id = conceptoCobro.id

        def model = controller.show()

        assert model.conceptoCobroInstance == conceptoCobro
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptoCobro/list'


        populateValidParams(params)
        def conceptoCobro = new ConceptoCobro(params)

        assert conceptoCobro.save() != null

        params.id = conceptoCobro.id

        def model = controller.edit()

        assert model.conceptoCobroInstance == conceptoCobro
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptoCobro/list'

        response.reset()


        populateValidParams(params)
        def conceptoCobro = new ConceptoCobro(params)

        assert conceptoCobro.save() != null

        // test invalid parameters in update
        params.id = conceptoCobro.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/conceptoCobro/edit"
        assert model.conceptoCobroInstance != null

        conceptoCobro.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/conceptoCobro/show/$conceptoCobro.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        conceptoCobro.clearErrors()

        populateValidParams(params)
        params.id = conceptoCobro.id
        params.version = -1
        controller.update()

        assert view == "/conceptoCobro/edit"
        assert model.conceptoCobroInstance != null
        assert model.conceptoCobroInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/conceptoCobro/list'

        response.reset()

        populateValidParams(params)
        def conceptoCobro = new ConceptoCobro(params)

        assert conceptoCobro.save() != null
        assert ConceptoCobro.count() == 1

        params.id = conceptoCobro.id

        controller.delete()

        assert ConceptoCobro.count() == 0
        assert ConceptoCobro.get(conceptoCobro.id) == null
        assert response.redirectedUrl == '/conceptoCobro/list'
    }
}
