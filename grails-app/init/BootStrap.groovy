import com.pro3.Role
import com.pro3.User
import com.pro3.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def clientRole = new Role(authority: 'ROLE_CLIENT').save()
        def vendorRole = new Role(authority: 'ROLE_VENDOR').save()

        UserRole.create new User(username: 'admin', password: 'admin').save(), adminRole
        UserRole.create new User(username: 'user', password: 'user').save(), userRole
        UserRole.create new User(username: 'client', password: 'client').save(), clientRole
        UserRole.create new User(username: 'vendor', password: 'vendor').save(), vendorRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 4
        assert Role.count() == 4
        assert UserRole.count() == 4
    }
    def destroy = {
    }
}
