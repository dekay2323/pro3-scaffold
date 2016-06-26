import com.pro3.Client
import com.pro3.LineItem
import com.pro3.Project
import com.pro3.RequestItem
import com.pro3.Role
import com.pro3.User
import com.pro3.UserRole
import com.pro3.Vendor
import com.pro3.Wbs
import com.pro3.type.LeadTime
import com.pro3.type.RequestStatus
import com.pro3.type.Strategy

class BootStrap {
    def loremIpsum_Large = """You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder"""

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def testUser = new User(username: 'admin', password: 'admin').save()
        UserRole.create testUser, adminRole
        UserRole.withSession {
            it.flush()
            it.clear()
        }
        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1

        def strategy = Strategy.findOrSaveByName('Sole Source')
        Strategy.findOrSaveByName('Competitive Bid')
        def client = Client.findOrSaveByName('ACME Oilfield Ltd')
        Client.findOrSaveByName('Charlie Construction')
        def leadTime = LeadTime.findOrSaveByName('ARO')
        LeadTime.findOrSaveByName('ARD')
        def status = RequestStatus.findOrSaveByName('Add to Plan')
        RequestStatus.findOrSaveByName('Approved to Plan')
        RequestStatus.findOrSaveByName('RFQ Issued')
        RequestStatus.findOrSaveByName('Bids Recieved')
        RequestStatus.findOrSaveByName('Evaluation Complete')
        RequestStatus.findOrSaveByName('PO Issued')
        def vendor = Vendor.findOrSaveByName('Joe\'s Flooring')
        Vendor.findOrSaveByName('Demian\'s Hardwood')
        def wbs = Wbs.findOrSaveByCode('105.1')
        Wbs.findOrSaveByCode('105.2')
        Wbs.findOrSaveByCode('106.1')

        def project = Project.findByProjectNumber('15-017') ?:
                new Project(projectNumber: '15-017', name: 'New Home Construction', client:client)
        def requestItem = RequestItem.findByReqNumber('15011-01') ?:
                new RequestItem(reqNumber: '15011-01', client: client, description: 'Flooring', budget: 200000,
                        status: status, rasDate: new Date(), estLeadTime: '4w', leadTime: leadTime,
                        strategy: strategy, technicalInstructions: loremIpsum_Large, project: project)
        project.addToRequests(requestItem).save(failOnError:true)
        requestItem.addToBidders(vendor).save(failOnError:true)
        LineItem.findByCode('1') ?:
                new LineItem(code:'1', wbs: wbs, description: 'Dark Chestnut Hardwood Floor - 2.5" wide',
                        quantity: 2500, unitOfMeasure: 'ft2', request: requestItem)
                        .save(failOnError:true)
        LineItem.findByCode('2') ?:
                new LineItem(code:'2', wbs: wbs, description: '0.25" Underlay',
                        quantity: 2500, unitOfMeasure: 'ft2', request: requestItem)
                        .save(failOnError:true)

    }

    def destroy = {
    }
}
