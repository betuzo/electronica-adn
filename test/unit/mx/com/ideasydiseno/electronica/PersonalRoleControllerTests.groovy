package mx.com.ideasydiseno.electronica



import org.junit.*
import grails.test.mixin.*

@TestFor(PersonalRoleController)
@Mock(PersonalRole)
class PersonalRoleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/personalRole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.personalRoleInstanceList.size() == 0
        assert model.personalRoleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.personalRoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.personalRoleInstance != null
        assert view == '/personalRole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/personalRole/show/1'
        assert controller.flash.message != null
        assert PersonalRole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/personalRole/list'


        populateValidParams(params)
        def personalRole = new PersonalRole(params)

        assert personalRole.save() != null

        params.id = personalRole.id

        def model = controller.show()

        assert model.personalRoleInstance == personalRole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/personalRole/list'


        populateValidParams(params)
        def personalRole = new PersonalRole(params)

        assert personalRole.save() != null

        params.id = personalRole.id

        def model = controller.edit()

        assert model.personalRoleInstance == personalRole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/personalRole/list'

        response.reset()


        populateValidParams(params)
        def personalRole = new PersonalRole(params)

        assert personalRole.save() != null

        // test invalid parameters in update
        params.id = personalRole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/personalRole/edit"
        assert model.personalRoleInstance != null

        personalRole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/personalRole/show/$personalRole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        personalRole.clearErrors()

        populateValidParams(params)
        params.id = personalRole.id
        params.version = -1
        controller.update()

        assert view == "/personalRole/edit"
        assert model.personalRoleInstance != null
        assert model.personalRoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/personalRole/list'

        response.reset()

        populateValidParams(params)
        def personalRole = new PersonalRole(params)

        assert personalRole.save() != null
        assert PersonalRole.count() == 1

        params.id = personalRole.id

        controller.delete()

        assert PersonalRole.count() == 0
        assert PersonalRole.get(personalRole.id) == null
        assert response.redirectedUrl == '/personalRole/list'
    }
}
